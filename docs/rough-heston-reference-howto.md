# Rough Heston Reference Pricers — HOWTO

## Purpose

These independently vendored external pricers produce agreeing reference prices
for validating arb4j's high-speed PaDE rough Heston implementation. The reference
prices are generated **offline** and hard-coded into unit tests — the vendored
pricers never run during `mvn test`.

## Parameter grid

| Field | Value |
|-------|-------|
| Spot S₀ | 1.0 |
| Risk-free rate r | 0.0 |
| Initial variance V₀ | θ (flat forward-variance curve) |

### Models

| Model | H | λ | θ | ν | ρ |
|-------|---|---|---|---|---|
| M1 | 0.12 | 0.1 | 0.3156 | 0.331 | −0.681 |
| M2 | 0.30 | 2.0 | 0.04 | 0.3 | −0.7 |

### Expiries and strikes

| Dimension | Values |
|-----------|--------|
| T (years) | 1/252, 1/52, 1.0 |
| K | 0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2 |

Total: 2 models × 3 expiries × 7 strikes = **42 cases**.

## Pricer inventory

### Valid (included in reference ball)

| Key | Directory | Language | Algorithm | Status |
|-----|-----------|----------|-----------|--------|
| `octave` | `rough_heston_matlab/` | Octave | Fractional Adams VIE (Diethelm) | ✅ Agrees with Workshop/Julia |
| `ws` | `rough_heston_workshop/` | Python | Padé [4,4] rational CF + GL quadrature | ✅ Agrees with Octave/Julia |
| `julia` | `QuantJulia/` | Julia | Implicit fractional Adams-Moulton | ✅ Agrees with Octave/WS |

All 3 agree to within 8.03×10⁻⁵ across all 42 cases (125× below 1-penny tolerance
at S₀=1.0).

### Invalid (excluded from reference ball)

| Key | Directory | Reason |
|-----|-----------|--------|
| `qipc` | `rough_heston_qipc/` | Riccati quadratic coefficient has extra λ² factor: `C = 0.5(λν)²` vs correct `C = 0.5ν²` |
| `gatheral_r` | `rough_heston_gatheral_r/` | Produces negative option prices at short maturities from Fourier truncation |
| `roughprix` | `roughprix_python/` | Wrapper mis-scales OTM prices (S₀ scaling bug); excluded until wrapper is fixed |

### Deleted

| Directory | Reason |
|-----------|--------|
| `rough_heston_breneis/` | Depends on `orthopy`/`quadpy` which use proprietary StoneFish license enforcement |

## Regenerating prices

### Prerequisites

- Octave with `optim` and `financial` packages
- Python 3 with `numpy`, `scipy`, `jax` (for roughprix only)
- Julia with `QuadGK` (already set up in `bin/QuantJulia/`)

### Step 1: Run individual pricer grids

```bash
# Octave Adams VIE
python3 bin/run_octave_grid.py

# Workshop Python Padé
python3 bin/run_ws_grid.py

# Julia QuantJulia
python3 bin/run_julia_grid.py

# roughprix (JAX) — excluded but runnable for reference
python3 bin/run_rp_grid.py
```

Each writes a CSV to `bin/output/{key}_grid.csv`.

### Step 2: Collate and derive reference balls

```bash
python3 bin/collate_xval.py
```

Writes `bin/output/consensus_xval.csv` with:

- **midpoint** = (1/N) Σ xᵢ (N valid samples, equal weights)
- **spread** = max|xᵢ − midpoint|
- **radius** = spread / √N

Currently N=3 (octave + ws + julia). When roughprix wrapper is fixed and it
rejoins agreement, N becomes 4.

### Step 3: Verify agreement

The 1-penny tolerance at S₀=1.0 is |diff| < 0.01. The current max pairwise
difference between any two valid pricers is 8.03×10⁻⁵ — well within tolerance.

### Per-pricer CLI entry points

#### Octave (`bin/rough_heston_matlab/price_european.m`)

```bash
bin/run_octave_grid.py  # runs the full grid
# or directly:
octave -q bin/rough_heston_matlab/price_european.m 1.0 0.8 0.00396825397 0.12 0.1 0.3156 0.331 -0.681 0.0
# args: S0 K T H lam theta nu rho r
```

Octave runners auto-activate the `octshim/` patches for `inputParser`, `fmincon`,
`blsimpv`, and `integral` compatibility.

#### Workshop (`bin/rough_heston_workshop/price_european.py`)

```bash
bin/run_ws_grid.py  # runs the full grid
# or directly:
python3 bin/rough_heston_workshop/price_european.py 1.0 0.8 0.00396825397 0.12 0.1 0.3156 0.331 -0.681 0.0
# args: S0 K T H lam theta nu rho r
```

Works with r=0 only (the internal `fourier_inversion_formula_otm_price` ignores r).

#### Julia (`bin/QuantJulia/price_european.jl`)

```bash
bin/run_julia_grid.py  # runs the full grid
# or directly:
julia bin/QuantJulia/price_european.jl 1.0 0.8 0.00396825397 0.12 0.1 0.3156 0.331 -0.681 0.0
# args: S0 K T H lam theta nu rho r
```

## File layout

```
bin/
├── rough_heston_matlab/       # Octave Adams VIE (sigurdroemer)
├── rough_heston_workshop/     # Python Padé CF (fbourgey)
├── QuantJulia/                # Julia implicit Adams (Yugam2508)
├── rough_heston_qipc/         # DISQUALIFIED
├── rough_heston_gatheral_r/   # DISQUALIFIED
├── roughprix_python/          # EXCLUDED (wrapper bug)
├── octshim/                   # Octave compatibility patches
├── run_octave_grid.py         # Grid runner — Octave
├── run_ws_grid.py             # Grid runner — Workshop Python
├── run_julia_grid.py          # Grid runner — Julia
├── run_rp_grid.py             # Grid runner — roughprix
├── collate_xval.py            # Collation + ball derivation
└── output/
    ├── octave_grid.csv        # Raw Octave prices
    ├── workshop_grid.csv      # Raw Workshop prices
    ├── julia_grid.csv         # Raw Julia prices
    ├── consensus_xval.csv     # Collated consensus + reference balls

docs/
├── rough-heston-xval-table.md        # Full 42-row reference table
├── rough-heston-reference-howto.md   # This file
└── rough-heston-implementations.md   # (outdated — kept for pricer provenance)
```

## Ball derivation

For each grid case, the reference ball `[m ± r]` is:

```
N  = number of valid samples
m  = (1/N) Σ xᵢ         # even-weighted midpoint
δ  = max |xᵢ − m|       # spread
r  = δ / √N             # radius
```

Currently N=3 (octave, ws, julia). The reference table in
`docs/rough-heston-xval-table.md` records every sample value, N, midpoint,
spread, and radius for each case.

## Adding or changing a pricer's validity

Edit `VALID_KEYS` in `bin/collate_xval.py` (line ~8):

```python
VALID_KEYS = {"octave", "ws", "julia"}   # add/remove keys here
```

Re-run `python3 bin/collate_xval.py` to regenerate the consensus.
