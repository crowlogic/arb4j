#!/usr/bin/env python3
"""
Emit the RH proof DAG to a LaTeX document (XeLaTeX/LuaLaTeX + unicode-math).
All math is rendered from the Unicode strings in the DAG verbatim.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path


# Filled in emit() once the DAG is loaded; maps every prose-reference spelling
# (including variants like def:K[T] or lem:ϑ″) to the canonical node id.
REF_MAP: dict = {}


ORDER_SECTIONS = [
    ("Axioms", lambda n: n["kind"] == "axiom"),
    ("Definitions", lambda n: n["kind"] == "definition"),
    ("Lemmas", lambda n: n["kind"] == "lemma"),
    ("Theorems and Corollaries", lambda n: n["kind"] in ("theorem", "corollary", "proposition")),
]

ENV = {
    "axiom": "axiom",
    "definition": "definition",
    "lemma": "lemma",
    "corollary": "corollary",
    "proposition": "proposition",
    "theorem": "theorem",
}


def esc(s: str) -> str:
    """Escape the handful of LaTeX-active characters that may legitimately appear in titles.
    Underscore, caret, and braces are banned from DAG content; they are not handled here."""
    s = s.replace("\\", r"\textbackslash ")
    s = s.replace("&", r"\&")
    s = s.replace("%", r"\%")
    s = s.replace("$", r"\$")
    s = s.replace("#", r"\#")
    s = s.replace("~", r"\textasciitilde ")
    return s


def escape_tex_specials(text: str) -> str:
    """Escape the small set of ASCII TeX-active characters permitted in DAG content.
    Underscore, caret, and braces are disallowed in the DAG and therefore not handled.
    Unicode characters pass through untouched and are rendered by unicode-math/fontspec."""
    out = []
    for ch in text:
        if ch == '\\':
            out.append(r'\textbackslash ')
        elif ch == '&':
            out.append(r'\&')
        elif ch == '%':
            out.append(r'\%')
        elif ch == '$':
            out.append(r'\$')
        elif ch == '#':
            out.append(r'\#')
        elif ch == '~':
            out.append(r'\textasciitilde ')
        else:
            out.append(ch)
    return ''.join(out)


# Patterns that convert prose integrals / evaluation bars / cross-references
# into proper inline LaTeX math.  Applied AFTER escape_tex_specials so backslashes
# we introduce here survive intact.
_REF_RE = re.compile(r"(ax|lem|thm|cor|def|prop):([A-Za-zΘωϑψ0-9*⋆'′″\[\]]+)")
_INT_RE = re.compile(r"∫\s*from\s+(\S+)\s+to\s+(\S+)")
# Expression = one non-whitespace token, optionally extended through operator
# connectives (·, ⋅, ⁄, ∕, /) with surrounding spaces.  The connective set
# stays short on purpose so the match never crosses an ordinary word boundary.
_EVAL_RE = re.compile(
    r"((?:\S+)(?:\s*[·⋅⁄∕/]\s*\S+)*)\s+evaluated\s+from\s+(\S+)\s+to\s+(\S+)"
)


def _canonical_ref(raw: str) -> str | None:
    """Map a prose spelling (e.g. 'def:K[T]', 'lem:ϑ″') to the canonical node id."""
    if raw in REF_MAP:
        return REF_MAP[raw]
    # Normalize known spelling variants.
    alt = raw.replace("[", "").replace("]", "")
    if alt in REF_MAP:
        return REF_MAP[alt]
    alt2 = raw.replace("″", "''")
    if alt2 in REF_MAP:
        return REF_MAP[alt2]
    return None


def format_math(text: str) -> str:
    """Post-process a TeX-escaped body: wrap integrals, add evaluation bars,
    and turn bare node identifiers (ax:HL, lem:Θdiffeo, …) into \ref commands."""
    # 1. Evaluation bars: "EXPR evaluated from A to B" → \(EXPR \big|_{A}^{B}\).
    def eval_sub(m: re.Match) -> str:
        expr, a, b = m.group(1), m.group(2), m.group(3)
        # Strip a trailing punctuation character from b if present so it stays outside math.
        trail = ""
        while b and b[-1] in ",.;:":
            trail = b[-1] + trail
            b = b[:-1]
        return rf"\({expr}\,\big|_{{{a}}}^{{{b}}}\){trail}"

    text = _EVAL_RE.sub(eval_sub, text)

    # 2. Integrals: "∫ from A to B" → \(\int_{A}^{B}\).
    def int_sub(m: re.Match) -> str:
        a, b = m.group(1), m.group(2)
        trail = ""
        while b and b[-1] in ",.;:":
            trail = b[-1] + trail
            b = b[:-1]
        return rf"\(\int_{{{a}}}^{{{b}}}\){trail}"

    text = _INT_RE.sub(int_sub, text)

    # 3. Cross-references: bare node identifiers become \ref{node-...}.
    def ref_sub(m: re.Match) -> str:
        raw = m.group(0)
        canon = _canonical_ref(raw)
        if canon is None:
            return raw
        label = f"node-{canon}".replace(":", "-")
        return rf"\ref{{{label}}}"

    text = _REF_RE.sub(ref_sub, text)
    return text


def emit_statement(text: str) -> str:
    """Emit a statement body. Paragraph breaks on blank lines. Escapes TeX specials
    then applies math/reference formatting."""
    paragraphs = text.split("\n\n")
    return "\n\n".join(
        format_math(escape_tex_specials(p.strip()))
        for p in paragraphs
        if p.strip()
    )


def emit_node(nid: str, node: dict) -> str:
    kind = node["kind"]
    env = ENV[kind]
    name = node["name"]
    label = f"node:{nid}".replace(":", "-")
    parts = []
    parts.append(f"\\begin{{{env}}}[{{{name}}}]\\label{{{label}}}")
    parts.append(emit_statement(node["statement"]))
    parts.append(f"\\end{{{env}}}")
    if kind == "axiom":
        src = node.get("source", "")
        if src:
            parts.append(f"\\noindent\\textit{{Source.}} {src}")
    else:
        proof = node.get("proof")
        if proof:
            parts.append("\\begin{proof}")
            parts.append(emit_statement(proof))
            parts.append("\\end{proof}")
    return "\n".join(parts)


def emit(dag: dict) -> str:
    nodes = dag["nodes"]
    target = dag["target"]
    title = dag.get("title", "")

    # Populate the global reference map: canonical id → canonical id plus known aliases.
    REF_MAP.clear()
    for nid in nodes:
        REF_MAP[nid] = nid
    # Known prose variants.
    if "def:KT" in REF_MAP:
        REF_MAP["def:K[T]"] = "def:KT"
    if "lem:ϑ''" in REF_MAP:
        REF_MAP["lem:ϑ″"] = "lem:ϑ''"
    desc = dag.get("description", "")
    author = dag.get("meta", {}).get("author", "")
    date = dag.get("meta", {}).get("date", "")

    # Topological order: respect DAG deps so each node appears after its deps.
    # Use Kahn's algorithm; ties broken by the insertion order in the JSON.
    from collections import defaultdict, deque
    indeg = {nid: len(node.get("deps", [])) for nid, node in nodes.items()}
    dependents = defaultdict(list)
    for nid, node in nodes.items():
        for dep in node.get("deps", []):
            dependents[dep].append(nid)
    ins_order = list(nodes.keys())
    rank = {nid: i for i, nid in enumerate(ins_order)}
    ready = sorted([nid for nid, d in indeg.items() if d == 0], key=lambda x: rank[x])
    topo = []
    from heapq import heappush, heappop
    heap = [(rank[nid], nid) for nid in ready]
    import heapq
    heapq.heapify(heap)
    while heap:
        _, nid = heapq.heappop(heap)
        topo.append(nid)
        for child in dependents[nid]:
            indeg[child] -= 1
            if indeg[child] == 0:
                heapq.heappush(heap, (rank[child], child))

    out = []
    out.append(r"\documentclass[11pt]{article}")
    out.append(r"\usepackage[margin=1in]{geometry}")
    out.append(r"\usepackage{amsmath,amssymb,amsthm}")
    out.append(r"\usepackage{fontspec}")
    out.append(r"\usepackage{unicode-math}")
    out.append(r"\directlua{luaotfload.add_fallback('mainfallback', { 'STIXGeneral:mode=harf;', 'Latin Modern Math:mode=harf;', 'DejaVu Sans:mode=harf;' })}")
    out.append(r"\setmainfont{DejaVu Serif}[RawFeature={fallback=mainfallback}]")
    out.append(r"\setmathfont{Latin Modern Math}")
    out.append(r"\usepackage{newunicodechar}")
    out.append(r"\newunicodechar{⁄}{/}")
    out.append(r"\usepackage{hyperref}")
    out.append("")
    out.append(r"\newtheorem{theorem}{Theorem}")
    out.append(r"\newtheorem{lemma}[theorem]{Lemma}")
    out.append(r"\newtheorem{corollary}[theorem]{Corollary}")
    out.append(r"\newtheorem{proposition}[theorem]{Proposition}")
    out.append(r"\theoremstyle{definition}")
    out.append(r"\newtheorem{definition}[theorem]{Definition}")
    out.append(r"\newtheorem{axiom}[theorem]{Axiom}")
    out.append("")
    out.append(f"\\title{{{esc(title)}}}")
    if author:
        out.append(f"\\author{{{esc(author)}}}")
    if date:
        out.append(f"\\date{{{esc(date)}}}")
    out.append(r"\begin{document}")
    out.append(r"\maketitle")
    out.append("")
    if desc:
        out.append(r"\begin{abstract}")
        out.append(desc)
        out.append(r"\end{abstract}")
        out.append("")

    for section_name, pred in ORDER_SECTIONS:
        section_nodes = [nid for nid in topo if pred(nodes[nid])]
        if not section_nodes:
            continue
        out.append(f"\\section*{{{section_name}}}")
        for nid in section_nodes:
            out.append(emit_node(nid, nodes[nid]))
            out.append("")

    out.append(r"\end{document}")
    return "\n".join(out)


def main() -> int:
    here = Path(__file__).resolve().parent
    dag_path = here / "RiemannHypothesisProof-DAG.json"
    out_path = here / "RiemannHypothesisViaWarpedStationarity.tex"
    dag = json.loads(dag_path.read_text(encoding="utf-8"))
    tex = emit(dag)
    out_path.write_text(tex, encoding="utf-8")
    print(f"wrote {out_path} ({len(tex)} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
