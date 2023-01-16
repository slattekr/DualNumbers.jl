module DualNumbers

export Dual
"""
	Dual: A dual number
"""
struct Dual{T}
	real::T
	dual::T
end

#Identity and negation
Base.:+(x::Dual) = x
Base.:-(x::Dual) = Dual(-x.real, -x.dual)

#Addition and subtraction operators
Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
#Base.:-(x::Dual, y::Dual) = Dual(x.real - y.real, x.dual - y.dual)
Base.:-(x::Dual, y::Dual) = x + -y

#scalar Multiplication
Base.:*(a::Number, x::Dual) = Dual(a * x.real, a * x.dual)
Base.:*(x::Dual, a::Number) = Dual(x.real * a, x.dual * a)

end # module DualNumbers
