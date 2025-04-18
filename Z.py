import numpy as np
import matplotlib.pyplot as plt

# Parameters 
t = 50
N = int(np.sqrt(t/(2*np.pi)))
p = np.sqrt(t/(2*np.pi)) - N

# Calculate exact saddle point using Berry's formula (3.1)
z_s = (2*np.pi*1j*(N+p)**2)/N - 1/(2*N)

# Setup figure
plt.figure(figsize=(12, 9))

# 1. Branch cut (positive real axis)
plt.plot([0, 7], [0, 0], 'r-', lw=3, label='Branch cut')

# 2. Poles at z = 2πin (vertical imaginary axis, skip n=0)
n_poles = np.arange(-6, 7)
n_poles = n_poles[n_poles != 0]
poles_y = 2*np.pi*n_poles
plt.plot(np.zeros_like(poles_y), poles_y, 'ko', ms=7, label='Poles $z=2\pi in$')

# 3. The original contour C from Berry's Fig. 1
# Start from far right below real axis, circle origin counterclockwise, return above real axis
theta = np.linspace(np.pi+0.1, -np.pi-0.1, 100)
R = 0.8  # Radius of loop around origin
loop = R * np.exp(1j*theta)
rays_in = np.linspace(5, R, 30) * np.exp(1j*(np.pi+0.1))  # Incoming ray just below real axis
rays_out = np.linspace(R, 5, 30) * np.exp(1j*(-np.pi-0.1))  # Outgoing ray just above real axis
c_real = np.concatenate([rays_in.real, loop.real, rays_out.real])
c_imag = np.concatenate([rays_in.imag, loop.imag, rays_out.imag])
plt.plot(c_real, c_imag, 'b-', lw=1.5, label='Contour $C$')

# 4. The C_N contour - MANUALLY DEFINE POINTS for complete control
# Creating rectangle-like pattern that zigzags between poles
cn_x = []
cn_y = []

# Starting point (DON'T connect from Hankel contour to avoid the unwanted line)
cn_x.append(-1)
cn_y.append(-40)

# Create zigzag pattern going upward
for i in range(-6, 7):
    if i == 0:
        continue  # Skip zero pole
    
    pole_y = 2*np.pi*i
    
    # Left side of rectangle
    cn_x.append(-1)
    cn_y.append(pole_y - 3)
    
    # Top/bottom horizontal segment
    cn_x.append(0.7)
    cn_y.append(pole_y - 3)
    
    # Right side of rectangle
    cn_x.append(0.7) 
    cn_y.append(pole_y + 3)
    
    # Complete rectangle with horizontal segment
    if i < 6:  # Don't add horizontal for last pole
        cn_x.append(-1)
        cn_y.append(pole_y + 3)

# Plot the C_N contour without connecting back
plt.plot(cn_x, cn_y, 'b--', lw=2, label='$C_N$ (weaves between poles)')

# 5. Saddle point (exact location from Berry's formula)
plt.plot(z_s.real, z_s.imag, 'r*', ms=16, label='Saddle Point')

# 6. Steepest descent direction through saddle (45° angle as in paper)
arrowlen = 5
ang = np.pi/4  # 45° angle
vec = arrowlen * np.exp(1j*ang)
plt.plot([z_s.real-vec.real, z_s.real+vec.real],
         [z_s.imag-vec.imag, z_s.imag+vec.imag],
         'g-', lw=2, label='Steepest Descent')

# Formatting
plt.xlabel('Re(z)', fontsize=13)
plt.ylabel('Im(z)', fontsize=13)
plt.title(f'Riemann-Siegel Contour (Weaving Between Poles)\nN={N}, t={t}, p={p:.3f}, saddle at {z_s:.3f}', fontsize=14)
plt.xlim(-2, 7)
plt.ylim(-45, 45)
plt.legend(loc='upper left')
plt.grid(linestyle='--', alpha=0.3)
plt.tight_layout()
plt.show()

# Print key values
print(f"N = {N}")
print(f"p = {p:.6f}")
print(f"Exact saddle point: {z_s:.6f}")
print(f"Approximate saddle point: {2*np.pi*1j*(N+2*p):.6f}")
