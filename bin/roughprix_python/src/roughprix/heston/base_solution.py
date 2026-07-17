"""Base density computation for rough-Heston Fourier pricing.

Evaluates the base characteristic function phi0 (expansion order=0)
and provides panel-quadrature heuristics for the Heston measure.
"""
from __future__ import annotations

import numpy as np


# ---------------------------------------------------------------------------
# Panel heuristics (Heston-measure specific)
# ---------------------------------------------------------------------------

_MEASURE_PANEL_TEMPLATE = np.array([
    0.0, 3.0, 7.0, 12.0, 20.0, 35.0,
    55.0, 80.0, 110.0, 150.0, 200.0,
    270.0, 350.0, 500.0, 700.0, 1000.0,
    1400.0, 2000.0,
])


def _round_up_to_grid(
    x: float,
    grid=(150.0, 250.0, 350.0, 500.0, 700.0, 1000.0),
) -> float:
    for g in grid:
        if x <= g:
            return float(g)
    return float(grid[-1])


def _heuristic_measure_L(T: float, kmax: float) -> float:
    T_eff = max(float(T), 1e-4)
    raw = 160.0 * (1.0 + 0.75 * float(kmax)) / np.sqrt(T_eff)
    return _round_up_to_grid(raw)


def _heuristic_measure_panels(L: float) -> np.ndarray:
    L = float(L)
    panels = _MEASURE_PANEL_TEMPLATE[_MEASURE_PANEL_TEMPLATE < L]
    if len(panels) == 0:
        return np.array([0.0, L], dtype=float)
    if panels[0] != 0.0:
        panels = np.concatenate([[0.0], panels])
    if panels[-1] < L:
        panels = np.concatenate([panels, [L]])
    return panels.astype(float)


def _default_heston_measure_panels(L: float) -> np.ndarray:
    base = np.array([0.0, 5.0, 15.0, 35.0, 75.0, 150.0, 250.0, 400.0, 700.0])
    inner = base[base < L]
    if len(inner) == 0 or inner[0] != 0.0:
        inner = np.concatenate([[0.0], inner])
    if inner[-1] < L:
        inner = np.concatenate([inner, [float(L)]])
    return inner


def _as_strict_panels(panels, L=None) -> np.ndarray:
    from roughprix.fourier import _as_strict_panels as _validate
    if panels is None:
        if L is None:
            raise ValueError("Either panels or L must be provided.")
        panels = _heuristic_measure_panels(float(L))
    return _validate(panels)


def _nested_measure_L_candidates(
    T: float,
    kmax: float,
    *,
    include_heuristic: bool = True,
    max_L: float | None = None,
) -> list[float]:
    """Return L candidates that are exactly _MEASURE_PANEL_TEMPLATE endpoints and nested.

    Starting from the first template endpoint >= min(L0, 100) where L0 is the
    heuristic cutoff, returns all remaining template endpoints up to max_L.
    Because candidates are exact template endpoints, _heuristic_measure_panels
    produces genuinely nested grids as L increases.
    """
    L0 = _heuristic_measure_L(T, kmax)
    endpoints = _MEASURE_PANEL_TEMPLATE[_MEASURE_PANEL_TEMPLATE > 0.0]
    min_start = min(float(L0), 100.0)
    idx_start = int(np.searchsorted(endpoints, min_start, side='left'))
    candidates = endpoints[idx_start:]
    if max_L is not None:
        candidates = candidates[candidates <= float(max_L)]
    return [float(v) for v in candidates]


def _validate_nested_measure_L_candidates(candidates) -> list[float]:
    """Validate and return sorted unique nested template-endpoint L candidates.

    Raises ValueError if any candidate is not a _MEASURE_PANEL_TEMPLATE endpoint
    or if consecutive candidates produce non-nested panel grids.
    """
    cands = sorted(set(float(c) for c in candidates))
    template_set = set(_MEASURE_PANEL_TEMPLATE.tolist())
    for c in cands:
        if c <= 0:
            raise ValueError(f"L candidate {c} must be strictly positive.")
        if c not in template_set:
            raise ValueError(
                f"L candidate {c} is not a _MEASURE_PANEL_TEMPLATE endpoint. "
                "adaptive_panel incremental cache requires L candidates to be nested "
                "panel-template endpoints. Use candidates from _MEASURE_PANEL_TEMPLATE "
                "or disable incremental caching."
            )
    for L_old, L_new in zip(cands[:-1], cands[1:]):
        old = _heuristic_measure_panels(L_old)
        new = _heuristic_measure_panels(L_new)
        if not np.allclose(old, new[: len(old)]):
            raise ValueError(
                "adaptive_panel incremental cache requires L candidates to be nested "
                f"panel-template endpoints. L={L_old} panels are not a prefix of "
                f"L={L_new} panels. Use candidates from _MEASURE_PANEL_TEMPLATE or "
                "disable incremental caching."
            )
    return cands


