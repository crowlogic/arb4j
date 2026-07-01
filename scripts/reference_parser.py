#!/usr/bin/env python3
"""A reference parser for the arb4j expression language, in Python.

This is a clean, readable reference implementation of the same grammar that the
Java expression compiler ``arb.expressions.Expression`` parses by recursive
descent before it emits JVM bytecode. It parses the Unicode mathematical
notation the compiler accepts into an abstract syntax tree of ``Node`` objects
and can pretty-print that tree back to canonical source, so a parse followed by
a re-print round-trips.

It mirrors the Java parser's method structure and operator precedence exactly:

    resolve                        -> add_and_subtract(exponentiate_mul_div())
    add_and_subtract               -> '+' | '-' (leading '-' negates)
    exponentiate_multiply_divide   -> multiply_and_divide(exponentiate())
    multiply_and_divide            -> '*' '×' '⋅' '·' | '/' '÷' '⁄'
    exponentiate                   -> atom ('^' operand)?
    atom  (Java: resolveOperand)   -> the primary production, see Atom below

The primary/atomic production -- the ``Atom`` the compiler calls
``resolveOperand`` -- recognizes, in this order (matching the Java switch):

    '[' e (',' e)* ']'      vector literal
    '(' e ')'               parenthesized expression
    '∂' operand             derivative
    '∫' operand             integral
    ('∏' | 'Π') operand limit-spec     product
    ('∑' | 'Σ') operand limit-spec     summation
    number                  numeric literal (digits, '.', '∞', vulgar fractions)
    identifier              variable, function call f(...), inverse f⁻¹(...),
                            or an indexed function sequence  name '➔' e

followed by postfix operators: factorial ('!!', rising '₍..₎' / '⋰'),
floor '⌊..⌋', ceiling '⌈..⌉', absolute value '|..|', square-bracket index
'x[i]', and function application 'f(a, b, ...)'.

Run with no arguments to parse the bundled corpus of real expressions taken
from the repository and verify every one round-trips:

    python3 scripts/reference_parser.py

Parse a single expression and print its AST and canonical re-print:

    python3 scripts/reference_parser.py 'Σn➔x^n{n=0…∞}'

The arrow may be written '➔' (U+2794), '→' (U+2192) or ASCII '->'; the range
separator inside a limit specification may be '..', '…' (U+2026) or the ratio
character '∶' style used by the compiler is not covered here.
"""

from __future__ import annotations

import sys
from dataclasses import dataclass, field

# ---------------------------------------------------------------------------
# Character classes, mirroring arb.expressions.Parser / Expression.
# ---------------------------------------------------------------------------

ADD_CHARS = "+₊"
SUB_CHARS = "-₋−"
MUL_CHARS = "*×ₓ⋅·"
DIV_CHARS = "⁄/÷"

# Vulgar-fraction code points the Java parser treats as numeric literals.
VULGAR_FRACTIONS = "¼½¾⅐⅑⅒⅓⅔⅕⅖⅗⅘⅙⅚⅛⅜⅝⅞"

SUBSCRIPT_DIGITS = "₀₁₂₃₄₅₆₇₈₉"
SUBSCRIPT_TO_ASCII = {
    "₀": "0", "₁": "1", "₂": "2", "₃": "3", "₄": "4",
    "₅": "5", "₆": "6", "₇": "7", "₈": "8", "₉": "9",
    "ₐ": "a", "ₑ": "e", "ₕ": "h", "ᵢ": "i", "ⱼ": "j",
    "ₖ": "k", "ₗ": "l", "ₘ": "m", "ₙ": "n", "ₒ": "o",
    "ₚ": "p", "ᵣ": "r", "ₛ": "s", "ₜ": "t", "ᵤ": "u",
    "ᵥ": "v", "ₓ": "x",
}

# The limit-specification range separator is the single character '…' (U+2026).
# It cannot be '..' because '.' is itself a numeric character, so '0..∞' would
# lex as one numeric literal -- exactly as it does in the Java parser, whose
# NAryOperationNode requires '\u2026'.
ARROWS = ("➔", "→", "->")
RANGE_SEPARATORS = ("…",)


def is_alphabetical(ch: str) -> bool:
    return ("a" <= ch <= "z") or ("A" <= ch <= "Z")


def is_greek_or_blackletter(ch: str) -> bool:
    o = ord(ch)
    # Greek and Coptic + Greek Extended, and the mathematical alphanumerics the
    # compiler admits as identifier characters.
    return (0x0370 <= o <= 0x03FF) or (0x1F00 <= o <= 0x1FFF) or (0x1D400 <= o <= 0x1D7FF)


def is_identifier_char(ch: str) -> bool:
    """Mirror Parser.isIdentifyingCharacter(cp, digit=False) plus subscripts."""
    if ch == "" or ch == "\x00":
        return False
    if ch == "Σ":  # explicitly excluded so it can start a summation atom
        return False
    return (
        is_alphabetical(ch)
        or is_greek_or_blackletter(ch)
        or ch in ("ⅈ", "√", "ₐ", "_")
        or ch in SUBSCRIPT_TO_ASCII
        or _is_superscript_letter(ch)
    )


_SUPERSCRIPT_LETTERS = "ⁿⁱ"


def _is_superscript_letter(ch: str) -> bool:
    return ch in _SUPERSCRIPT_LETTERS


def is_numeric(ch: str) -> bool:
    if ch == "" or ch == "\x00":
        return False
    regular = SUBSCRIPT_TO_ASCII.get(ch, ch)
    return regular.isdigit() or ch in (".", "∞") or ch in VULGAR_FRACTIONS


def subscripts_to_regular(text: str) -> str:
    return "".join(SUBSCRIPT_TO_ASCII.get(c, c) for c in text)


# ---------------------------------------------------------------------------
# AST node types. Each __str__ reproduces canonical source for round-tripping.
# ---------------------------------------------------------------------------


class Node:
    """Base class for every parsed node."""

    def neg(self) -> "Node":
        return Unary("-", self)


@dataclass
class Number(Node):
    text: str

    def __str__(self) -> str:
        return self.text


@dataclass
class Variable(Node):
    name: str

    def __str__(self) -> str:
        return self.name


@dataclass
class Binary(Node):
    op: str
    left: Node
    right: Node

    def __str__(self) -> str:
        return "%s%s%s" % (_wrap(self.left, self), self.op, _wrap(self.right, self))


@dataclass
class Unary(Node):
    op: str
    operand: Node

    def __str__(self) -> str:
        return "%s%s" % (self.op, _wrap(self.operand, self))


@dataclass
class Power(Node):
    base: Node
    exponent: Node

    def __str__(self) -> str:
        return "%s^%s" % (_wrap(self.base, self), _atom_str(self.exponent))


@dataclass
class Call(Node):
    name: str
    args: list[Node]

    def __str__(self) -> str:
        return "%s(%s)" % (self.name, ", ".join(str(a) for a in self.args))


@dataclass
class InverseCall(Node):
    name: str
    argument: Node

    def __str__(self) -> str:
        return "%s⁻¹(%s)" % (self.name, self.argument)


@dataclass
class Index(Node):
    target: Node
    index: Node

    def __str__(self) -> str:
        return "%s[%s]" % (_wrap(self.target, self), self.index)


@dataclass
class Vector(Node):
    elements: list[Node]

    def __str__(self) -> str:
        return "[%s]" % ", ".join(str(e) for e in self.elements)


@dataclass
class Arrow(Node):
    """An indexed function sequence  variable ➔ definition."""

    variable: str
    definition: Node

    def __str__(self) -> str:
        return "%s➔%s" % (self.variable, self.definition)


@dataclass
class NAry(Node):
    """A summation ('∑') or product ('∏') over an index range."""

    operator: str  # '∑' or '∏'
    operand: Node  # typically an Arrow
    index: str
    lower: Node
    upper: Node

    def __str__(self) -> str:
        return "%s%s{%s=%s…%s}" % (
            self.operator, self.operand, self.index, self.lower, self.upper)


@dataclass
class Factorial(Node):
    operand: Node

    def __str__(self) -> str:
        return "%s!!" % _wrap(self.operand, self)


@dataclass
class Bracketed(Node):
    """Floor '⌊⌋', ceiling '⌈⌉', or absolute value '||'."""

    open: str
    close: str
    operand: Node

    def __str__(self) -> str:
        return "%s%s%s" % (self.open, self.operand, self.close)


@dataclass
class Definition(Node):
    """A named definition  name ':' definition  (function declaration form)."""

    name: str
    definition: Node

    def __str__(self) -> str:
        return "%s:%s" % (self.name, self.definition)


@dataclass
class Comparison(Node):
    """A relational predicate  lhs OP rhs  (only valid inside 'when')."""

    op: str  # one of = ≠ < ≤ > ≥
    left: Node
    right: Node

    def __str__(self) -> str:
        return "%s%s%s" % (self.left, self.op, self.right)


@dataclass
class When(Node):
    """A piecewise 'when(pred, value, ..., else, default)' expression."""

    cases: list  # list[tuple[Comparison, Node]]
    default: Node

    def __str__(self) -> str:
        parts = []
        for pred, value in self.cases:
            parts.append(str(pred))
            parts.append(str(value))
        parts.append("else")
        parts.append(str(self.default))
        return "when(%s)" % ", ".join(parts)


# Operator precedence used only for deciding when the pretty-printer must
# parenthesize, so re-parsing reproduces the same tree.
_PRECEDENCE = {"+": 1, "-": 1, "*": 2, "/": 2}


def _prec(node: Node) -> int:
    if isinstance(node, Binary):
        return _PRECEDENCE.get(node.op, 0)
    if isinstance(node, (Power, Unary, Factorial, Index, Call, InverseCall,
                         Bracketed, Vector, Number, Variable)):
        return 100
    return 0


def _wrap(child: Node, parent: Node) -> str:
    inner = str(child)
    if isinstance(parent, Binary):
        cp = _prec(child)
        pp = _prec(parent)
        if cp < pp:
            return "(%s)" % inner
        if cp == pp and parent.op in ("-", "/") and child is parent.right and isinstance(child, Binary):
            return "(%s)" % inner
    if isinstance(parent, (Power, Factorial, Index)) and isinstance(child, (Binary, Unary, Power)):
        return "(%s)" % inner
    return inner


def _atom_str(node: Node) -> str:
    if isinstance(node, (Binary, Unary, Arrow)):
        return "(%s)" % node
    return str(node)


# ---------------------------------------------------------------------------
# The recursive-descent parser.
# ---------------------------------------------------------------------------


class ParseError(Exception):
    pass


class Parser:
    def __init__(self, text: str):
        self.text = text
        self.pos = 0
        self.n = len(text)

    # -- cursor primitives, mirroring Expression's character handling --------

    @property
    def ch(self) -> str:
        return self.text[self.pos] if self.pos < self.n else "\x00"

    def skip_spaces(self) -> None:
        while self.pos < self.n and self.text[self.pos] == " ":
            self.pos += 1

    def peek_is(self, *chars: str) -> bool:
        self.skip_spaces()
        return self.ch in chars

    def eat_is(self, *chars: str) -> bool:
        self.skip_spaces()
        if self.ch in chars:
            self.pos += 1
            return True
        return False

    def eat_str(self, s: str) -> bool:
        self.skip_spaces()
        if self.text.startswith(s, self.pos):
            self.pos += len(s)
            return True
        return False

    def require(self, *chars: str) -> None:
        if not self.eat_is(*chars):
            raise ParseError("expected one of %r at position %d in %r (found %r)"
                             % (chars, self.pos, self.text, self.ch))

    def at_end(self) -> bool:
        self.skip_spaces()
        return self.pos >= self.n

    def eat_arrow(self) -> bool:
        self.skip_spaces()
        for a in ARROWS:
            if self.text.startswith(a, self.pos):
                self.pos += len(a)
                return True
        return False

    def eat_range_separator(self) -> None:
        self.skip_spaces()
        for sep in RANGE_SEPARATORS:
            if self.text.startswith(sep, self.pos):
                self.pos += len(sep)
                return
        raise ParseError("expected '..' or '…' at position %d in %r"
                         % (self.pos, self.text))

    # -- top level -----------------------------------------------------------

    def parse(self) -> Node:
        node = self.parse_optional_definition()
        if not self.at_end():
            raise ParseError("unexpected trailing input at position %d in %r (%r)"
                             % (self.pos, self.text, self.ch))
        return node

    def parse_optional_definition(self) -> Node:
        """Handle a leading  name ':'  function-declaration prefix, if present."""
        snapshot = self.pos
        self.skip_spaces()
        if is_identifier_char(self.ch):
            name = self.read_name()
            if self.eat_is(":"):
                # Guard against '≔'/'==' style tokens: a single ':' here starts a
                # declaration definition.
                return Definition(name, self.resolve())
            self.pos = snapshot
        return self.resolve()

    # -- precedence chain, one method per Java method ------------------------

    def resolve(self) -> Node:
        node = self.exponentiate_multiply_divide()
        return self.add_and_subtract(node)

    def add_and_subtract(self, node: Node | None) -> Node | None:
        while True:
            if self.eat_is(*ADD_CHARS):
                node = Binary("+", node, self.exponentiate_multiply_divide())
            elif self.eat_is(*SUB_CHARS):
                rhs = self.exponentiate_multiply_divide()
                node = rhs.neg() if node is None else Binary("-", node, rhs)
            else:
                return node

    def exponentiate_multiply_divide(self) -> Node | None:
        return self.multiply_and_divide(self.exponentiate())

    def multiply_and_divide(self, node: Node | None) -> Node | None:
        while True:
            if self.eat_is(*MUL_CHARS):
                node = Binary("*", node, self.exponentiate())
            elif self.division_ahead():
                self.eat_is(*DIV_CHARS)
                node = Binary("/", node, self.exponentiate())
            else:
                return node

    def division_ahead(self) -> bool:
        self.skip_spaces()
        # '/' is division unless the next character is '∂' (a partial-derivative
        # numerator), matching nextCharacterRepresentsDivision().
        if self.ch not in DIV_CHARS:
            return False
        nxt = self.text[self.pos + 1] if self.pos + 1 < self.n else "\x00"
        return nxt != "∂"

    def exponentiate(self, node: Node | None = None) -> Node | None:
        if node is None:
            node = self.resolve_operand()
        if self.eat_is("^"):
            if self.eat_is("(", "⁽"):
                exponent = self.resolve()
                self.require(")", "⁾")
            else:
                exponent = self.resolve_operand()
            return Power(node, exponent)
        return node

    # -- the Atom production (Java: resolveOperand) --------------------------

    def resolve_operand(self) -> Node | None:
        node: Node | None = None

        if self.eat_is("["):
            node = self.parse_vector()
        elif self.eat_is("(", "⁽"):
            node = self.resolve()
            self.require(")", "⁾")
        elif self.eat_is("∂"):
            node = Unary("∂", self.resolve_operand())
        elif self.eat_is("∫"):
            node = Unary("∫", self.resolve_operand())
        elif self.eat_is("∏", "Π"):
            node = self.parse_nary("∏")
        elif self.eat_is("∑", "Σ"):
            node = self.parse_nary("∑")
        elif is_numeric(self.ch):
            node = self.parse_number()
        elif is_identifier_char(self.ch):
            node = self.parse_identifier_or_arrow()

        return self.resolve_postfix(node)

    def parse_vector(self) -> Vector:
        elements: list[Node] = []
        if not self.peek_is("]"):
            elements.append(self.resolve())
            while self.eat_is(","):
                elements.append(self.resolve())
        self.require("]")
        return Vector(elements)

    def parse_number(self) -> Number:
        start = self.pos
        while is_numeric(self.ch):
            self.pos += 1
        return Number(subscripts_to_regular(self.text[start:self.pos]))

    def read_name(self) -> str:
        start = self.pos
        while self.pos < self.n and is_identifier_char(self.text[self.pos]):
            self.pos += 1
        return subscripts_to_regular(self.text[start:self.pos])

    def parse_identifier_or_arrow(self) -> Node:
        snapshot = self.pos
        name = self.read_name()

        # The 'when' keyword is a piecewise form with its own relational
        # predicates; relational operators exist ONLY inside it (matching
        # WhenNode.parseRelationalOperator), not in the general grammar.
        if name == "when" and self.peek_is("("):
            return self.parse_when()

        # Indexed function sequence:  name ➔ definition
        if self.eat_arrow():
            return Arrow(name, self.resolve())

        # Inverse:  name⁻¹  or  name⁻¹(arg)
        if self.eat_is("⁻"):
            if self.eat_is("¹"):
                if self.eat_is("("):
                    argument = self.resolve()
                    self.require(")")
                    return InverseCall(name, argument)
                return Power(Variable(name), Number("-1"))
            # Not an inverse marker; rewind the stray '⁻'.
            self.pos = snapshot + len(name)

        # Function application:  name(args)
        if self.eat_is("("):
            args = self.parse_argument_list()
            self.require(")")
            return Call(name, args)

        return Variable(name)

    def parse_argument_list(self) -> list[Node]:
        args: list[Node] = []
        if self.peek_is(")"):
            return args
        args.append(self.resolve())
        while self.eat_is(","):
            args.append(self.resolve())
        return args

    RELATIONAL_OPERATORS = ("≠", "!=", "=", "≤", "<=", "≥", ">=", "<", ">")

    def parse_relational_operator(self) -> str:
        self.skip_spaces()
        for op in self.RELATIONAL_OPERATORS:
            if self.text.startswith(op, self.pos):
                self.pos += len(op)
                # Canonicalize the ASCII spellings to their Unicode forms.
                return {"!=": "≠", "<=": "≤", ">=": "≥"}.get(op, op)
        raise ParseError("expected a relational operator at position %d in %r"
                         % (self.pos, self.text))

    def parse_when(self) -> When:
        self.require("(")
        cases: list = []
        default: Node | None = None
        while True:
            self.skip_spaces()
            snapshot = self.pos
            if is_identifier_char(self.ch):
                name = self.read_name()
                if name == "else":
                    self.require(",")
                    default = self.resolve()
                    break
                self.pos = snapshot
            left = self.resolve()
            op = self.parse_relational_operator()
            right = self.resolve()
            self.require(",")
            value = self.resolve()
            cases.append((Comparison(op, left, right), value))
            self.require(",")
        self.require(")")
        return When(cases, default)

    def parse_nary(self, operator: str) -> NAry:
        operand = self.resolve_operand()
        # Limit specification:  '{' name '=' lower ('..'|'…') upper '}'
        self.require("{")
        index = self.read_name()
        self.require("=")
        lower = self.resolve()
        self.eat_range_separator()
        upper = self.resolve()
        self.require("}")
        # If the operand is an arrow its variable is the summation index.
        if isinstance(operand, Arrow) and not index:
            index = operand.variable
        return NAry(operator, operand, index, lower, upper)

    # -- postfix operators ---------------------------------------------------

    def resolve_postfix(self, node: Node | None) -> Node | None:
        node = self.resolve_factorials(node)
        node = self.resolve_bracketed(node, "⌊", "⌋")
        node = self.resolve_bracketed(node, "⌈", "⌉")
        node = self.resolve_absolute_value(node)
        # square-bracket index and function application
        while True:
            if node is not None and self.peek_is("["):
                self.eat_is("[")
                index = self.resolve()
                self.require("]")
                node = Index(node, index)
            elif node is not None and self.peek_is("("):
                self.eat_is("(")
                args = self.parse_argument_list()
                self.require(")")
                node = Call(str(node), args) if isinstance(node, Variable) else _apply(node, args)
            else:
                return node

    def resolve_factorials(self, node: Node | None) -> Node | None:
        if node is None:
            return node
        self.skip_spaces()
        if self.ch == "!":
            nxt = self.text[self.pos + 1] if self.pos + 1 < self.n else "\x00"
            if nxt == "!":
                self.pos += 2
                return Factorial(node)
        return node

    def resolve_bracketed(self, node: Node | None, opening: str, closing: str) -> Node | None:
        if self.eat_is(opening):
            inner = self.resolve()
            self.require(closing)
            return Bracketed(opening, closing, inner)
        return node

    def resolve_absolute_value(self, node: Node | None) -> Node | None:
        # Only open an absolute value when there is no pending left operand,
        # matching the compiler's inAbsoluteValue guard behaviour for the
        # leading-'|' operand position.
        if node is None and self.peek_is("|"):
            self.eat_is("|")
            inner = self.resolve()
            self.require("|")
            return Bracketed("|", "|", inner)
        return node


def _apply(node: Node, args: list[Node]) -> Node:
    # Applying arguments to a non-name expression is represented as a Call whose
    # "name" is the printed form of the callee (rare; kept for completeness).
    return Call(str(node), args)


def parse(text: str) -> Node:
    return Parser(text).parse()


# ---------------------------------------------------------------------------
# Self-test corpus: real expression strings drawn from the repository.
# ---------------------------------------------------------------------------

CORPUS = [
    "x^2",
    "3*x^2+x",
    "3*x^2+x-pi",
    "1/((2*3)^(-2))",
    "floor(√(t/(2*π)))",
    "a(j)*a(k-1-j)",
    "2*x*T(n-1)-T(n-2)",
    "p[0]",
    "p[1]",
    "Σn➔x^n{n=0…∞}",
    "∑k➔a(k)*a(k){k=0…N}",
    "∏i➔(1-x/i){i=1…∞}",
    "-ln(π)*t/2",
    "(-((a-b)*I)/2)",
    "ln(ζ(1/2+I*t))",
    "T:n➔2*x*T(n-1)-T(n-2)",
    "P:3*x^2+x",
    "when(n=0,1, n=1,x, else, 2*x*T(n-1)-T(n-2))",
    "T:n➔when(n=0,1, n=1,x, else, 2*x*T(n-1)-T(n-2))",
    "n➔t➔q➔fracdiff(t^n,t^q)",
]


def _self_test() -> int:
    failures = 0
    for src in CORPUS:
        try:
            tree = parse(src)
        except ParseError as exc:
            print("PARSE FAIL: %r\n    %s" % (src, exc), file=sys.stderr)
            failures += 1
            continue
        reprint = str(tree)
        # A parse of the re-print must yield an equal tree (structural
        # round-trip); textual equality is not required because the printer
        # canonicalizes spacing and redundant parentheses.
        try:
            tree2 = parse(reprint)
        except ParseError as exc:
            print("REPRINT UNPARSEABLE: %r -> %r\n    %s" % (src, reprint, exc),
                  file=sys.stderr)
            failures += 1
            continue
        if str(tree2) != reprint:
            print("ROUND-TRIP MISMATCH:\n  source:  %r\n  print1:  %r\n  print2:  %r"
                  % (src, reprint, str(tree2)), file=sys.stderr)
            failures += 1
        else:
            print("OK  %-40s -> %s" % (src, reprint))
    if failures:
        print("\n%d of %d expressions failed" % (failures, len(CORPUS)), file=sys.stderr)
        return 1
    print("\nOK: all %d expressions parsed and round-tripped" % len(CORPUS))
    return 0


def main(argv: list[str]) -> int:
    if len(argv) > 1:
        src = argv[1]
        tree = parse(src)
        print("source:   %s" % src)
        print("ast:      %r" % tree)
        print("reprint:  %s" % tree)
        return 0
    return _self_test()


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
