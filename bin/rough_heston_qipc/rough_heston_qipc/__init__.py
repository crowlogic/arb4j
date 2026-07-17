"""Quadratic-Implicit Fractional Adams solver for Rough Heston option pricing."""

from ._core import (
    RoughHestonModel,
    RoughHestonParams,
    composite_simpson,
    fgc,
    gauss_legendre,
    quadratic_implicit_corrector,
    riccati_coefficients,
)

__all__ = [
    "RoughHestonModel",
    "RoughHestonParams",
    "composite_simpson",
    "fgc",
    "gauss_legendre",
    "quadratic_implicit_corrector",
    "riccati_coefficients",
]
