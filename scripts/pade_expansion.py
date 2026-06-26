"""Adaptive Padé expansion helpers for Python.

This module provides a small, general-purpose API for building diagonal
[m/m] Padé approximants from Maclaurin coefficients and for growing the
order until the approximant value at a target point stabilises within a
requested tolerance.

It is intentionally dependency-light: only ``mpmath`` is required.
The implementation is suitable for use with analytic functions, as well as
for the Riccati/Stieltjes-style verification workflows that the project
already explores in the Arb scripts directory.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable, Iterable, List, Sequence, Tuple

import mpmath as mp


Scalar = mp.mpc | mp.mpf | complex | float | int | str


@dataclass(frozen=True)
class PadeApproximant:
    """A rational approximant with ascending-order polynomial coefficients."""

    numerator: Tuple[Scalar, ...]
    denominator: Tuple[Scalar, ...]

    def evaluate(self, z: Scalar) -> mp.mpc:
        z = mp.mpc(z)
        num = mp.mpc(0)
        for coeff in reversed(self.numerator):
            num = num * z + mp.mpc(coeff)
        den = mp.mpc(0)
        for coeff in reversed(self.denominator):
            den = den * z + mp.mpc(coeff)
        return num / den

    def __call__(self, z: Scalar) -> mp.mpc:
        return self.evaluate(z)


def _as_complex(value: Scalar) -> mp.mpc:
    return mp.mpc(value)


def series_from_function(function: Callable[[Scalar], Scalar], order: int, point: Scalar = 0) -> List[mp.mpc]:
    """Return the Maclaurin series coefficients of ``function`` up to ``order``."""
    if order < 0:
        raise ValueError("order must be non-negative")
    coeffs: List[mp.mpc] = []
    for k in range(order + 1):
        coeffs.append(mp.diff(function, point, k) / mp.factorial(k))
    return coeffs


def build_pade_from_series(series: Iterable[Scalar], m: int, n: int) -> PadeApproximant:
    """Build an [m/n] Padé approximant from the first ``m+n+1`` series terms.

    The coefficients are assumed to be ordered as c_0, c_1, ..., c_{m+n}.
    """
    if m < 0 or n < 0:
        raise ValueError("m and n must be non-negative")

    coeffs = [_as_complex(value) for value in list(series)[: m + n + 1]]
    if len(coeffs) < m + n + 1:
        raise ValueError("series is too short for the requested Padé order")

    if n == 0:
        numerator = tuple(coeffs[: m + 1])
        return PadeApproximant(numerator, (mp.mpc(1),))

    matrix: List[List[mp.mpc]] = []
    rhs: List[mp.mpc] = []
    for row in range(1, n + 1):
        entries: List[mp.mpc] = []
        for col in range(1, n + 1):
            index = m + row - col
            entries.append(coeffs[index] if 0 <= index < len(coeffs) else mp.mpc(0))
        matrix.append(entries)
        rhs.append(-coeffs[m + row])

    q_coeffs = _solve_linear_system(matrix, rhs)
    q = [mp.mpc(1)] + q_coeffs

    numerator: List[mp.mpc] = []
    for k in range(m + 1):
        total = mp.mpc(0)
        for j in range(min(k, n) + 1):
            total += q[j] * coeffs[k - j]
        numerator.append(total)

    return PadeApproximant(tuple(numerator), tuple(q))


def _solve_linear_system(matrix: Sequence[Sequence[Scalar]], rhs: Sequence[Scalar]) -> List[mp.mpc]:
    size = len(matrix)
    if size == 0:
        return []
    if len(rhs) != size:
        raise ValueError("linear system has inconsistent dimensions")

    augmented: List[List[mp.mpc]] = []
    for row, row_values in enumerate(matrix):
        entries = [_as_complex(value) for value in row_values]
        augmented.append(entries + [_as_complex(rhs[row])])

    for col in range(size):
        pivot_row = max(range(col, size), key=lambda row: abs(augmented[row][col]))
        if abs(augmented[pivot_row][col]) == 0:
            raise ValueError("singular Padé system")
        if pivot_row != col:
            augmented[col], augmented[pivot_row] = augmented[pivot_row], augmented[col]
        pivot = augmented[col][col]
        for row in range(col + 1, size):
            factor = augmented[row][col] / pivot
            if factor == 0:
                continue
            for idx in range(col, size + 1):
                augmented[row][idx] -= factor * augmented[col][idx]

    solution = [mp.mpc(0)] * size
    for row in range(size - 1, -1, -1):
        total = augmented[row][size]
        for col in range(row + 1, size):
            total -= augmented[row][col] * solution[col]
        solution[row] = total / augmented[row][row]
    return solution


def adaptive_pade_from_series(
    series: Iterable[Scalar],
    z: Scalar,
    target_tolerance: Scalar,
    max_degree: int = 24,
    initial_degree: int = 1,
    relative: bool = True,
) -> Tuple[PadeApproximant, mp.mpc, int, mp.mpc]:
    """Grow a diagonal Padé approximant until successive values agree.

    The routine builds [k/k] Padé approximants for ``k = initial_degree, ...,
    max_degree`` and stops as soon as the change at the target point ``z`` is
    smaller than ``target_tolerance``. When ``relative=True``, the comparison
    uses a relative scale based on the current value; otherwise it uses an
    absolute tolerance.
    """
    if max_degree < initial_degree:
        raise ValueError("max_degree must be at least initial_degree")

    tolerance = mp.mpf(target_tolerance)
    prev_approximant: PadeApproximant | None = None
    prev_value: mp.mpc | None = None
    prev_degree = 0

    for degree in range(initial_degree, max_degree + 1):
        approximant = build_pade_from_series(series, degree, degree)
        value = approximant.evaluate(z)
        if prev_value is not None:
            diff = abs(value - prev_value)
            if relative:
                scale = max(mp.mpf(1), abs(value), abs(prev_value))
                if diff < tolerance * scale:
                    return approximant, value, degree, diff
            else:
                if diff < tolerance:
                    return approximant, value, degree, diff
        prev_approximant = approximant
        prev_value = value
        prev_degree = degree

    if prev_approximant is None or prev_value is None:
        raise RuntimeError("Padé construction failed before any approximant was formed")
    raise RuntimeError(
        f"Padé converged only up to degree {prev_degree}; target tolerance {target_tolerance} was not met"
    )


def adaptive_pade_from_function(
    function: Callable[[Scalar], Scalar],
    z: Scalar,
    target_tolerance: Scalar,
    order: int = 48,
    max_degree: int = 24,
    initial_degree: int = 1,
    point: Scalar = 0,
    relative: bool = True,
) -> Tuple[PadeApproximant, mp.mpc, int, mp.mpc]:
    """Build an adaptive diagonal Padé approximant directly from a function."""
    series = series_from_function(function, order, point)
    return adaptive_pade_from_series(series, z, target_tolerance, max_degree, initial_degree, relative)


def riccati_example(
    function: Callable[[Scalar], Scalar] = mp.exp,
    t: Scalar = "0.5",
    alpha: Scalar = "1",
    target_tolerance: Scalar = "1e-20",
    order: int = 64,
    max_degree: int = 10,
    initial_degree: int = 1,
) -> Tuple[PadeApproximant, mp.mpc, int, mp.mpc]:
    """Build a Padé approximant for a function at ``z = t**alpha``.

    The helper is intentionally generic: it takes any analytic function and
    grows the diagonal Padé order until the value at the requested point stops
    changing within the requested tolerance. The same pattern is suitable for
    Riccati/Stieltjes work once the relevant series or function is supplied.
    """

    z = mp.mpf(t) ** mp.mpf(alpha)
    return adaptive_pade_from_function(
        function,
        z,
        target_tolerance,
        order=order,
        max_degree=max_degree,
        initial_degree=initial_degree,
    )


if __name__ == "__main__":
    mp.mp.dps = 50
    z = mp.mpf("0.5")
    approximant, value, degree, diff = adaptive_pade_from_function(
        mp.exp,
        z,
        mp.mpf("1e-25"),
        order=64,
        max_degree=10,
        initial_degree=1,
    )
    print(f"[exp] degree={degree} value={value} diff={diff}")
    print(f"[exp] numerator={approximant.numerator}")
    print(f"[exp] denominator={approximant.denominator}")

    riccati_approximant, riccati_value, riccati_degree, riccati_diff = riccati_example()
    print(f"[riccati] degree={riccati_degree} value={riccati_value} diff={riccati_diff}")
    print(f"[riccati] numerator={riccati_approximant.numerator}")
    print(f"[riccati] denominator={riccati_approximant.denominator}")
