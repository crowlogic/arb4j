#!/usr/bin/env python3
"""
Collate per-pricer CSV outputs into a cross-validation comparison table.
Usage:  python3 collate_xval.py [--csv] [--csv-output FILE.csv]
        [--csv-output FILE]  write consolidated CSV
        [--min-diff PRE]    filter rows with max diff >= PRE (default 0.01)
"""
import argparse, csv, sys, os, re
from collections import OrderedDict

PENNY = 0.01

# Map CSV column names to display labels
PRICER_LABELS = OrderedDict([
    ("octave",   "Octave"),
    ("ws",       "WS-Pade"),
    ("julia",    "Julia"),
    ("rp",       "roughprix"),
    ("r_adams",  "R-Adams"),
    ("qipc",     "qipc"),
])

# Validity is per-model, all-or-nothing. A model is either VALID — every one
# of its prices counts as one evenly-weighted sample in the reference ball —
# or totally INVALID and excluded from the ball entirely (its columns are
# still recorded for the record). There is no per-point outlier rejection.
#   roughprix: INVALID — wrapper OTM/parity bug, diverges at T=1.0
#   R-Adams:   INVALID — negative prices at short T (Fourier truncation)
#   qipc:      INVALID — Riccati quadratic coefficient has extra λ² factor
VALID_KEYS = ["octave", "ws", "julia"]

def load_csv(path, label):
    """Load a CSV into {case_id: (call, put)} dict."""
    data = {}
    if not os.path.exists(path):
        return data, f"missing"
    with open(path) as f:
        reader = csv.DictReader(f)
        for row in reader:
            cid = row.get("case_id", "").strip()
            c = row.get("call", "ERR").strip()
            p = row.get("put", "ERR").strip()
            try:
                data[cid] = (float(c), float(p))
            except ValueError:
                data[cid] = (None, None)
    return data, f"{len(data)} cases"

def format_price(v):
    if v is None:
        return "ERR"
    if abs(v) < 1e-10:
        return "0"
    return f"{v:.12f}"

def max_diff(prices):
    """Max absolute diff among valid prices."""
    vals = [p for p in prices if p is not None]
    if len(vals) < 2:
        return 0.0
    return max(abs(a - b) for a in vals for b in vals)

def ball(prices):
    """Derive a reference ball from evenly-weighted samples.
    Returns (n, midpoint, spread, radius) where:
      n        = number of valid samples
      midpoint = arithmetic mean (each sample weight 1/n)
      spread   = max |sample - midpoint|
      radius   = sample standard deviation (ddof=1) of the valid samples
    """
    import math
    vals = [p for p in prices if p is not None]
    n = len(vals)
    if n == 0:
        return (0, None, None, None)
    mid = sum(vals) / n
    spr = max(abs(v - mid) for v in vals)
    if n < 2:
        rad = 0.0
    else:
        rad = math.sqrt(sum((v - mid)**2 for v in vals) / (n - 1))
    return (n, mid, spr, rad)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", action="store_true", help="Output as CSV")
    ap.add_argument("--csv-output", help="Write consolidated CSV to file")
    ap.add_argument("--min-diff", type=float, default=None,
                    help="Only show rows with max diff >= this (default: show all)")
    args = ap.parse_args()

    BASE = os.path.dirname(os.path.abspath(__file__))

    # Locate CSV files from runner scripts
    csv_files = {
        "octave":   os.path.join(BASE, "output", "octave_grid.csv"),
        "ws":       os.path.join(BASE, "output", "workshop_grid.csv"),
        "julia":    os.path.join(BASE, "output", "julia_grid.csv"),
        "rp":       os.path.join(BASE, "output", "rp_grid.csv"),
        "r_adams":  os.path.join(BASE, "output", "r_adams_grid.csv"),
        "qipc":     os.path.join(BASE, "output", "qipc_grid.csv"),
    }

    # Load all
    datasets = {}
    statuses = {}
    for key, path in csv_files.items():
        data, status = load_csv(path, key)
        datasets[key] = data
        statuses[key] = status

    # Collect all case IDs
    all_cases = set()
    for data in datasets.values():
        all_cases.update(data.keys())
    all_cases = sorted(all_cases)

    all_keys = list(PRICER_LABELS.keys())

    # Print header
    print(f"# Rough Heston cross-validation")
    print(f"# S0=1.0, r=0, V0=theta")
    print(f"# Loaded CSVs:")
    for k, s in statuses.items():
        status_str = s if s != "missing" else f"file not found — run {k} grid first"
        validity = "VALID" if k in VALID_KEYS else "INVALID (excluded from ball)"
        print(f"#   {PRICER_LABELS[k]:12s} → {status_str}  [{validity}]")
    print(f"# Consensus tolerance: {PENNY} (one penny per unit spot)")
    print(f"# Reference ball: midpoint = mean of N valid samples (even weights),")
    print(f"#                 radius   = sample standard deviation (ddof=1) of valid samples")
    print()

    if not all_cases:
        print("No case data found. Run grid runners first:")
        for key in ["octave", "ws", "julia", "rp"]:
            print(f"  python3 bin/run_{key}_grid.py > bin/output/{key}_grid.csv")
        sys.exit(1)

    # Build rows
    rows = []
    for cid in all_cases:
        row = {"case_id": cid}
        for key in all_keys:
            data = datasets[key]
            if cid in data:
                row[f"{key}_call"] = data[cid][0]
                row[f"{key}_put"]  = data[cid][1]
            else:
                row[f"{key}_call"] = None
                row[f"{key}_put"]  = None

        # Ball from VALID models only — each valid model is one evenly-weighted sample
        valid_calls = [row[f"{k}_call"] for k in VALID_KEYS if row.get(f"{k}_call") is not None]
        valid_puts  = [row[f"{k}_put"]  for k in VALID_KEYS if row.get(f"{k}_put")  is not None]
        n_c, mid_c, spr_c, rad_c = ball(valid_calls)
        n_p, mid_p, spr_p, rad_p = ball(valid_puts)
        row["n"]             = n_c
        row["mid_call"]      = mid_c
        row["spread_call"]   = spr_c
        row["radius_call"]   = rad_c
        row["mid_put"]       = mid_p
        row["spread_put"]    = spr_p
        row["radius_put"]    = rad_p
        row["max_call_diff"] = max_diff(valid_calls)
        row["max_put_diff"]  = max_diff(valid_puts)
        rows.append(row)

    # Filter by min-diff
    if args.min_diff is not None:
        threshold = args.min_diff
        rows = [r for r in rows if max(r["max_call_diff"], r["max_put_diff"]) >= threshold]

    # Output
    if args.csv:
        fieldnames = ["case_id"]
        for key in all_keys:
            fieldnames.append(f"{PRICER_LABELS[key]}_call")
            fieldnames.append(f"{PRICER_LABELS[key]}_put")
        fieldnames += ["n", "mid_call", "spread_call", "radius_call",
                       "mid_put", "spread_put", "radius_put",
                       "max_call_diff", "max_put_diff"]

        w = csv.writer(sys.stdout)
        w.writerow(fieldnames)
        for row in rows:
            out = [row["case_id"]]
            for key in all_keys:
                out.append(format_price(row.get(f"{key}_call")))
                out.append(format_price(row.get(f"{key}_put")))
            out.append(str(row["n"]))
            out.append(format_price(row["mid_call"]))
            out.append(format_price(row["spread_call"]))
            out.append(format_price(row["radius_call"]))
            out.append(format_price(row["mid_put"]))
            out.append(format_price(row["spread_put"]))
            out.append(format_price(row["radius_put"]))
            out.append(f"{row['max_call_diff']:.2e}")
            out.append(f"{row['max_put_diff']:.2e}")
            w.writerow(out)
        return

    # Markdown table
    print("| Case |", end="")
    for key in all_keys:
        lbl = PRICER_LABELS[key]
        print(f" {lbl} call | {lbl} put |", end="")
    print(" N | mid call | radius call | mid put | radius put | max diff |")
    print("|" + "|".join(["---"] * (1 + 2*len(all_keys) + 6)) + "|")

    for row in rows:
        cid = row["case_id"]
        print(f"| {cid} |", end="")
        for key in all_keys:
            c = row.get(f"{key}_call")
            p = row.get(f"{key}_put")
            print(f" {format_price(c)} | {format_price(p)} |", end="")
        md  = max(row["max_call_diff"], row["max_put_diff"])
        print(f" {row['n']} | {format_price(row['mid_call'])} | {format_price(row['radius_call'])} | {format_price(row['mid_put'])} | {format_price(row['radius_put'])} | {md:.2e} |")

    # Summary
    print()
    consensus_rows = [r for r in rows if r["max_call_diff"] < PENNY and r["max_put_diff"] < PENNY]
    fail_rows = [r for r in rows if r["max_call_diff"] >= PENNY or r["max_put_diff"] >= PENNY]
    print(f"**{len(consensus_rows)} cases in consensus** (max diff < {PENNY})")
    if fail_rows:
        print(f"**{len(fail_rows)} cases fail consensus:**")
        for r in fail_rows:
            print(f"  {r['case_id']}: call diff={r['max_call_diff']:.2e}, put diff={r['max_put_diff']:.2e}")


if __name__ == "__main__":
    main()
