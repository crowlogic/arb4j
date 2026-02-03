# Install package first (run once)
#import Pkg
#Pkg.add("MittagLeffler")

# Now run verification
using MittagLeffler
using Printf

tests = [
    ("E_{1,1}(2)", 1.0, 1.0, 2.0),
    ("E_{0.5,1}(0.5)", 0.5, 1.0, 0.5),
    ("E_{0.75,1}(1+2i)", 0.75, 1.0, 1.0+2.0im),
    ("E_{0.9,1}(-5)", 0.9, 1.0, -5.0),
    ("E_{0.8,2.0}(0.2)", 0.8, 2.0, 0.2),
    ("E_{0.6,0.7}(2-i)", 0.6, 0.7, 2.0-1.0im),
    ("E_{0.8,0.5}(80)", 0.8, 0.5, 80.0),
    ("E_{0.9,1.3}(0.25)", 0.9, 1.3, 0.25),
    ("E_{1.0,2.5}(80)", 1.0, 2.5, 80.0),
    ("E_{1.0,0.5}(80)", 1.0, 0.5, 80.0)
]

println("Julia MittagLeffler.jl Verification")
println("="^80)

for (name, α, β, z) in tests
    result = mittleff(α, β, z)
    println("\n$name")
    if imag(result) != 0
        @printf("  Re: %.60f\n", real(result))
        @printf("  Im: %.60f\n", imag(result))
    else
        @printf("  %.60e\n", real(result))
    end
end
