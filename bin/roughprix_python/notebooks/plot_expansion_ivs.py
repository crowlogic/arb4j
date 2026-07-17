"""
Expansion implied-volatility grid figures.

Imported by Heston.ipynb Cell 12.  Each expansion setup produces one figure:
  - suptitle: "Implied Volatilities -- Expansion around H_0 = ..."
  - column headers: $T = ...$ as tight_layout-aware axes titles (top row);
    a horizontal rule at the axes top visually ties the label to its column
  - row headers: $H = ...$ + vertical bracket, added after tight_layout so
    they do not disturb axis spacing
  - tick labels on outer edges only: y on left/right columns, x on bottom row
  - x-ticks always include min and max k; endpoint labels aligned left/right
    to keep them inside the panel and prevent inter-column bleed
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.lines as mlines

# ── AMS paper style ───────────────────────────────────────────────────────
TEXT_WIDTH = 6.5
PANEL_ASPECT = 0.85

plt.rcParams.update({
    "text.usetex": True,
    "font.family": "serif",
    "font.serif": ["Computer Modern Roman"],
    "font.size": 9,
    "axes.labelsize": 9,
    "axes.titlesize": 9,
    "legend.fontsize": 8,
    "xtick.labelsize": 8,
    "ytick.labelsize": 8,
    "text.latex.preamble": r"\usepackage{amsmath}",
})

ORDER_COLORS = {
    0: "#56B4E9",  # sky blue
    2: "#E69F00",  # orange
    4: "#17BECF",  # cyan
    6: "#D55E00",  # vermillion
    8: "#CC79A7",  # pink
}
_CB_FALLBACK = ["#E69F00", "#0072B2", "#F0E442"]
EXP_LS_CYCLE = ["-", "--", "-.", ":"]

_DEFAULT_BENCHMARK_STYLES = {
    "direct_riccati": dict(color="black",     lw=1.6, ls="-",              alpha=0.9,  zorder=9),
    "root_pade":      dict(color="dimgray",   lw=1.2, ls=(0, (5, 2)),      alpha=0.85, zorder=10),
    "pade":           dict(color="steelblue", lw=1.2, ls=(0, (3, 1, 1, 1)),alpha=0.85, zorder=8),
}


def _match_H(h, H_available):
    for ha in H_available:
        if np.isclose(h, ha, rtol=0, atol=1e-9):
            return ha
    return None


def _lookup_H_dict(H, d):
    """Return d[key] where key ≈ H (float comparison), or None if absent."""
    if d is None:
        return None
    for key, val in d.items():
        if np.isclose(float(H), float(key), rtol=0, atol=1e-9):
            return val
    return None


def _panel_krange(H, T, order_krange):
    """
    Slice the flat {(H, T, N): (k_lo, k_hi)} dict down to {N: (k_lo, k_hi)}
    for the given panel.  Returns None if nothing matches.
    """
    if not order_krange:
        return None
    result = {
        int(kN): rng
        for (kH, kT, kN), rng in order_krange.items()
        if np.isclose(float(H), float(kH), rtol=0, atol=1e-9)
        and np.isclose(float(T), float(kT), rtol=0, atol=1e-9)
    }
    return result or None


def _plot_panel(ax, data, s_idx, order_selection, plot_benchmark_bases, benchmark_styles,
                ylim=None, order_krange=None):
    """
    order_krange: {order_int: (k_lo, k_hi)} — plot that order only for k in [k_lo, k_hi].
    ylim:         (ymin, ymax) or None.
    """
    moneyness    = data["moneyness"]
    expansion_iv = data["expansion_iv"]
    exp_orders   = data["expansion_orders"]
    in_range     = data["expansion_in_range"].astype(bool)

    for base in plot_benchmark_bases:
        bkey = f"benchmark_iv_{base}"
        if bkey not in data:
            continue
        style = {k: v for k, v in
                 benchmark_styles.get(base, dict(color="black", lw=1.4)).items()
                 if k != "zorder"}
        ax.plot(moneyness, data[bkey], zorder=1, **style)

    if in_range[s_idx]:
        for j, order in enumerate(exp_orders):
            if order_selection is not None and int(order) not in order_selection:
                continue
            iv = expansion_iv[s_idx, j].copy().astype(float)
            if order_krange is not None and int(order) in order_krange:
                k_lo, k_hi = order_krange[int(order)]
                iv[(moneyness < k_lo) | (moneyness > k_hi)] = np.nan
            if not np.all(np.isnan(iv)):
                color = ORDER_COLORS.get(int(order),
                                         _CB_FALLBACK[j % len(_CB_FALLBACK)])
                ax.plot(moneyness, iv, color=color,
                        ls=EXP_LS_CYCLE[j % len(EXP_LS_CYCLE)],
                        lw=1.1, zorder=3)

    ax.grid(True, which="both", linestyle=":", alpha=0.3)

    if ylim is not None:
        ax.set_ylim(ylim)

    # Exactly three ticks: rounded k_min, 0, rounded k_max.
    k_min, k_max = float(moneyness.min()), float(moneyness.max())
    ax.set_xlim(k_min, k_max)
    ticks = sorted({round(k_min, 2), 0.0, round(k_max, 2)})
    ax.set_xticks(ticks)
    ax.xaxis.set_major_formatter(plt.FormatStrFormatter("%.2f"))
    # Left-align leftmost label and right-align rightmost so they stay inside
    # the panel and don't bleed into the column gap.
    tick_objs = ax.xaxis.get_major_ticks()
    if tick_objs:
        tick_objs[0].label1.set_ha("left")
        tick_objs[-1].label1.set_ha("right")


def _add_row_labels(fig, axes, H_to_plot, rect_left):
    """
    Add H row labels and vertical bracket lines in figure coordinates.

    Called AFTER tight_layout so axes positions are final and the annotations
    do not disturb axis spacing.  Both elements are placed at x < rect_left,
    i.e. strictly to the left of the y-tick-label area.
    """
    # Bracket right next to the tick-label left edge
    bracket_x = rect_left - 0.004
    # Label with a small visible gap between text and bracket
    label_x    = rect_left - 0.015

    for i_H, H in enumerate(H_to_plot):
        pos  = axes[i_H, 0].get_position()
        y0, y1 = pos.y0, pos.y1

        fig.add_artist(
            plt.Line2D([bracket_x, bracket_x], [y0, y1],
                       transform=fig.transFigure,
                       color="#444", lw=0.8, clip_on=False)
        )
        fig.text(label_x, (y0 + y1) / 2, fr"$H = {H:.2g}$",
                 ha="right", va="center", rotation=90,
                 transform=fig.transFigure, fontsize=9)


def make_expansion_iv_figure(
    s_idx,
    anchor,
    H_to_plot,
    maturities,
    file_data,
    orders0,
    order_sel_set,
    plot_benchmark_bases,
    benchmark_styles=None,
    text_width=TEXT_WIDTH,
    panel_aspect=PANEL_ASPECT,
    ylim=None,
    ylim_by_H=None,
    order_krange=None,
):
    """
    ylim:         (ymin, ymax) applied to every panel in the figure.
    ylim_by_H:    {H: (ymin, ymax)} per-row override (takes precedence over ylim).
    order_krange: {(H, T, N): (k_lo, k_hi)} — order N is only plotted for
                  k in [k_lo, k_hi] in the panel at (H, T).
    """
    if benchmark_styles is None:
        benchmark_styles = _DEFAULT_BENCHMARK_STYLES

    n_rows = len(H_to_plot)
    n_cols = len(maturities)

    panel_w = text_width / n_cols
    panel_h = panel_w * panel_aspect
    fig_h   = panel_h * n_rows + 0.65

    fig, axes = plt.subplots(
        n_rows, n_cols,
        figsize=(text_width, fig_h),
        sharex=False, sharey=True, squeeze=False,
    )

    for i_H, H in enumerate(H_to_plot):
        for j_T, T in enumerate(maturities):
            ax = axes[i_H, j_T]
            key = (float(H), T)

            if key not in file_data:
                ax.set_visible(False)
                continue

            _plot_panel(ax, file_data[key], s_idx,
                        order_sel_set, plot_benchmark_bases, benchmark_styles,
                        ylim=_lookup_H_dict(H, ylim_by_H) or ylim,
                        order_krange=_panel_krange(H, T, order_krange))

            is_left   = (j_T == 0)
            is_right  = (j_T == n_cols - 1)
            is_bottom = (i_H == n_rows - 1)

            # Column header: ax.set_title is tight_layout-aware so it gets
            # exactly the right amount of top space.  The horizontal rule
            # (at axes top in transAxes coords) visually spans the column.
            if i_H == 0:
                ax.set_title(fr"$T = {T:g}$", pad=3)
                ax.plot([0, 1], [1.0, 1.0], transform=ax.transAxes,
                        color="#666", lw=0.7, clip_on=False)

            if is_bottom:
                ax.set_xlabel(r"$k$")

            ax.tick_params(axis="y",
                           left=is_left,   labelleft=is_left,
                           right=is_right, labelright=is_right)
            ax.tick_params(axis="x",
                           bottom=is_bottom, labelbottom=is_bottom,
                           top=False, labeltop=False)

    # Legend
    legend_handles = [
        mlines.Line2D([], [],
                      color=ORDER_COLORS.get(int(order),
                                             _CB_FALLBACK[j % len(_CB_FALLBACK)]),
                      ls=EXP_LS_CYCLE[j % len(EXP_LS_CYCLE)],
                      lw=1.1, label=fr"Order $N={int(order)}$")
        for j, order in enumerate(orders0)
        if order_sel_set is None or int(order) in order_sel_set
    ]
    for base in plot_benchmark_bases:
        style = {k: v for k, v in
                 benchmark_styles.get(base, dict(color="black", lw=1.4)).items()
                 if k != "zorder"}
        legend_handles.append(mlines.Line2D([], [], label=r"Benchmark", **style))

    fig.legend(handles=legend_handles, loc="lower center",
               ncol=len(legend_handles), frameon=False)

    # ── Layout ───────────────────────────────────────────────────────────
    # rect_left = 0.10 reserves ~0.65" for the H bracket + label.
    # rect_top  = 0.96 lets tight_layout fill almost the full height, leaving
    #   a thin margin for the suptitle we add immediately after.
    # w_pad = 0.2 reduces inter-column padding (was default 1.08 font-sizes).
    # IMPORTANT: suptitle is set AFTER tight_layout so tight_layout does not
    #   treat suptitle height as dead space and push axes down.
    _RECT_LEFT = 0.10
    # Fixed 22pt at the bottom for the legend regardless of figure height.
    _rect_bottom = 13 / (fig_h * 72)
    fig.tight_layout(rect=(_RECT_LEFT, _rect_bottom, 1.0, 0.96), w_pad=1.0)

    anchor_str = f"{anchor:g}"
    fig.suptitle(
        fr"Implied Volatilities -- Expansion around $H_0 = {anchor_str}$",
        fontsize=10, y=0.99,
    )

    # Row labels added after layout so they don't influence axis positioning.
    _add_row_labels(fig, axes, H_to_plot, rect_left=_RECT_LEFT)

    return fig