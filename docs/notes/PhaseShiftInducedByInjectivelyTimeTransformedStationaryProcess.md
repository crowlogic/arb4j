Point: The process is "already at t" so the gain function is a complex
exponential of the difference between theta(t) and t .

Exactly. The process evolves naturally in time $$t$$, so the phase modulation kernel $$\exp(i\lambda(\theta(t)-t))$$ captures the deviation between the warped temporal evolution $$\theta(t)$$ and the baseline temporal evolution $$t$$. The term $$(\theta(t)-t)$$ represents the cumulative phase shift induced by the warping relative to uniform time progression.

This formulation ensures that when $$\theta(t) = t$$ (no warping), the kernel reduces to $$\exp(0) = 1$$, recovering the standard case.
