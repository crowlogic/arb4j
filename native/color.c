/* This file is public domain. Author: Fredrik Johansson. */


#include <jni.h>
#include <string.h>
#include <acb.h>
#include <flint/fmpz.h>
#include <arb_calc.h>
#include <acb_hypgeom.h>
#include <acb_modular.h>
#include <acb_elliptic.h>
#include <flint/profiler.h>
#include <acb_dirichlet.h>
#include <string.h>
#include "acb.h"
#include "acb_hypgeom.h"
#include "acb_modular.h"
#include "acb_elliptic.h"
#include "flint/profiler.h"
#include "color.h"

/* some useful color operations */
#define CLAMP(y) FLINT_MAX(0.0, FLINT_MIN((y), 1.0))
#define BLEND(x,y) (0.5*(x) + 0.5*(y))
#define DODGE(a,b) ((a) / ((1.0 - (b)) + 1/256.0))

#define ARB2D(x) arf_get_d(&(x->mid), ARF_RND_NEAR )
#define ARB2DP(x) arf_get_d(x.mid, ARF_RND_NEAR )

/* HLS algorithm from python's colorsys module */
static double
vv(double m1, double m2, double hue)
{
    hue = hue - floor(hue);

    if (hue < 1/6.)
        return m1 + (m2-m1)*hue*6.0;
    if (hue < 0.5)
        return m2;
    if (hue < 2/3.)
        return m1 + (m2-m1)*(2/3.-hue)*6.0;
    return m1;
}

static void
hls_to_rgb(double *R, double *G, double *B, double h, double l, double s)
{
    double m1, m2;

    if (s == 0.0)
    {
        *R = *G = *B = l;
        return;
    }

    if (l <= 0.5)
        m2 = l * (1.0+s);
    else
        m2 = l+s-(l*s);

    m1 = 2.0*l - m2;

    *R = vv(m1, m2, h + 1/3.);
    *G = vv(m1, m2, h);
    *B = vv(m1, m2, h - 1/3.);
}

static void
rgb_to_hls(double *H, double *L, double *S, double R, double G, double B)
{
    double h, l, s, hi, lo, d;

    hi = FLINT_MAX(FLINT_MAX(R, G), B);
    lo = FLINT_MIN(FLINT_MIN(R, G), B);

    l = 0.5 * (lo + hi);
    d = hi - lo;

    if (hi == lo)
    {
        s = 0.0;
        h = 0.0;
    }
    else
    {
        if (l <= 0.5)
            s = d / (hi + lo);
        else
            s = d / (2.0 - hi - lo);

        if (d == 0.0)
            d = 1.0;

        if (R == hi)
            h = (G - B) / d;
        else if (G == hi)
            h = (B - R) / d + 2.0;
        else
            h = (R - G) / d + 4.0;

        h = h / 6.0;
        if (h < 0.0)
            h += 1.0;
    }

    *H = h;
    *L = l;
    *S = s;
}

/* color balance algorithm from gimp */
static double balance_channel(double value, double l,
    double shadows, double midtones, double highlights)
{
    double a = 0.25, b = 0.333, scale = 0.7;

    shadows    *= CLAMP((l - b) / (-a) + 0.5) * scale;
    midtones   *= CLAMP((l - b) / ( a) + 0.5) *
                  CLAMP((l + b - 1.0) / (-a) + 0.5) * scale;
    highlights *= CLAMP((l + b - 1.0) / ( a) + 0.5) * scale;

    value += shadows;
    value += midtones;
    value += highlights;
    return CLAMP(value);
}

static void balance(double * R, double * G, double * B,
    double ra, double rb, double rc,  /* red shadows, midtones, highlights */
    double ga, double gb, double gc,  /* green */
    double ba, double bb, double bc)  /* blue */
{
    double h, l, s;
    double h2, l2, s2;

    rgb_to_hls(&h, &l, &s, *R, *G, *B);

    *R = balance_channel(*R, *R, ra, rb, rc);
    *G = balance_channel(*G, *G, ga, gb, gc);
    *B = balance_channel(*B, *B, ba, bb, bc);

    /* preserve lightness */
    rgb_to_hls(&h2, &l2, &s2, *R, *G, *B);
    hls_to_rgb(R, G, B, h2, l, s2);
}

#define PI 3.1415926535898

const double blue_orange_colors[][4] = {
  {-1.0,  0.0, 0.0, 0.0},
  {-0.95, 0.1, 0.2, 0.5},
  {-0.5,  0.0, 0.5, 1.0},
  {-0.05, 0.4, 0.8, 0.8},
  { 0.0,  1.0, 1.0, 1.0},
  { 0.05, 1.0, 0.9, 0.3},
  { 0.5,  0.9, 0.5, 0.0},
  { 0.95, 0.7, 0.1, 0.0},
  { 1.0,  0.0, 0.0, 0.0},
  { 2.0,  0.0, 0.0, 0.0},
};

void
color_function(double * R, double * G, double * B, const acb_t z, int mode)
{

    double H, L, S;
    slong prec, i;
    arb_t t, u;

    if (!acb_is_finite(z) || acb_rel_accuracy_bits(z) < 4)
    {
        *R = *G = *B = 0.5;
        return;
    }

    if (mode >= 2)
    {
        double R1, G1, B1;
        double R2, G2, B2;

        /* combine both color functions */
        color_function(&R1, &G1, &B1, z, 0);
        color_function(&R2, &G2, &B2, z, 1);

        *R = BLEND(R1, CLAMP(DODGE(R1, R2)));
        *G = BLEND(G1, CLAMP(DODGE(G1, G2)));
        *B = BLEND(B1, CLAMP(DODGE(B1, B2)));

        /* then play with the levels */
        if (mode == 3)
            balance(R, G, B, 0.0, -0.5, 0.2, 0.0, 0.0, -0.1, 0.0, -1.0, -0.2);
        else if (mode == 4)
            balance(R, G, B, 0.0, -0.5, 0.2, 0.0, 0.5, -0.1, 0.0, -0.3, -1.0);
        else if (mode == 5)
            balance(R, G, B, 0.0, -0.5, -1.0, 0.0, -0.1, -0.67, 0.0, -0.55, -0.12);
        else if (mode == 6)
            balance(R, G, B, 0.86, 0.0, 0.13, 0.57, 0.19, -0.52, 0.31, -0.30, -0.94);

        return;
    }

    arb_init(t);
    arb_init(u);

    prec = 32;

    arf_set_round(arb_midref(t), arb_midref(acb_realref(z)), prec, ARF_RND_DOWN);
    arf_set_round(arb_midref(u), arb_midref(acb_imagref(z)), prec, ARF_RND_DOWN);

    arb_atan2(t, u, t, prec);

    H = arf_get_d(arb_midref(t), ARF_RND_DOWN);

    if (mode == 0)
    {
        H = (H + PI) / (2 * PI) + 0.5;
        H = H - floor(H);

        acb_abs(t, z, prec);

        if (arf_cmpabs_2exp_si(arb_midref(t), 200) > 0)
        {
            L = 1.0;
        }
        else if (arf_cmpabs_2exp_si(arb_midref(t), -200) < 0)
        {
            L = 0.0;
        }
        else
        {
            L = arf_get_d(arb_midref(t), ARF_RND_DOWN);
            L = 1.0 - 1.0/(1.0 + pow(L, 0.2));
        }

        S = 0.8;

        hls_to_rgb(R, G, B, H, L, S);
    }
    else
    {
        H = H / PI;
        H = FLINT_MAX(FLINT_MIN(H, 1.0), -1.0);

        for (i = 1; ; i++)
        {
            if (blue_orange_colors[i][0] > H)
            {
                double a, ra, ga, ba, b, rb, gb, bb, s;

                a  = blue_orange_colors[i-1][0];
                ra = blue_orange_colors[i-1][1];
                ga = blue_orange_colors[i-1][2];
                ba = blue_orange_colors[i-1][3];
                b  = blue_orange_colors[i][0];
                rb = blue_orange_colors[i][1];
                gb = blue_orange_colors[i][2];
                bb = blue_orange_colors[i][3];

                s = (H - a) / (b - a);
                *R = ra + (rb - ra) * s;
                *G = ga + (gb - ga) * s;
                *B = ba + (bb - ba) * s;
                break;
            }
        }
    }

    arb_clear(t);
    arb_clear(u);
}




