#!/usr/bin/env python3
"""Reference parser for the arb4j bibliography.

The Java class ``arb.applications.Bibliography`` is the source of truth for the
project's references: its ``main`` reflects over the declared
``arb.documentation.references.Reference`` records and writes ``docs/refs.bib``
(Java -> BibTeX).

This module implements the reverse direction (BibTeX -> structured references):
it parses ``docs/refs.bib`` into ``Reference`` objects, can re-emit them in the
exact canonical BibTeX form that ``AbstractBibliography.generateCitation``
produces, and can generate the equivalent Java ``Bibliography`` field
declarations.

Run with no arguments to parse ``docs/refs.bib`` and verify that re-emitting the
parsed references reproduces the file byte-for-byte (a round-trip check):

    python3 scripts/reference_parser.py

Emit the Java declarations that correspond to the parsed entries:

    python3 scripts/reference_parser.py --java
"""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass, field
from pathlib import Path

# The canonical field order for each entry type mirrors the LinkedHashMap
# insertion order in each record's getFieldMapping(). generateCitation() only
# emits fields whose value is non-null, in this order.
FIELD_ORDER = {
    "Article": [
        "author", "title", "year", "month", "journal",
        "volume", "pages", "publisher", "address", "number",
    ],
    "Book": [
        "author", "title", "year", "publisher", "address",
        "series", "edition", "volume", "pages", "isbn",
    ],
    "InBook": [
        "author", "title", "booktitle", "year", "chapter", "pages",
        "editor", "publisher", "address", "volume", "number",
        "series", "edition", "isbn", "doi",
    ],
}

# Positional constructor arguments for each record type. Remaining present
# fields are applied through the fluent setters below.
CONSTRUCTOR_ARGS = {
    "Article": ["title", "author", "year", "journal", "volume", "pages"],
    "Book": ["title", "author", "year", "pages"],
    "InBook": ["title", "author", "year", "booktitle", "chapter", "pages"],
}

# BibTeX field name -> fluent setter method name.
SETTER = {
    "publisher": "setPublisher",
    "address": "setAddress",
    "series": "setSeries",
    "edition": "setEdition",
    "volume": "setVolume",
    "isbn": "setIsbn",
    "number": "setNumber",
    "editor": "setEditor",
    "doi": "setDoi",
    "month": "setMonth",
}

REPO_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_BIB = REPO_ROOT / "docs" / "refs.bib"


@dataclass
class Reference:
    """A single parsed BibTeX entry."""

    entry_type: str
    key: str
    fields: dict[str, str] = field(default_factory=dict)

    def ordered_items(self):
        """Yield (name, value) pairs in canonical emission order.

        Any field not present in FIELD_ORDER for this type is appended
        afterwards in insertion order so nothing is silently dropped.
        """
        order = FIELD_ORDER.get(self.entry_type, [])
        seen = set()
        for name in order:
            if name in self.fields:
                seen.add(name)
                yield name, self.fields[name]
        for name, value in self.fields.items():
            if name not in seen:
                yield name, value

    def to_bibtex(self) -> str:
        """Reproduce AbstractBibliography.generateCitation's output."""
        parts = ["@%s{%s," % (self.entry_type, self.key)]
        for name, value in self.ordered_items():
            parts.append("\n %s = {%s}," % (name, value))
        # generateCitation appends a closing "}" then does replace(",}", "}").
        return ("".join(parts) + "}").replace(",}", "}")

    def to_java(self) -> str:
        """Generate the equivalent Java Bibliography field declaration."""
        ctor_args = [_java_string(self.fields.get(name))
                     for name in CONSTRUCTOR_ARGS[self.entry_type]]
        # Drop trailing null constructor arguments where a shorter constructor
        # overload exists (Book(title,author,year) and the pages-carrying
        # Book(title,author,year,pages)).
        if self.entry_type == "Book" and self.fields.get("pages") is None:
            ctor_args = ctor_args[:3]
        expr = "new %s(%s)" % (self.entry_type, ", ".join(ctor_args))
        used = set(CONSTRUCTOR_ARGS[self.entry_type])
        for name, value in self.ordered_items():
            if name in used:
                continue
            setter = SETTER.get(name)
            if setter is None:
                raise ValueError(
                    "no setter for field %r on %s (key %s)"
                    % (name, self.entry_type, self.key))
            expr += ".%s(%s)" % (setter, _java_string(value))
        return "  public static %s %s = %s;" % (self.entry_type, self.key, expr)


def _java_string(value: str | None) -> str:
    if value is None:
        return "null"
    escaped = value.replace("\\", "\\\\").replace("\"", "\\\"")
    return '"%s"' % escaped


def _read_value(text: str, i: int) -> tuple[str, int]:
    """Read a brace-delimited value starting at the opening '{' at index i.

    Returns the inner text (with balanced braces preserved) and the index just
    past the closing '}'.
    """
    assert text[i] == "{"
    depth = 0
    start = i
    while i < len(text):
        c = text[i]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return text[start + 1:i], i + 1
        i += 1
    raise ValueError("unterminated brace value starting at index %d" % start)


def parse(text: str) -> list[Reference]:
    """Parse BibTeX text into a list of Reference objects."""
    refs: list[Reference] = []
    i = 0
    n = len(text)
    while i < n:
        if text[i] != "@":
            i += 1
            continue
        # entry type
        j = i + 1
        while j < n and text[j] != "{":
            j += 1
        entry_type = text[i + 1:j].strip()
        # entry body up to the matching closing brace
        body, i = _read_value(text, j)
        # first token before ',' is the citation key
        comma = body.index(",")
        key = body[:comma].strip()
        rest = body[comma + 1:]
        fields: dict[str, str] = {}
        k = 0
        m = len(rest)
        while k < m:
            # find "name ="
            eq = rest.find("=", k)
            if eq == -1:
                break
            name = rest[k:eq].strip().strip(",").strip()
            # find opening brace of the value
            b = rest.find("{", eq)
            if b == -1:
                break
            value, k = _read_value(rest, b)
            if name:
                fields[name] = value
        refs.append(Reference(entry_type, key, fields))
    return refs


def to_bibtex(refs: list[Reference]) -> str:
    return "\n\n".join(ref.to_bibtex() for ref in refs)


def to_java(refs: list[Reference]) -> str:
    return "\n\n".join(ref.to_java() for ref in refs)


def _verify(bib_path: Path) -> int:
    original = bib_path.read_text(encoding="utf-8")
    refs = parse(original)
    regenerated = to_bibtex(refs)
    if regenerated == original.rstrip("\n") or regenerated == original:
        print("OK: parsed %d references; round-trip reproduces %s exactly"
              % (len(refs), bib_path))
        return 0
    # Report the first differing line to aid debugging.
    orig_lines = original.splitlines()
    new_lines = regenerated.splitlines()
    for idx, (a, b) in enumerate(zip(orig_lines, new_lines), start=1):
        if a != b:
            print("MISMATCH at line %d:\n  original:    %r\n  regenerated: %r"
                  % (idx, a, b), file=sys.stderr)
            break
    else:
        print("MISMATCH: line count differs (%d vs %d)"
              % (len(orig_lines), len(new_lines)), file=sys.stderr)
    return 1


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("bib", nargs="?", default=str(DEFAULT_BIB),
                        help="path to the BibTeX file (default: docs/refs.bib)")
    parser.add_argument("--java", action="store_true",
                        help="emit Java Bibliography field declarations")
    parser.add_argument("--bibtex", action="store_true",
                        help="re-emit the parsed references as canonical BibTeX")
    args = parser.parse_args(argv)

    bib_path = Path(args.bib)
    if args.java:
        print(to_java(parse(bib_path.read_text(encoding="utf-8"))))
        return 0
    if args.bibtex:
        print(to_bibtex(parse(bib_path.read_text(encoding="utf-8"))))
        return 0
    return _verify(bib_path)


if __name__ == "__main__":
    raise SystemExit(main())
