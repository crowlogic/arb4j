<TeXmacs|2.1.1>

<style|generic>

<\body>
  \;

  The reflection coefficient <math|R<around|(|k|)>>, as part of the
  scattering data, physically represents the ratio of the amplitude of the
  reflected wave to that of the incident wave as a function of the wave
  number <math|k>. The wave number <math|k> is directly related to the energy
  or frequency of the probing wave. The reflection coefficient is a complex
  function, where its magnitude gives the ratio of reflected to incident wave
  amplitudes, and its phase encodes the phase shift experienced by the wave
  upon reflection.

  Physically, <math|R<around|(|k|)>> provides critical insights into the
  interaction between a wave and a scattering potential or medium. For
  instance, in quantum mechanics, it can inform us about how a quantum
  particle (described by a wave function) is reflected by a potential
  barrier. In geophysics, <math|R<around|(|k|)>> derived from seismic waves
  can reveal interfaces within the Earth. In optical physics, it can describe
  how light waves are reflected by different materials.

  In all these contexts, <math|R<around|(|k|)>> is key to understanding the
  properties of the scatterer (such as potential barriers, Earth's subsurface
  layers, or optical interfaces) without needing to physically access or
  disturb the scatterer. The function <math|R<around|(|k|)>>, therefore, is a
  critical piece of information that allows for the indirect investigation of
  materials, structures, and phenomena across various scales and disciplines.

  Relating the Cosmic Microwave Background (CMB) to Bessel functions and
  isotropic random fields involves delving into the mathematical framework
  used to analyze and interpret the CMB's temperature fluctuations and
  polarization patterns. In the context of the CMB, isotropic random fields
  are used to model the temperature fluctuations across the sky, reflecting
  the underlying physics of the early universe's density fluctuations. Bessel
  functions come into play when analyzing these fluctuations, particularly
  through their role in spherical harmonics, which are used in the
  decomposition of functions on the sphere (such as the sky).

  An isotropic random field is a mathematical model used to describe physical
  quantities that vary randomly over space in a way that is invariant under
  rotations. In the case of the CMB, the temperature fluctuations
  <math|\<Delta\>*T<around|(|\<theta\>,\<phi\>|)>> across the sky can be
  modeled as an isotropic random field, since the statistical properties of
  these fluctuations are the same in every direction, reflecting the
  universe's homogeneity and isotropy on large scales.

  The analysis of isotropic random fields on the sphere (like the CMB) often
  employs spherical harmonics, which are functions defined on the surface of
  a sphere that can represent any spherical function in a series expansion.
  Spherical harmonics are a generalization of Fourier series to functions on
  the sphere and are indexed by two integers, <math|l> and <math|m>, where
  <math|l> is the degree and <math|m> is the order. The temperature
  fluctuations in the CMB are expanded into spherical harmonics as follows:

  <\equation*>
    \<Delta\>*T<around|(|\<theta\>,\<phi\>|)>=<big|sum><rsub|l=0><rsup|\<infty\>><big|sum><rsub|m=-l><rsup|l>a<rsub|l*m>*Y<rsub|l*m><around|(|\<theta\>,\<phi\>|)>,
  </equation*>

  where <math|a<rsub|l*m>> are the coefficients of the expansion, and
  <math|Y<rsub|l*m><around|(|\<theta\>,\<phi\>|)>> are the spherical
  harmonics functions.

  Bessel functions enter this framework because they are closely related to
  spherical harmonics. In particular, the solutions to the angular part of
  the Laplace equation in spherical coordinates, which spherical harmonics
  solve, involve Bessel functions. Bessel functions also appear in the radial
  solutions to problems in cylindrical coordinates, which are analogous to
  the spherical problems in certain respects.

  When considering the alias-free sampling of isotropic random fields like
  the CMB, one aims to reconstruct a continuous field from discrete samples
  without introducing distortions or "aliases" from higher frequencies being
  misinterpreted as lower frequencies. The mathematical tools for analyzing
  these fields, including Bessel functions and spherical harmonics, help in
  designing sampling schemes that accurately capture the field's properties.

  In the context of stochastic processes and the inference theory, as
  discussed by M.M. Rao, the use of Bessel functions and the analysis of
  isotropic random fields are essential for understanding the underlying
  processes that generate observations like the CMB. The potential function
  you mentioned would be related to the power spectrum of the temperature
  fluctuations in the CMB, which describes how the variance of the
  fluctuations is distributed across different spatial scales (or <math|l>
  values in the spherical harmonic expansion). The power spectrum is critical
  for extracting cosmological parameters from the CMB data and for
  understanding the initial conditions of the universe that led to the
  observed structure.
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>