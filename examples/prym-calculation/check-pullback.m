/* Second part of check: morphism has well-defined pullback on differentials */

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

test1, g := PrymPol(F);
X := PlaneCurve(F);
Y := HyperellipticCurve(g);

//KU<u,v> := FunctionField(X);
R<u,v> := PolynomialRing(K, 2);
F := u^4 + g2*u^2*v^2 + g1*u^2*v*1 + g0*u^2*1^2 + h2*v^3*1 + h1*v^2*1^2 + h0*v*1^3;
KU<u,v> := FieldOfFractions(quo<R | F >);
R<x> := PolynomialRing(KU);

den := (g2^2*h1 - g2*g1*h2 + h2^2)*v + g2^2*h0 - g2*g0*h2;
a0 := (g2*h0 - g0*h2)/den*u^2 + ((g2^2*h0 - g2*g0*h2)*v^2 + (g2*g1*h0 - g2*g0*h1 - h2*h0)*v)/den;
a1 := KU ! 0;
b0 := (g2^2*h0 - g2*g0*h2)/den*u^3 + ((g2^3*h0 - g2^2*g0*h2)*v^2 + (g2^2*g1*h0 - g2*g1*g0*h2 - g2*h2*h0 + g0*h2^2)*v + g2^2*g0*h0 - g2*g0^2*h2)/den*u;
b1 := b0/v;

a := x^2 + a1*x + a0;
b := b1*x + b0;

L := FieldOfFractions(quo< R | a >);
x1 := L.1;
x2 := -a1 - x1;
print [ Evaluate(a, xi) : xi in [ x1, x2 ] ];
y1 := b1*x1 + b0;
y2 := b1*x2 + b0;

// d xi = d (f^(1/2)) = 1/(2 xi) df
// dF/du du + dF/dv dv = 0

du := 1;
dv := -(2*g2*u^2*v + g1*u^2 + 3*h2*v^2 + 2*h1*v + h0)/(4*u^3 + 2*g2*u*v^2 + 2*g1*u*v + 2*g0*u);
dv := -(4*u^3 + 2*g2*u*v^2 + 2*g1*u*v + 2*g0*u)/(2*g2*u^2*v + g1*u^2 + 3*h2*v^2 + 2*h1*v + h0);

numx := (-g2*h0 + g0*h2)*u^2 + (-g2^2*h0 + g2*g0*h2)*v^2 + (-g2*g1*h0 + g2*g0*h1 + h2*h0)*v;
denx := (g2^2*h1 - g2*g1*h2 + h2^2)*v + g2^2*h0 - g2*g0*h2;
dnumx := (-g2*h0 + g0*h2)*2*u*du + (-g2^2*h0 + g2*g0*h2)*2*v*dv + (-g2*g1*h0 + g2*g0*h1 + h2*h0)*dv;
ddenx := (g2^2*h1 - g2*g1*h2 + h2^2)*dv;
der1 := (1/(2*x1))*(denx*dnumx - numx*ddenx)/denx^2;

print "";
print "Check well-defined:";

num1 := der1;
num2 := -der1;
den1 := 2*y1;
den2 := 2*y2;
deratt1 := (num1/den1) + (num2/den2);
print deratt1 in KU;

num1 := -der1;
num2 := der1;
den1 := 2*y1;
den2 := 2*y2;
deratt2 := (num1/den1) + (num2/den2);
print deratt2 in KU;

num1 := x1*der1;
num2 := num1;
den1 := 2*y1;
den2 := 2*y2;
deratt3 := (num1/den1) + (num2/den2);
print deratt3 in KU;

// Now du / (dF / dv)
dFdv := 2*g2*u^2*v + g1*u^2 + 3*h2*v^2 + 2*h1*v + h0;
//dercorr := 1/(2*g2*2*u*du*v + 2*g2*u^2*dv + g1*2*u*du + 3*h2*2*v*dv + 2*h1*dv);
dercorr := L ! (du/dFdv);

print "";
print "Result should be -1 and v because of pullback matrix:";
print deratt1/dercorr;
print deratt3/dercorr;
