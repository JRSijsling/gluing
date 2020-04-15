/* First part of check: morphism well-defined */

SetVerbose("EndoCheck", 0);

function PrymPol(F);

S<x,y,z> := Parent(F);
R<t> := PolynomialRing(BaseRing(S));

a := MonomialCoefficient(F, x^4);
b := MonomialCoefficient(F, x^2*y^2)*t^2 + MonomialCoefficient(F, x^2*y*z)*t + MonomialCoefficient(F, x^2*z^2);
c := MonomialCoefficient(F, y^4)*t^4 + MonomialCoefficient(F, y^3*z)*t^3 + MonomialCoefficient(F, y^2*z^2)*t^2 + MonomialCoefficient(F, y*z^3)*t + MonomialCoefficient(F, z^4);

h := -b/a;
fg := c/a;
f := t;
g := R ! (fg / f);

f2 := Coefficient(f, 2); f1 := Coefficient(f, 1); f0 := Coefficient(f, 0);
g2 := Coefficient(g, 2); g1 := Coefficient(g, 1); g0 := Coefficient(g, 0);
h2 := Coefficient(h, 2); h1 := Coefficient(h, 1); h0 := Coefficient(h, 0);

A := Matrix([ [ f2, f1, f0 ], [ h2, h1, h0 ], [ g2, g1, g0 ] ]);
if Determinant(A) eq 0 then
    return false, 0;
end if;
B := A^(-1);

a1 := B[1,1]; b1 := B[1,2]; c1 := B[1,3];
a2 := B[2,1]; b2 := B[2,2]; c2 := B[2,3];
a3 := B[3,1]; b3 := B[3,2]; c3 := B[3,3];

a := a1 + 2*a2*t + a3*t^2;
b := b1 + 2*b2*t + b3*t^2;
c := c1 + 2*c2*t + c3*t^2;

f := Determinant(A)^2*b*(b^2 - a*c);
return true, f;

end function;


K<g2,g1,g0,h2,h1,h0> := RationalFunctionField(Rationals(), 6);
S<x,y,z> := PolynomialRing(K, 3);
G := g2*y^2 + g1*y*z + g0*z^2;
H := h2*y^2 + h1*y*z + h0*z^2;
F := x^4 + x^2*G + y*z*H;

/* Observe the symmetries */
test1, g := PrymPol(F);
print g;
print (g2*h0 - g0*h2)*g;
print [ Factorization(Numerator(c)) : c in Coefficients((g2*h0 - g0*h2)*g) ];

X := PlaneCurve(F);
Y := HyperellipticCurve(g);

KU<u,v> := FunctionField(X);
Y := BaseExtend(Y, KU);
R<x> := PolynomialRing(BaseRing(Y));
J := Jacobian(Y);

den := (g2^2*h1 - g2*g1*h2 + h2^2)*v + g2^2*h0 - g2*g0*h2;
a0 := (g2*h0 - g0*h2)/den*u^2 + ((g2^2*h0 - g2*g0*h2)*v^2 + (g2*g1*h0 - g2*g0*h1 - h2*h0)*v)/den;
a1 := KU ! 0;
b0 := (g2^2*h0 - g2*g0*h2)/den*u^3 + ((g2^3*h0 - g2^2*g0*h2)*v^2 + (g2^2*g1*h0 - g2*g1*g0*h2 - g2*h2*h0 + g0*h2^2)*v + g2^2*g0*h0 - g2*g0^2*h2)/den*u;
b1 := b0/v;

a := x^2 + a1*x + a0;
b := b1*x + b0;
div1 := J ! [a, b];
print div1;

// Always well-defined because if not then g2 = 0, h2 = 0, leading to det = 0.
// Case g2 = 0 is special, because this is not immediately defined around starting point.
// Still, the verification works.
