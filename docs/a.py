import numpy as np
import plotly.graph_objects as go
import plotly.io as pio
import json
from mpmath import mp, im, loggamma, log, pi, re as mre, digamma
from scipy.integrate import cumulative_trapezoid
from scipy.optimize import brentq

mp.dps = 30

t_vals2 = np.linspace(0.001, 400.0, 16000)

def vartheta(t):
    return float(im(loggamma(0.25 + 0.5j*t))) - 0.5*t*float(log(pi))

def vartheta_prime(t):
    return float(0.5 * mre(digamma(0.25 + 0.5j*t))) - 0.5*float(log(pi))

def mu_exact(t):
    return float(log(t / (2.0*float(pi))))

vth2    = np.array([vartheta(t)       for t in t_vals2])
vthp2   = np.array([vartheta_prime(t) for t in t_vals2])
mu2     = np.array([mu_exact(t)       for t in t_vals2])
int_mu2 = cumulative_trapezoid(mu2, t_vals2, initial=0)

t_star   = brentq(vartheta_prime, 6.0, 7.0, xtol=1e-12)
vth_star = vartheta(t_star)

vth_mono2  = np.where(t_vals2 < t_star, 2*vth_star - vth2,  vth2)
vthp_mono2 = np.where(t_vals2 < t_star, -vthp2, vthp2)

with np.errstate(invalid='ignore', divide='ignore'):
    ratio1 = np.where(np.abs(int_mu2) > 1e-10, vth2 / int_mu2, np.nan)
    ratio2 = np.where(np.abs(mu2)     > 1e-10, vthp2 / mu2,    np.nan)

# Graph 1: theta, theta_mono, int(mu), ratio theta/int(mu)
fig1 = go.Figure()
fig1.add_trace(go.Scatter(x=t_vals2, y=vth2,      name="theta(t)",       mode="lines", line=dict(width=1.5)))
fig1.add_trace(go.Scatter(x=t_vals2, y=vth_mono2, name="theta_mono(t)",  mode="lines", line=dict(width=1.5, dash="dash")))
fig1.add_trace(go.Scatter(x=t_vals2, y=int_mu2,   name="int mu(s)ds",    mode="lines", line=dict(width=1.5, dash="dot")))
fig1.add_trace(go.Scatter(x=t_vals2, y=ratio1,    name="theta/int_mu",   mode="lines", line=dict(width=1.5, dash="longdash")))
fig1.update_layout(
    title="theta, theta_mono, int(mu), and their ratio — t in [0,400]",
    legend=dict(orientation='h', yanchor='bottom', y=1.02, xanchor='center', x=0.5)
)
fig1.update_xaxes(title_text="t", range=[0, 400], showgrid=True)
fig1.update_yaxes(title_text="value", showgrid=True)
fig1.write_image("graph1_ext.png")

# Graph 2: theta', theta'_mono, mu, ratio theta'/mu
fig2 = go.Figure()
fig2.add_trace(go.Scatter(x=t_vals2, y=vthp2,      name="theta'(t)",      mode="lines", line=dict(width=1.5)))
fig2.add_trace(go.Scatter(x=t_vals2, y=vthp_mono2, name="theta'_mono(t)", mode="lines", line=dict(width=1.5, dash="dash")))
fig2.add_trace(go.Scatter(x=t_vals2, y=mu2,         name="mu(t)",          mode="lines", line=dict(width=1.5, dash="dot")))
fig2.add_trace(go.Scatter(x=t_vals2, y=ratio2,      name="theta'/mu",      mode="lines", line=dict(width=1.5, dash="longdash")))
fig2.add_hline(y=0, line_dash="dot", line_color="gray")
fig2.update_layout(
    title="theta', theta'_mono, mu(t), and their ratio — t in [0,400]",
    legend=dict(orientation='h', yanchor='bottom', y=1.02, xanchor='center', x=0.5)
)
fig2.update_xaxes(title_text="t", range=[0, 400], showgrid=True)
fig2.update_yaxes(title_text="value", showgrid=True)
fig2.write_image("graph2_ext.png")
