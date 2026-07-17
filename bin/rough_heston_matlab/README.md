# rough_heston_matlab

Original MATLAB implementation by sigurdroemer/rough_heston
(https://github.com/sigurdroemer/rough_heston).

## Requirements

- **MATLAB R2019a or later** (this is NOT Octave-compatible)
- Financial Toolbox (`blsimpv`)
- Optimization Toolbox (`fminbnd`)

This is the original unmodified MATLAB source. The Octave port with
compatibility fixes lives in `../rough_heston_octave/`.

## Usage

```matlab
matlab -batch "price_european(100,100,1,0.3,2,0.04,0.3,-0.7,0.1)"
```

## Files

- `functions/` — core pricing engine (VIE solver, CF, numerical integration)
- `get_started.m` — example usage
- `validation_and_test_scripts/` — test and validation scripts
