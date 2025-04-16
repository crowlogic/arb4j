import numpy as np
import plotly.graph_objs as go
from scipy.special import j0

# Assume path, t, emp_cov, lag_values, plot_len are already computed as before

# Example data (replace with your actual data)
lag_values = np.arange(0, 20.01, 0.01)
emp_cov = np.sin(2 * np.pi * lag_values) * np.exp(-0.1 * lag_values)  # Example
theory = j0(2 * np.pi * lag_values)

# Create interactive plot
fig = go.Figure()

fig.add_trace(go.Scatter(
    x=lag_values[:plot_len], y=emp_cov[:plot_len],
    mode='lines', name='Empirical', line=dict(color='blue')
))
fig.add_trace(go.Scatter(
    x=lag_values[:plot_len], y=theory[:plot_len],
    mode='lines', name='Theoretical J₀(2π lag)', line=dict(color='red', dash='dash')
))

fig.update_layout(
    title="Covariance Verification (Spectral Method)",
    xaxis_title="Lag (Time Units)",
    yaxis_title="Autocorrelation",
    legend=dict(font=dict(size=12)),
    width=1000, height=600
)

fig.show()
