
void arb_urandom(arb_t x, flint_rand_t state, slong prec);
 
void arb_log(arb_t z, const arb_t x, slong prec);

void arb_exp(arb_t z, const arb_t x, slong prec);

void _acb_dirichlet_hardy_z_series(acb_ptr res, acb_srcptr s, slong slen, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

void acb_dirichlet_hardy_z_series(acb_poly_t res, const acb_poly_t s, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

void acb_sinh(acb_t y, const acb_t x, slong prec);

void acb_elliptic_f(acb_t res, const acb_t phi, const acb_t m, int times_pi, slong prec);

void arb_sech(arb_t res, const arb_t x, slong prec);

void acb_sech(acb_t r, const acb_t z, slong prec);

jlong bufferAddress(jobject buffer);

void acb_tan(acb_t r, const acb_t z, slong prec);

void acb_sec(acb_t y, const acb_t x, slong prec);

void arb_add_ui(arb_t z, const arb_t x, ulong y, slong prec);

void arb_sub_ui(arb_t z, const arb_t x, ulong y, slong prec);

void mag_div(mag_t z, const mag_t x, const mag_t y);

void mag_log(mag_t z, const mag_t x);

void mag_inv(mag_t res, const mag_t x);

int arf_is_zero(const arf_t x);

void acb_add_arb(acb_t z, const acb_t x, const arb_t y, slong prec);

void arb_mul_ui(arb_t z, const arb_t x, ulong y, slong prec);
 
void arb_mul_si(arb_t z, const arb_t x, ulong y, slong prec);

void arb_mul_si(arb_t z, const arb_t x, slong y, slong prec);
void arb_mul_ui(arb_t z, const arb_t x, ulong y, slong prec);

void dirichlet_group_init(dirichlet_group_t G, ulong q);
void dirichlet_subgroup_init(dirichlet_group_t H, const dirichlet_group_t G, ulong h);
void dirichlet_group_clear(dirichlet_group_t G);

void dirichlet_char_init(dirichlet_char_t x, const dirichlet_group_t G);

void dirichlet_char_clear(dirichlet_char_t x);

void arb_mat_clear(arb_mat_t mat);
void acb_mat_clear(acb_mat_t mat);

void acb_poly_clear(acb_poly_t poly);

void mpfr_clear (mpfr_ptr);

 void flint_cleanup(void);
 void flint_cleanup_master(void);


int f_lemniscate(acb_ptr res, const acb_t z, void * param, slong order, slong prec);
int f_lemniscate_derivative(acb_ptr res, const acb_t z, void * param, slong order, slong prec);
int f_lemniscate_derivative_abs(acb_ptr res, const acb_t z, void * param, slong order, slong prec);

void acb_calc_gl_node(arb_t x, arb_t w, slong i, slong k, slong prec);

extern "C" {

int arf_cmp(const arf_t x, const arf_t y);
 
void acb_one(acb_t z);
 
int arb_is_zero(const arb_t z);

int acb_is_zero(const acb_t z);

void acb_div_si(acb_t z, const acb_t x, slong c, slong prec);

void acb_neg(acb_t z, const acb_t x);

int acb_equal(const acb_t x, const acb_t y);

int arb_equal(const arb_t x, const arb_t y);

void arb_set_si(arb_t x, slong y);

void mag_set_d(mag_t res, double x);
 
void acb_dft_inverse_precomp(acb_ptr w, acb_srcptr v, const acb_dft_pre_t pre, slong prec);
 
void acb_dft_precomp(acb_ptr w, acb_srcptr v, const acb_dft_pre_t pre, slong prec);
 
void acb_dft_precomp_clear(acb_dft_pre_t pre);
 
void acb_dft_precomp_init(acb_dft_pre_t pre, slong len, slong prec);
 
void acb_dft_inverse(acb_ptr w, acb_srcptr v, slong n, slong prec);
 
void acb_dft(acb_ptr w, acb_srcptr v, slong n, slong prec);
 
int acb_is_real(const acb_t x);

void mag_swap(mag_t x, mag_t y);

void acb_swap(acb_t z, acb_t x);

void mag_max(mag_t z, const mag_t x, const mag_t y);

void mag_mul_2exp_si(mag_t z, const mag_t x, slong y);

void acb_get_mag_lower(mag_t z, const acb_t x);

void arb_get_mag_lower(mag_t z, const arb_t x);

mag_ptr _mag_vec_init(slong n);

void arb_get_interval_arf(arf_t a, arf_t b, const arb_t x, slong prec);

void arb_tan(arb_t y, const arb_t x, slong prec);

void acb_inv(acb_t res, const acb_t z, slong prec);

void arb_inv(arb_t z, const arb_t x, slong prec);
 
slong arb_allocated_bytes(const arb_t x);

void arf_set_mag(arf_t y, const mag_t x);

void arf_mag_add_ulp(mag_t z, const mag_t x, const arf_t y, slong prec);

void arb_printd(const arb_t x, slong digits);

int arf_is_pos_inf(const arf_t x);

int arf_is_neg_inf(const arf_t x);

int arf_sgn(const arf_t x);

int arf_is_nan(const arf_t x);

int arf_equal(const arf_t x, const arf_t y);

int arf_is_inf(const arf_t x);

void arb_get_mag(mag_t z, const arb_t x);

void mag_sub_lower(mag_t z, const mag_t x, const mag_t y);

void arb_add_error_mag(arb_t x, const mag_t err);

void mag_div(mag_t z, const mag_t x, const mag_t y);

void mag_mul_ui_lower(mag_t z, const mag_t x, ulong y);

void mag_sub(mag_t z, const mag_t x, const mag_t y);

double mag_get_d(const mag_t z);

void acb_zero(acb_t z);

void acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, slong prec);

void mag_add_lower(mag_t z, const mag_t x, const mag_t y);

void mag_mul_lower(mag_t z, const mag_t x, const mag_t y);

void acb_add_error_mag(acb_t x, const mag_t err);

void arb_neg(arb_t y, const arb_t x);

void arf_interval_swap(arf_interval_t v, arf_interval_t u);

void arb_set_arf(arb_t x, const arf_t y);


void mag_one(mag_t x);

void mag_mul_2exp_si(mag_t z, const mag_t x, slong y);

void mag_clear(mag_t x);

void mag_inf(mag_t x);

void acb_mul_2exp_si(acb_t z, const acb_t x, slong e);

void acb_indeterminate(acb_t x);

int arb_is_positive(const arb_t x);

int arb_is_negative(const arb_t x);

void mag_sqrt(mag_t y, const mag_t x);
void mag_sqrt_lower(mag_t y, const mag_t x);
void mag_rsqrt(mag_t y, const mag_t x);
void mag_rsqrt_lower(mag_t y, const mag_t x);

void mag_root(mag_t y, const mag_t x, ulong n);

void mag_hypot(mag_t z, const mag_t x, const mag_t y);

void mag_binpow_uiui(mag_t b, ulong m, ulong n);

void mag_polylog_tail(mag_t u, const mag_t z, slong sigma, ulong d, ulong N);

void mag_geom_series(mag_t res, const mag_t x, ulong n);

void mag_hurwitz_zeta_uiui(mag_t res, ulong s, ulong a);

void mag_set_ui(mag_t z, ulong x);
void mag_set_ui_lower(mag_t z, ulong x);


void mag_set(mag_t x, const mag_t y);

void mag_pow_ui_lower(mag_t z, const mag_t x, ulong e);

void arf_mul_2exp_si(arf_t y, const arf_t x, slong e);

void arf_interval_set(arf_interval_t v, const arf_interval_t u);

void arf_interval_get_arb(arb_t x, const arf_interval_t v, slong prec);

int arb_sgn_nonzero(const arb_t x);

void acb_poly_derivative(acb_poly_t res, const acb_poly_t poly, slong prec);
void acb_poly_integral(acb_poly_t res, const acb_poly_t poly, slong prec);
 
void acb_poly_product_roots(acb_poly_t poly, acb_srcptr xs, slong n, slong prec);
 
void acb_poly_evaluate(acb_t y, const acb_poly_t f, const acb_t x, slong prec);
 
void acb_poly_evaluate2(acb_t y, acb_t z, const acb_poly_t f, const acb_t x, slong prec);

void flint_free(void * ptr);
                            
void arb_mat_init(arb_mat_t mat, slong r, slong c);
  
  void acb_get_mag(mag_t u, const acb_t z);

 void acb_mat_init(acb_mat_t mat, slong r, slong c);
 
void acb_dot(acb_t res, const acb_t initial, int subtract, acb_srcptr x, slong xstep, acb_srcptr y, slong ystep, slong len, slong prec);

void acb_poly_interpolate_newton(acb_poly_t poly, acb_srcptr xs, acb_srcptr ys, slong n, slong prec);
    
void arf_zero(arf_t x);

void acb_cosh(acb_t y, const acb_t x, slong prec);

void arf_neg(arf_t y, const arf_t x);

int arf_mul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_any(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

int arf_mul_rnd_down(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec);

void * flint_malloc(size_t size);
void * flint_realloc(void * ptr, size_t size);
void * flint_calloc(size_t num, size_t size);

%apply double *OUTPUT { double *R };
%apply double *OUTPUT { double *G };
%apply double *OUTPUT { double *B };

void color_function(double * R, double * G, double * B, const acb_t z, int mode);

 void acb_set_d(acb_t z, double c);

 void acb_dirichlet_zeta_jet(acb_t res, const acb_t s, int deflate, slong len, slong prec);
 
 void acb_dirichlet_hardy_z(acb_ptr res, 
                                  const acb_t t, 
								  const dirichlet_group_t G, 
								  const dirichlet_char_t chi,
								  slong len, 
								  slong prec);
	
 void acb_print(const acb_t x);
	 			  
 char *arb_get_str(const arb_t x, slong n, ulong flags);

char * arf_get_str(const arf_t x, slong d);

 double arf_get_d(const arf_t x, arf_rnd_t rnd);

 void arf_set_d(arf_t x, double v);

 int arf_sub(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

 void acb_conj(acb_t z, const acb_t x);
 
void arb_floor(arb_t y, const arb_t x, slong prec);

void arb_ceil(arb_t y, const arb_t x, slong prec);

void arb_div(arb_t z, const arb_t x, const arb_t y, slong prec);

 void acb_div_si(acb_t z, const acb_t x, slong y, slong prec);
 
 void arb_sin(arb_t s, const arb_t x, slong prec);

 void arb_cos(arb_t s, const arb_t x, slong prec);

void arb_mul(arb_t z, const arb_t x, const arb_t y, slong prec);

slong arf_abs_bound_lt_2exp_si(const arf_t x);

void arb_mul_2exp_si(arb_t y, const arb_t x, slong e);

void arb_get_abs_ubound_arf(arf_t u, const arb_t x, slong prec);
void acb_mul_si(acb_t z, const acb_t x, slong y, slong prec);

 
 int arf_mul_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);

int
arf_mul_si(arf_ptr z, arf_srcptr x, slong y, slong prec, arf_rnd_t rnd);

 int arf_div_ui(arf_ptr z, arf_srcptr x, ulong y, slong prec, arf_rnd_t rnd);

 int mag_cmp(const mag_t x, const mag_t y);

 void arb_swap(arb_t x, arb_t y);

 void mag_init(mag_t x);
 
 void mag_add(mag_t z, const mag_t x, const mag_t y);
 
 void arf_set(arf_t y, const arf_t x);

 void mag_pow_ui(mag_t res, const mag_t x, ulong e);
 
 void mag_mul(mag_t z, const mag_t x, const mag_t y);

 void arf_get_mag(mag_t y, const arf_t x);

 int arf_add(arf_ptr z, arf_srcptr x, arf_srcptr y, slong prec, arf_rnd_t rnd);

 slong acb_rel_accuracy_bits(const acb_t x);

 void acb_dirichlet_hardy_z(acb_ptr res, const acb_t t, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

 slong arb_bits(const arb_t x);
 
 void acb_pow_ui(acb_t y, const acb_t b, ulong e, slong prec);

 void acb_add_ui(acb_t z, const acb_t x, ulong c, slong prec);

 void acb_log(acb_t r, const acb_t z, slong prec);

 void acb_tanh(acb_t y, const acb_t x, slong prec);

 void color_function(double * R, double * G, double * B, const acb_t z, int mode);

 void arb_set_d(arb_t x, double y);
        
 void acb_dirichlet_hurwitz(acb_t res, const acb_t s, const acb_t a, slong prec);

 void acb_dirichlet_hardy_theta(acb_ptr res, const acb_t t, const dirichlet_group_t G, const dirichlet_char_t chi, slong len, slong prec);

 void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec);

void acb_cos(acb_t r, const acb_t z, slong prec);

void acb_sin(acb_t r, const acb_t z, slong prec);

 void acb_exp(acb_t y, const acb_t z, slong prec);
  
 void arb_add(arb_t z, const arb_t x, const arb_t y, slong prec);
  
 void arb_sub(arb_t z, const arb_t x, const arb_t y, slong prec);
  
 void acb_arg(arb_t r, const acb_t z, slong prec);
  
 void acb_modular_eisenstein(acb_ptr r, const acb_t tau, slong len, slong prec);
 
 void acb_pow_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
  
 void acb_pow(acb_t z, const acb_t x, const acb_t y, slong prec);

 void nthHardyZero( arb_t res, int n, slong prec );

 int arb_contains(const arb_t x, const arb_t y);

int arb_contains_zero(const arb_t x);

 int arb_set_str(arb_t res, const char *inp, slong prec);
  
 int arb_overlaps(const arb_t x, const arb_t y);

  acb_ptr _acb_vec_init(slong n);

  arb_ptr _arb_vec_init(slong n);

  void _acb_vec_clear(acb_ptr v, slong n);

 void acb_mul_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_mul(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_set(acb_t z, const acb_t x);

  void acb_clear(acb_t x);

void mag_clear(mag_t x);

void arb_clear(arb_t x);

 void acb_add(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_sub_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_add_ui(acb_t z, const acb_t x, ulong y, slong prec);

 void acb_div(acb_t z, const acb_t x, const acb_t y, slong prec);

 void acb_sub(acb_t z, const acb_t x, const acb_t y, slong prec);

 arb_ptr _arb_vec_init(slong n);
 void _arb_vec_clear(arb_ptr v, slong n);
 void acb_mul_onei(acb_t z, const acb_t x);
 void acb_div_onei(acb_t z, const acb_t x);
 void acb_neg(acb_t z, const acb_t x);
 void arb_pow_ui(arb_t y, const arb_t b, ulong e, slong prec);

void acb_abs(arb_t r, const acb_t z, slong prec);
 
void arb_sqrt(arb_t z, const arb_t x, slong prec);
 
void acb_sqr(acb_t z, const acb_t x, slong prec);
  
int acb_contains(const acb_t x, const acb_t y);

int acb_overlaps(const acb_t x, const acb_t y);
   
int acb_contains_zero(const acb_t x); 


 slong acb_allocated_bytes(const acb_t x);
 
 void acb_mul_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
 void acb_div_arb(acb_t z, const acb_t x, const arb_t y, slong prec);
 
 void acb_neg(acb_t z, const acb_t x); 
 void arb_set(arb_t z, const arb_t x);
 
 void acb_elliptic_k(acb_t res, const acb_t m, slong prec);
  
void acb_get_mid(acb_t m, const acb_t x);
                                       
void arb_const_pi(arb_t z, slong prec);

int arb_is_finite(const arb_t z);

int acb_is_finite(const acb_t z);

 void arb_abs(arb_t y, const arb_t x);
  
   void arb_zero(arb_t x);
   
    void arb_one(arb_t f);
    
    void arb_pos_inf(arb_t x);
    
  void arb_neg_inf(arb_t x);
 
 
 void arb_zero_pm_inf(arb_t x);
 
  void arb_indeterminate(arb_t x);
  
   void arb_zero_pm_one(arb_t x);
   
    slong arb_rel_accuracy_bits(const arb_t x);
    
    void arb_unit_interval(arb_t x);
    
    void mag_zero(mag_t res);
    
   void arb_div_si(arb_t z, const arb_t x, slong y, slong prec);
   
  void arb_trim(arb_t y, const arb_t x);
  
   void arb_set_interval_mag(arb_t x, const mag_t a, const mag_t b, slong prec);

void arb_sub(arb_t z, const arb_t x, const arb_t y, slong prec);

void acb_modular_theta_series(acb_poly_t theta1, acb_poly_t theta2, acb_poly_t theta3, acb_poly_t theta4, const acb_poly_t z, const acb_t tau, slong len, slong prec);

 void acb_poly_init(acb_poly_t poly);
 
 void arf_clear(arf_t x);
 
void arb_init(arb_t x);

void arf_init(arf_t x);

void acb_init(acb_t x);
 
  void arb_tanh(arb_t y, const arb_t x, slong prec);

  void arb_asinh(arb_t z, const arb_t x, slong prec);
 
  void arb_acosh(arb_t z, const arb_t x, slong prec);
  
  void arb_lambertw(arb_t res, const arb_t x, int flags, slong prec);
  
  void arb_gamma(arb_t z, const arb_t x, slong prec);
  
  void arb_lgamma(arb_t z, const arb_t x, slong prec);
  
  void arb_sqr(arb_t y, const arb_t x, slong prec);
  
  void acb_sqrt(acb_t y, const acb_t x, slong prec);
  
 // TODO: add https://arb.org/acb_modular.html#c.psl2z_t
}
