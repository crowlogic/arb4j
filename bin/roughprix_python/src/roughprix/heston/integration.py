from __future__ import annotations

import math
from dataclasses import dataclass
from typing import Optional, Union, Literal, Tuple

import numpy as np
try:
    from numba import njit
except ImportError:
    def njit(*args, **kwargs):
        if args and callable(args[0]):
            return args[0]
        def _njit(f):
            return f
        return _njit

import jax
jax.config.update("jax_enable_x64", True)
import jax.numpy as jnp
from jax import lax

KernelType = Literal["regular", "log", "frac", "fraclog"]
ArrayLike = Union[np.ndarray, float, complex, int]


# =========================
# Time grid
# =========================
@dataclass(frozen=True, slots=True)
class TimeGrid:
    """Explicit time grid on [0, T]. Time is the LAST axis in all fields."""
    t: np.ndarray  # shape (J+1,) — kept as numpy for Numba weight builders

    @staticmethod
    def uniform(T: float, J: int) -> "TimeGrid":
        """Uniform grid from 0 to T inclusive with J panels (J+1 nodes)."""
        t = np.linspace(0.0, float(T), int(J) + 1, dtype=float)
        return TimeGrid(t=t)

    @staticmethod
    def graded(T: float, J: int, power: float = 2.0) -> "TimeGrid":
        """Grid clustered near t=0 via t_j = T * (j/J)^power."""
        if power < 1.0:
            raise ValueError("graded grid power must be >= 1")
        x = np.linspace(0.0, 1.0, int(J) + 1, dtype=float)
        t = float(T) * x ** float(power)
        t[0] = 0.0
        t[-1] = float(T)
        return TimeGrid(t=t)

    @staticmethod
    def symmetric_graded(T: float, J: int, power: float = 2.0) -> "TimeGrid":
        """Symmetric power grid clustered near both t=0 and t=T.

        Satisfies t[J-j] = T - t[j], making it suitable for pricing where
        ψ(t) is singular near t=0 and κ(T-t) is singular near t=T.
        """
        T = float(T)
        J = int(J)
        power = float(power)
        if T < 0.0:
            raise ValueError("T must be non-negative")
        if J < 1:
            raise ValueError("J must be >= 1")
        if power < 1.0:
            raise ValueError("symmetric_graded grid power must be >= 1")
        if T == 0.0:
            return TimeGrid(t=np.zeros(J + 1, dtype=float))

        t = np.empty(J + 1, dtype=float)
        mid = J // 2
        x = np.linspace(0.0, 1.0, mid + 1, dtype=float)
        left = 0.5 * T * x ** power
        t[: mid + 1] = left
        for j in range(mid + 1):
            t[J - j] = T - t[j]
        t[0] = 0.0
        t[-1] = T

        if not np.all(np.diff(t) > 0.0):
            raise RuntimeError(
                "symmetric_graded grid construction failed: grid is not strictly increasing"
            )
        return TimeGrid(t=t)

    @property
    def T(self) -> float:
        return float(self.t[-1])

    @property
    def J(self) -> int:
        return int(self.t.size - 1)

    def index_of_time(self, tau: Union[str, float, int], mode: str = "nearest") -> int:
        """
        Map a time designator to a grid index.
        - "T": last node
        - int: treated as an index (validated)
        - float: mapped to nearest (default) or left neighbor
        """
        if isinstance(tau, str):
            if tau.upper() == "T":
                return self.J
            raise ValueError(f"Unrecognized time literal: {tau!r}")

        if isinstance(tau, (int, np.integer)):
            j = int(tau)
            if not (0 <= j <= self.J):
                raise IndexError(f"Index {j} out of range [0, {self.J}]")
            return j

        # float
        tau = float(tau)
        if tau <= self.t[0]:
            return 0
        if tau >= self.t[-1]:
            return self.J
        if mode == "nearest":
            return int(np.argmin(np.abs(self.t - tau)))
        if mode == "left":
            return int(np.searchsorted(self.t, tau, side="right") - 1)
        raise ValueError("mode must be 'nearest' or 'left'")

    # ---- Field helper: evaluate/wrap/broadcast on this grid ----
    def field(
            self,
            obj,
            *,
            dtype=np.complex128,
            has_time_axis: bool | None = None,
    ) -> "Field":
        # normalize to ndarray
        if isinstance(obj, Field):
            if obj.grid is not self:
                raise ValueError("Field belongs to a different grid")
            return obj
        if callable(obj):
            vals = jnp.asarray(obj(self.t), dtype=dtype)
        else:
            vals = jnp.asarray(obj, dtype=dtype)

        # avoid surprise trailing singletons like (N,1) → (N,)
        if vals.ndim > 0 and vals.shape[-1] == 1:
            vals = jnp.squeeze(vals, axis=-1)

        Jp1 = self.t.size

        if has_time_axis is True:
            if vals.shape[-1] != Jp1:
                raise ValueError(f"expected last dim == {Jp1}, got {vals.shape}")
            return Field(vals, self)

        if has_time_axis is None and vals.ndim > 0 and vals.shape[-1] == Jp1:
            return Field(vals, self)

        # broadcast across time by appending the last axis
        bvals = jnp.broadcast_to(vals[..., None], vals.shape + (Jp1,))
        return Field(bvals, self)


# =========================
# Field: values on the grid
# =========================
class Field:
    """
    A function sampled on a TimeGrid.
    Shape convention: values.shape == (..., J+1), where the last axis is time.
    Leading axes are arbitrary batch dims (e.g., z-grid).

    values is stored as a JAX array; use jnp operations throughout.
    Wrap in jax.jit at the call site to compile the full pipeline.
    """
    __array_priority__ = 1000  # let our ufunc wrapper win

    def __init__(self, values, grid: TimeGrid):
        values = jnp.asarray(values)
        if values.shape[-1] != grid.t.size:
            raise ValueError(
                f"Field last dimension must equal grid size {grid.t.size}, got {values.shape}"
            )
        self.values = values
        self.grid = grid

    @staticmethod
    def from_callable(func, grid: TimeGrid, *, dtype=np.complex128) -> "Field":
        """Evaluate func(t) on the given grid and wrap as a Field."""
        vals = jnp.asarray(func(grid.t), dtype=dtype)
        return Field(vals, grid)

    def time_reverse(self):
        return self.grid.field(self.values[..., ::-1], has_time_axis=True)

    # --- unary ops ---
    def __neg__(self):
        return Field(-self.values, self.grid)

    def __pos__(self):
        return Field(+self.values, self.grid)

    def __abs__(self):
        return Field(jnp.abs(self.values), self.grid)

    # --- helpers for binary ops ---
    def _promote_other(self, other: ArrayLike) -> jnp.ndarray:
        """
        Promote scalars/arrays to have time as LAST axis, matching this grid.
        Scalar: return scalar.
        If last dim == J+1: treat as time-sampled and return as-is.
        Else: append a time axis and replicate across time.
        """
        b = jnp.asarray(other)
        Jp1 = self.grid.t.size
        if b.ndim == 0:
            return b
        if b.shape[-1] == Jp1:
            return b
        return jnp.broadcast_to(b[..., None], b.shape + (Jp1,))

    def _align(self, other: "Field | ArrayLike") -> Tuple[jnp.ndarray, jnp.ndarray]:
        a = self.values
        if isinstance(other, Field):
            if other.grid is not self.grid:
                raise ValueError("Fields must share the same grid")
            b = other.values
        else:
            b = self._promote_other(other)
        return a, b

    # --- binary ops ---
    def __add__(self, other):
        a, b = self._align(other)
        return Field(a + b, self.grid)

    def __radd__(self, other):
        a, b = self._align(other)
        return Field(b + a, self.grid)

    def __sub__(self, other):
        a, b = self._align(other)
        return Field(a - b, self.grid)

    def __rsub__(self, other):
        a, b = self._align(other)
        return Field(b - a, self.grid)

    def __mul__(self, other):
        a, b = self._align(other)
        return Field(a * b, self.grid)

    def __rmul__(self, other):
        a, b = self._align(other)
        return Field(b * a, self.grid)

    def __truediv__(self, other):
        a, b = self._align(other)
        return Field(a / b, self.grid)

    def __rtruediv__(self, other):
        a, b = self._align(other)
        return Field(b / a, self.grid)

    # --- numpy ufuncs (np.exp, np.log, ...) with the same auto-promotion ---
    def __array_ufunc__(self, ufunc, method, *inputs, **kwargs):
        if method != "__call__":
            return NotImplemented
        arrays = []
        base_grid = None
        Jp1 = self.grid.t.size
        for x in inputs:
            if isinstance(x, Field):
                if base_grid is None:
                    base_grid = x.grid
                elif x.grid is not base_grid:
                    raise ValueError("All Fields must share the same grid in ufuncs")
                arrays.append(x.values)
            else:
                a = jnp.asarray(x)
                if a.ndim == 0 or (a.ndim > 0 and a.shape[-1] == Jp1):
                    arrays.append(a)  # scalar or already time-sampled
                else:
                    arrays.append(jnp.broadcast_to(a[..., None], a.shape + (Jp1,)))
        out = ufunc(*arrays, **kwargs)
        return Field(out, base_grid or self.grid)

    @property
    def shape(self):
        return self.values.shape

    @property
    def T(self) -> float:
        return self.grid.T  # convenience


# =========================
# Panel primitives for log^k kernels
# =========================

"""
Omega weights: idea and definitions
-----------------------------------
We want (V psi)(t_j) = ∫_{start}^{t_j} K(t_j, s) psi(s) ds on a grid t_0,...,t_J.

On each panel [t_m, t_{m+1}] (a=t_m, b=t_{m+1}, h=b-a) linearly interpolate
  psi(s) ≈ L_m(s) psi_m + R_m(s) psi_{m+1},
with L_m(s) = (b - s)/h and R_m(s) = (s - a)/h.

Define panel weights for node t_j:
  w_L(j,m) = ∫_a^b K(t_j, s) L_m(s) ds,
  w_R(j,m) = ∫_a^b K(t_j, s) R_m(s) ds.
Then the panel contributes w_L(j,m) psi_m + w_R(j,m) psi_{m+1}.
Summing panels m < j gives a strictly lower-triangular matrix Ω with
  (Ω @ psi)[j] = Σ_{m<j} [ w_L(j,m) psi_m + w_R(j,m) psi_{m+1} ].

Regular kernel (K ≡ 1): w_L = w_R = h/2 (trapezoid). We apply in O(J) via two cumsums.

Log^k kernel (K(t_j,s) = log^k(t_j - s)): with u = t_j - s and
  F_{m,k}(u) = ∫ u^m (log u)^k du,
panel primitives are
  I0 = F_{0,k}(t_j - a) - F_{0,k}(t_j - b),
  I1 = t_j * I0 - [ F_{1,k}(t_j - a) - F_{1,k}(t_j - b) ].
Linear-basis weights:
  w_L = (b*I0 - I1)/h,   w_R = (I1 - a*I0)/h.

We precompute Ω once per (grid, start, k) via Numba, keep Ω as JAX array for fast GEMM.
Time is the last axis; Ω acts on it, batching over any leading dimensions.
"""

_U_EPS = 1e-300  # guard for u ~ 0


# -------- numba-jitted primitives used by the weight builder --------
@njit(cache=True, fastmath=False)
def _F_mk_nb(u: float, m: int, k: int) -> float:
    if u <= 0.0:
        return 0.0
    if u < _U_EPS:
        u = _U_EPS
    m1 = m + 1.0
    base = (u ** m1) / m1
    if k == 0:
        return base
    logu = math.log(u)
    Fprev = base
    for r in range(1, k + 1):
        Fcurr = base * (logu ** r) - (r / m1) * Fprev
        Fprev = Fcurr
    return Fprev


@njit(cache=True, fastmath=False)
def _I0_logk_nb(a: float, b: float, t: float, k: int) -> float:
    ua = t - a
    if ua < 0.0:
        ua = 0.0
    ub = t - b
    if ub < 0.0:
        ub = 0.0
    return _F_mk_nb(ua, 0, k) - _F_mk_nb(ub, 0, k)


@njit(cache=True, fastmath=False)
def _I1_logk_nb(a: float, b: float, t: float, k: int) -> float:
    I0 = _I0_logk_nb(a, b, t, k)
    ua = t - a
    if ua < 0.0:
        ua = 0.0
    ub = t - b
    if ub < 0.0:
        ub = 0.0
    return t * I0 - (_F_mk_nb(ua, 1, k) - _F_mk_nb(ub, 1, k))


@njit(cache=True, fastmath=False)
def _build_weights_log_nb(t: np.ndarray, j_start: int, k_order: int) -> np.ndarray:
    """
    Build lower-triangular Omega for log^k kernels with linear product-integration.
    """
    J = t.size - 1
    Omega = np.zeros((J + 1, J + 1), dtype=np.float64)
    for j in range(J + 1):
        tj = t[j]
        if j <= j_start:
            continue
        for m in range(j_start, j):
            a = t[m]
            b = t[m + 1]
            h = b - a
            I0 = _I0_logk_nb(a, b, tj, k_order)
            I1 = _I1_logk_nb(a, b, tj, k_order)
            wL = (b * I0 - I1) / h
            wR = (I1 - a * I0) / h
            Omega[j, m] += wL
            Omega[j, m + 1] += wR
    return Omega


@njit(cache=True, fastmath=False)
def _I0_frac_nb(a: float, b: float, t: float, alpha: float) -> float:
    ua = t - a
    if ua < 0.0:
        ua = 0.0
    ub = t - b
    if ub < 0.0:
        ub = 0.0
    ap1 = alpha + 1.0
    return (ua ** ap1 - ub ** ap1) / ap1


@njit(cache=True, fastmath=False)
def _I1_frac_nb(a: float, b: float, t: float, alpha: float) -> float:
    ua = t - a
    if ua < 0.0:
        ua = 0.0
    ub = t - b
    if ub < 0.0:
        ub = 0.0
    ap1 = alpha + 1.0
    ap2 = alpha + 2.0
    I0 = (ua ** ap1 - ub ** ap1) / ap1
    return t * I0 - (ua ** ap2 - ub ** ap2) / ap2


@njit(cache=True, fastmath=False)
def _build_weights_frac_nb(t: np.ndarray, j_start: int, alpha: float) -> np.ndarray:
    J = t.size - 1
    Omega = np.zeros((J + 1, J + 1), dtype=np.float64)
    for j in range(J + 1):
        tj = t[j]
        if j <= j_start:
            continue
        for m in range(j_start, j):
            a = t[m]
            b = t[m + 1]
            h = b - a
            I0 = _I0_frac_nb(a, b, tj, alpha)
            I1 = _I1_frac_nb(a, b, tj, alpha)
            wL = (b * I0 - I1) / h
            wR = (I1 - a * I0) / h
            Omega[j, m] += wL
            Omega[j, m + 1] += wR
    return Omega


@njit(cache=True, fastmath=False)
def _F_qk_nb(u: float, q: float, k: int) -> float:
    """Antiderivative ∫ u^q log(u)^k du evaluated at u, for q > -1."""
    if u <= 0.0:
        return 0.0
    if u < _U_EPS:
        u = _U_EPS
    q1 = q + 1.0
    base = (u ** q1) / q1
    if k == 0:
        return base
    logu = math.log(u)
    Fprev = base
    for r in range(1, k + 1):
        Fcurr = base * (logu ** r) - (r / q1) * Fprev
        Fprev = Fcurr
    return Fprev


@njit(cache=True, fastmath=False)
def _build_weights_fraclog_nb(t: np.ndarray, j_start: int, q: float, k: int) -> np.ndarray:
    """Build lower-triangular Omega for (t-s)^q log(t-s)^k kernels, q > -1, k >= 1."""
    J = t.size - 1
    Omega = np.zeros((J + 1, J + 1), dtype=np.float64)
    for j in range(J + 1):
        tj = t[j]
        if j <= j_start:
            continue
        for m in range(j_start, j):
            a = t[m]
            b = t[m + 1]
            h = b - a
            ua = tj - a
            if ua < 0.0:
                ua = 0.0
            ub = tj - b
            if ub < 0.0:
                ub = 0.0
            I0 = _F_qk_nb(ua, q, k) - _F_qk_nb(ub, q, k)
            I1 = tj * I0 - (_F_qk_nb(ua, q + 1.0, k) - _F_qk_nb(ub, q + 1.0, k))
            wL = (b * I0 - I1) / h
            wR = (I1 - a * I0) / h
            Omega[j, m] += wL
            Omega[j, m + 1] += wR
    return Omega


# =========================
# Integrate operator
# =========================
class Integrate:
    """
    Grid-aware integration operator with product-integration weights.

    Volterra (cumulative on grid) → returns Field (..., J+1)
    Definite [start, stop]       → returns ndarray (...,)

    Weight matrices are built once via Numba then stored as JAX arrays.
    The matmul path (K @ f) dispatches to jnp.matmul and runs on GPU/TPU
    when JAX is configured with an accelerator backend.
    """

    def __init__(
            self,
            grid: TimeGrid,
            kernel: KernelType = "regular",
            *,
            order: Union[float, int] = 0,
            frac_power: float = 0.0,
            start: Union[float, int, str] = 0,
            stop: Optional[Union[float, int, str]] = None,
            mode: str = "nearest",
            from_: Optional[Union[float, int, str]] = None,
            to: Optional[Union[float, int, str]] = None,
    ):
        if from_ is not None:
            start = from_
        if to is not None:
            stop = to

        if kernel not in ("regular", "log", "frac", "fraclog"):
            raise ValueError("kernel must be 'regular', 'log', 'frac', or 'fraclog'")

        if kernel == "regular":
            order = 0
        elif kernel == "log":
            if order < 1:
                raise ValueError("log kernel requires order >= 1")
            order = int(order)
        elif kernel == "frac":
            if order <= -1.0:
                raise ValueError("frac kernel requires order > -1")
            order = float(order)
        elif kernel == "fraclog":
            if order < 1:
                raise ValueError("fraclog kernel requires order >= 1")
            if frac_power <= -1.0:
                raise ValueError("fraclog kernel requires frac_power > -1")
            order = int(order)

        self.grid = grid
        self.kernel = kernel
        self.order = order
        self.frac_power = float(frac_power) if kernel == "fraclog" else None

        self.j_start = grid.index_of_time(start, mode="nearest")
        self.j_stop = None if stop is None else grid.index_of_time(stop, mode=mode)

        t = self.grid.t
        J = self.grid.J

        if self.kernel == "regular":
            dt = np.diff(t)
            wL = np.zeros(J + 1, dtype=np.float64)
            wR = np.zeros(J + 1, dtype=np.float64)
            if self.j_start < J:
                wL[self.j_start:J] = 0.5 * dt[self.j_start:J]
                wR[self.j_start + 1:J + 1] = 0.5 * dt[self.j_start:J]
            self._wL_jnp = jnp.asarray(wL)
            self._wR_jnp = jnp.asarray(wR)
            self._Omega = None
            self._Omega_jnp = None
            self._Omega_T_C_jnp = None

        elif self.kernel == "log":
            Omega = _build_weights_log_nb(
                t.astype(np.float64),
                int(self.j_start),
                int(self.order),
            )
            self._Omega = Omega
            self._Omega_jnp = jnp.asarray(Omega)
            self._Omega_T_C_jnp = jnp.asarray(Omega.T)
            self._wL_jnp = None
            self._wR_jnp = None

        elif self.kernel == "frac":
            Omega = _build_weights_frac_nb(
                t.astype(np.float64),
                int(self.j_start),
                float(self.order),
            )
            self._Omega = Omega
            self._Omega_jnp = jnp.asarray(Omega)
            self._Omega_T_C_jnp = jnp.asarray(Omega.T)
            self._wL_jnp = None
            self._wR_jnp = None

        else:  # "fraclog"
            Omega = _build_weights_fraclog_nb(
                t.astype(np.float64),
                int(self.j_start),
                float(self.frac_power),
                int(self.order),
            )
            self._Omega = Omega
            self._Omega_jnp = jnp.asarray(Omega)
            self._Omega_T_C_jnp = jnp.asarray(Omega.T)
            self._wL_jnp = None
            self._wR_jnp = None

    def _apply_regular(self, X: jnp.ndarray) -> jnp.ndarray:
        """
        Fast O(J) Volterra apply for regular kernel via cumulative trapezoid.
        X: (..., J+1)
        """
        wL = self._wL_jnp  # (J+1,)
        wR = self._wR_jnp  # (J+1,)
        XL = X * wL
        XR = X * wR
        SL = jnp.cumsum(XL, axis=-1) - XL  # exclusive cumsum
        SR = jnp.cumsum(XR, axis=-1)        # inclusive cumsum
        return SL + SR

    def __matmul__(self, obj: Union[Field, ArrayLike, callable]) -> Union[Field, jnp.ndarray]:
        """
        Apply to Field / callable / ndarray (broadcast to Field).
        Volterra mode → Field (..., J+1)
        Definite mode → jnp.ndarray (...,)
        """
        field = self.grid.field(obj)
        if not isinstance(field, Field) or field.grid is not self.grid:
            raise TypeError("Integrate @ expects a Field/callable/array on this grid")

        X = jnp.asarray(field.values)  # (..., J+1)

        if self.kernel == "regular":
            Y = self._apply_regular(X)  # (..., J+1)
            if self.j_stop is None:
                return Field(Y, self.grid)
            else:
                return Y[..., self.j_stop]

        # log^k / frac / fraclog: GEMM with transposed Omega
        if self.j_stop is None:
            Y = jnp.matmul(X, self._Omega_T_C_jnp)  # (..., J+1)
            return Field(Y, self.grid)
        else:
            j = self.j_stop
            w = self._Omega_jnp[j, : j + 1]  # (j+1,) — static slice
            return jnp.tensordot(X[..., : j + 1], w, axes=([-1], [0]))

    @property
    def weights_matrix(self) -> np.ndarray:
        """Dense lower-triangular product-integration matrix Ω (numpy).

        Available for kernel='log', 'frac', 'fraclog'.
        Raises ValueError for kernel='regular'.
        """
        if self._Omega is None:
            raise ValueError(
                "weights_matrix is not available for kernel='regular'; "
                "use the built-in O(J) cumulative accumulator instead."
            )
        return self._Omega


# =========================
# Linear Volterra solver
# =========================

class LinearVolterraSolver:
    """
    Solve x(t) = rhs(t) + scale * ∫_0^t K(t,s) coeff(s) x(s) ds

    by forward substitution via jax.lax.scan.

    The scan body is O(J) per step (dot product over the weight-matrix row).
    Wrap the caller in jax.jit to compile the scan into a single fused kernel.

    Supports batched complex arrays with time as the last axis.
    """

    def __init__(self, grid: TimeGrid, K: "Integrate", *, scale: complex = 1.0):
        self.grid = grid
        self.scale = complex(scale)
        Omega_np = K.weights_matrix          # raises for kernel='regular'
        self._Omega_jnp = jnp.asarray(Omega_np)
        self._Omega_diag = jnp.diag(self._Omega_jnp)  # (J+1,) — diagonal for implicit term

    def solve(self, rhs, coeff) -> "Field":
        """
        Parameters
        ----------
        rhs   : array-like, callable, or Field (..., J+1)
        coeff : array-like, callable, or Field (..., J+1)

        Returns
        -------
        Field with time as last axis, dtype complex128.
        """
        rhs_f = self.grid.field(rhs)
        coeff_f = self.grid.field(coeff)
        R = jnp.asarray(rhs_f.values, dtype=jnp.complex128)    # (..., J+1)
        C = jnp.asarray(coeff_f.values, dtype=jnp.complex128)  # (..., J+1)
        Omega = self._Omega_jnp       # (J+1, J+1)
        diag = self._Omega_diag       # (J+1,)
        scale = self.scale

        def step(x, j):
            # x[..., k] = 0 for k >= j (not yet computed), so the dot naturally
            # sums only over history k < j; the diagonal term Omega[j,j]*x[j]=0.
            row = Omega[j]                           # (J+1,)  — gather row j
            hist = jnp.sum(row * C * x, axis=-1)    # (...,)
            C_j = C[..., j]                          # (...,)  — dynamic slice
            R_j = R[..., j]                          # (...,)
            denom = 1.0 - scale * diag[j] * C_j
            x_j = (R_j + scale * hist) / denom
            return x.at[..., j].set(x_j), None

        x0 = jnp.zeros_like(R)
        x_final, _ = lax.scan(step, x0, jnp.arange(R.shape[-1]))
        return self.grid.field(x_final, has_time_axis=True)


# =========================
# Adams fractional solver
# =========================

def _build_adams_weights(
    J: int, alpha: float, dt: float, normalized: bool
) -> tuple:
    """Build Adams predictor-corrector weight matrices for the Volterra equation

        h(t_n) = scale * ∫_0^{t_n} (t_n-s)^(alpha-1) F(h(s)) ds

    Returns (B_pred, A_hist, a_last) where:
      B_pred[n, k]  — predictor weight for G_k = F(h_k) when computing h_n
      A_hist[n, k]  — corrector history weight for G_k when computing h_n
      a_last        — corrector weight for F(h_pred_n)

    scale=1 when normalized=False, 1/Gamma(alpha) when normalized=True.
    """
    from math import gamma as _math_gamma

    sp = dt**alpha / alpha
    sc = dt**alpha / (alpha * (alpha + 1))
    if normalized:
        g = _math_gamma(alpha)
        sp /= g
        sc /= g

    B = np.zeros((J + 1, J + 1))
    A = np.zeros((J + 1, J + 1))

    for n in range(1, J + 1):
        for k in range(n):
            m = n - k          # m in 1..n
            B[n, k] = sp * (m**alpha - (m - 1)**alpha)

        nm1 = n - 1
        A[n, 0] = sc * (nm1**(alpha + 1) - (nm1 - alpha) * n**alpha)
        for k in range(1, n):
            m = n - k          # m in 1..n-1
            A[n, k] = sc * ((m + 1)**(alpha + 1) - 2 * m**(alpha + 1) + (m - 1)**(alpha + 1))

    return B, A, float(sc)


class AdamsFractionalRiccatiSolver:
    """Adams predictor-corrector solver for the raw Volterra equation

        h(t) = scale * ∫_0^t (t-s)^(alpha-1) F(h(s)) ds,

    where scale=1 (normalized=False) or scale=1/Gamma(alpha) (normalized=True).

    ``F`` must accept ``(j, x)`` where ``j`` is a JAX integer (time index,
    ignored for time-independent fields) and ``x`` has the batch shape.
    Returns an array of the same batch shape.

    Time is the last axis; the batch dimensions are leading.  Supports
    batched complex arrays, e.g. shape ``(N_u, J+1)``.

    Parameters
    ----------
    grid : TimeGrid
        Must be a uniform grid.
    alpha : float
        Fractional order, 0 < alpha <= 1.
    F : callable
        Vector field ``F(j, x) -> x``-shaped array.
    normalized : bool
        If True, include the 1/Gamma(alpha) factor in the kernel.
    corrector_iterations : int
        Number of PECE corrector sweeps (>= 1).
    blowup_threshold : float or None
        Values with |h| > threshold are replaced by NaN after solving.
    """

    def __init__(
        self,
        grid: TimeGrid,
        alpha: float,
        F,
        *,
        normalized: bool = False,
        corrector_iterations: int = 1,
        blowup_threshold: float | None = 1e70,
    ):
        if not (0.0 < alpha <= 1.0):
            raise ValueError(f"alpha must be in (0, 1], got {alpha!r}")
        diffs = np.diff(grid.t)
        if not np.allclose(diffs, diffs[0], rtol=1e-10, atol=1e-14):
            raise ValueError("AdamsFractionalRiccatiSolver requires a uniform time grid.")

        self.grid = grid
        self.alpha = alpha
        self.F = F
        self.corrector_iterations = int(corrector_iterations)
        self.blowup_threshold = blowup_threshold

        dt = float(grid.T) / grid.J if grid.J > 0 else 1.0
        B_np, A_np, a_last = _build_adams_weights(grid.J, alpha, dt, normalized)
        self._B_pred = jnp.asarray(B_np)   # (J+1, J+1)
        self._A_hist = jnp.asarray(A_np)   # (J+1, J+1)
        self._a_last = float(a_last)

    def solve(self, initial=None) -> "Field":
        """Solve and return a Field with time as the last axis.

        The batch shape is inferred by calling F(0, 0) once.
        """
        J = self.grid.J
        F = self.F
        B_pred = self._B_pred
        A_hist = self._A_hist
        a_last = self._a_last
        n_corr = self.corrector_iterations

        # Probe batch shape and dtype
        G0 = F(jnp.array(0, dtype=jnp.int32),
               jnp.zeros((), dtype=jnp.complex128))
        G0 = jnp.asarray(G0, dtype=jnp.complex128)
        batch_shape = G0.shape

        h_init = jnp.zeros((*batch_shape, J + 1), dtype=jnp.complex128)
        G_init = jnp.zeros((*batch_shape, J + 1), dtype=jnp.complex128)
        G_init = G_init.at[..., 0].set(G0)

        def scan_step(carry, j):
            h_arr, G_arr = carry

            # Predictor (Adams-Bashforth)
            B_row = B_pred[j]                                        # (J+1,)
            h_j = jnp.sum(B_row * G_arr, axis=-1)                   # (...,)

            # Corrector iterations (Adams-Moulton PECE)
            A_row = A_hist[j]                                        # (J+1,)
            hist_j = jnp.sum(A_row * G_arr, axis=-1)                # (...,)
            for _ in range(n_corr):
                G_j_pred = F(j, h_j)
                h_j = hist_j + a_last * G_j_pred

            G_j = F(j, h_j)
            new_h = h_arr.at[..., j].set(h_j)
            new_G = G_arr.at[..., j].set(G_j)
            return (new_h, new_G), None

        (h_final, _), _ = lax.scan(scan_step, (h_init, G_init),
                                   jnp.arange(1, J + 1))

        if self.blowup_threshold is not None:
            thr = float(self.blowup_threshold)
            h_final = jnp.where(jnp.abs(h_final) > thr, jnp.nan + 0j, h_final)

        return self.grid.field(h_final, has_time_axis=True)


class ProductIntegrationRiccatiSolver:
    """Implicit product-integration solver for the Volterra Riccati equation

        psi(t) = ∫_0^t (t-s)^(alpha-1) F(psi(s)) ds,

    where F(x) = c - beta*x + 0.5*gam*x**2 is the Riccati right-hand side.

    The Adams PECE solver is useful as a cheap uniform-grid method, but it can
    become unstable for hyper-rough cases H < 0 on large Fourier contours. This
    solver treats the quadratic Riccati term implicitly at each node by solving
    the arising scalar quadratic exactly, and supports uniform, graded, and
    symmetric_graded grids.

    Parameters
    ----------
    grid : TimeGrid
        Time grid (uniform, graded, or symmetric_graded).
    alpha : float
        Fractional order, 0 < alpha <= 1.
    c : array-like, shape (n_u,), complex
        Constant term in F.
    beta : array-like, shape (n_u,), complex
        Linear coefficient in F.
    gam : float
        Quadratic coefficient in F (real scalar).
    blowup_threshold : float or None
        Values with |psi| > threshold are replaced by NaN after solving.
    """

    def __init__(
        self,
        grid: TimeGrid,
        alpha: float,
        c,
        beta,
        gam: float,
        *,
        blowup_threshold: float | None = 1e70,
    ):
        if not (0.0 < alpha <= 1.0):
            raise ValueError(f"alpha must be in (0, 1], got {alpha!r}")
        self.grid = grid
        self.alpha = alpha
        self.c = np.asarray(c, dtype=np.complex128).ravel()
        self.beta = np.asarray(beta, dtype=np.complex128).ravel()
        self.gam = float(gam)
        self.blowup_threshold = blowup_threshold

        K = Integrate(grid, kernel="frac", order=alpha - 1.0, start=0)
        self._Omega = K.weights_matrix   # (J+1, J+1), real, lower-triangular

    def solve(self) -> "Field":
        """Solve and return a Field with shape (n_u, J+1)."""
        J = self.grid.J
        Omega_jnp = jnp.asarray(self._Omega)   # (J+1, J+1), real
        c = jnp.asarray(self.c, dtype=jnp.complex128)       # (n_u,)
        beta = jnp.asarray(self.beta, dtype=jnp.complex128) # (n_u,)
        half_gam = jnp.array(0.5 * self.gam, dtype=jnp.float64)

        n_u = c.shape[0]
        psi_init  = jnp.zeros((n_u, J + 1), dtype=jnp.complex128)
        Fpsi_init = jnp.zeros((n_u, J + 1), dtype=jnp.complex128)
        Fpsi_init = Fpsi_init.at[:, 0].set(c)

        _quad_tol = jnp.array(1e-14, dtype=jnp.float64)

        def scan_step(carry, j):
            psi, Fpsi = carry

            omega_j = Omega_jnp[j, j]                      # scalar, real
            hist_j  = Fpsi @ Omega_jnp[j]                  # (n_u,) — full row, zero-padded beyond j

            rhs_j   = hist_j + omega_j * c                 # (n_u,)
            denom_j = 1.0 + omega_j * beta                 # (n_u,)
            psi_lin = rhs_j / denom_j

            a_coef  = half_gam * omega_j                   # scalar, real
            disc    = denom_j ** 2 - 4.0 * a_coef * rhs_j
            sqrt_disc = jnp.sqrt(disc)
            root1 = (denom_j + sqrt_disc) / (2.0 * a_coef)
            root2 = (denom_j - sqrt_disc) / (2.0 * a_coef)
            # pick root closest to the linearised value; fall back to psi_lin when a_coef≈0
            use_quad = jnp.abs(a_coef) >= _quad_tol
            closer1  = jnp.abs(root1 - psi_lin) <= jnp.abs(root2 - psi_lin)
            psi_quad = jnp.where(closer1, root1, root2)
            psi_j    = jnp.where(use_quad, psi_quad, psi_lin)

            Fpsi_j = c - beta * psi_j + half_gam * psi_j ** 2
            psi  = psi.at[:, j].set(psi_j)
            Fpsi = Fpsi.at[:, j].set(Fpsi_j)
            return (psi, Fpsi), None

        (psi_final, _), _ = lax.scan(scan_step, (psi_init, Fpsi_init),
                                     jnp.arange(1, J + 1))

        if self.blowup_threshold is not None:
            thr = float(self.blowup_threshold)
            psi_final = jnp.where(jnp.abs(psi_final) > thr, jnp.nan + 0j, psi_final)

        return self.grid.field(psi_final, has_time_axis=True)


def suggested_time_grid_power(anchor_H: float) -> float:
    """Grading exponent matched to the short-time singularity at the given anchor.

    anchor=0.0 → ~2.6, anchor=0.5 → 1.0 (uniform).
    """
    if abs(anchor_H - 0.5) < 1e-12:
        return 1.0
    alpha = float(anchor_H) + 0.5
    return float(np.clip(1.3 / alpha, 1.0, 3.0))
