# scripts/ — Python reference implementation

Pure-`mpmath` reference code for the constant-coefficient fractional Riccati
equation and its rough-Heston application, plus the proven pricing integral.

## Files

| File | Purpose |
|---|---|
| `fractional_riccati.py` | Full Müntz–Padé spectral-tau stack: Müntz–Tau coefficients, moment functional & Hankel determinants, polynomial Chebyshev–Wheeler recurrence, monic + second-kind OPS, diagonal Padé numerator/denominator & residual check, Jacobi matrix/spectrum, corrigendum μ\* maximiser, Mittag-Leffler & linear closed forms, rough-Heston cgf/φ, and the `tanh` J-fraction (parity with `native/pade_resolvent.c`). |
| `bm_pricer.py` | Proven Bakshi–Madan / Heston pricing integral and characteristic function. |
| `test_fractional_riccati.py` | pytest suite validating every function against closed-form oracles (Mittag-Leffler, `tanh` J-fraction, Chebyshev–Wheeler vs Hankel, Padé identity, Jacobi spectrum, corrigendum μ\*, and a rough-Heston→classical-Heston bridge to `bm_pricer.py`). |

Each function in `fractional_riccati.py` implements one construction from the
`docs/` directory; the module docstring lists the source documents.

## Install

```bash
pip install -r scripts/requirements.txt
```

## Run

```bash
# the built-in demo
python3 scripts/fractional_riccati.py

# the test suite (~35 s at 50-digit precision)
cd scripts && python3 -m pytest test_fractional_riccati.py -q
```
