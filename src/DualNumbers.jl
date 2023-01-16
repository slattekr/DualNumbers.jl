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

#multiplication
# x = a + eps b
# y = c + eps b
# eps^2 = 0
#x * y = a*c+eps * (a*d + c*b)
Base.:*(x::Dual, y::Dual) = Dual(x.real * y.real, x.real * y.dual + x.dual *y.real)
#Conjugate
Base.conj(x::Dual) = Dual(x.real, -x.dual)

#Inverse
#	1/(a + eps b)
#	= (a-eps b) / [(a+ eps b)*(a - eps b)]
#	= (a - eps b)/ a^2
#	= (1 /a^2) * (a - eps b)
Base.inv(x::Dual) = conj(x) * (1/x.real^2)
#division
Base.:/(x::Dual, y::Dual) = x* inv(y)

end # module DualNumbers
