module QuantJulia

# erf builds the normal CDF; gamma feeds the fractional Adams weights. Both
# carry ForwardDiff rules, which matters because Duals flow through prices —
# and through the fractional solver, where even α = H + 1/2 can be a Dual.
using SpecialFunctions: erf, gamma

include("blackscholes.jl")
include("heston.jl")
include("fourier.jl")
include("fractional_riccati.jl")
include("rough_heston.jl")
include("cboe.jl")
include("calibration.jl")

export normal_cdf, bs_price, bs_vega, bs_delta, implied_vol
export HestonParams, heston_cf, price_from_cf, heston_price, batch_call_prices
export solve_fractional_riccati, frac_integral_end
export RoughHestonParams, rough_heston_cf, make_rough_cf
export read_cboe, prepare_chain, calibrate_heston, heston_loss
export group_quotes, rough_heston_loss, calibrate_rough_heston

end # module
