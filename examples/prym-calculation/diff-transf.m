/* Third part of check: RR transforms equations as claimed */

SetVerbose("EndoCheck", 0);

F<la> := RationalFunctionField(Rationals());
K<g2,g1,g0,h2,h1,h0> := RationalFunctionField(F, 6);
S<x,y,z> := PolynomialRing(K, 3);
R<t> := PolynomialRing(K);

h := h2*y^2 + h1*y*z + h0*z^2;
g := g2*y^2 + g1*y*z + g0*z^2;
f := y*z;

h2 := MonomialCoefficient(h, y^2); h1 := MonomialCoefficient(h, y*z); h0 := MonomialCoefficient(h, z^2);
g2 := MonomialCoefficient(g, y^2); g1 := MonomialCoefficient(g, y*z); g0 := MonomialCoefficient(g, z^2);
f2 := MonomialCoefficient(f, y^2); f1 := MonomialCoefficient(f, y*z); f0 := MonomialCoefficient(f, z^2);

A := Matrix([ [ f2, f1, f0 ], [ h2, h1, h0 ], [ g2, g1, g0 ] ]);
B := A^(-1);

a1 := B[1,1]; b1 := B[1,2]; c1 := B[1,3];
a2 := B[2,1]; b2 := B[2,2]; c2 := B[2,3];
a3 := B[3,1]; b3 := B[3,2]; c3 := B[3,3];

a := a1 + 2*a2*t + a3*t^2;
b := b1 + 2*b2*t + b3*t^2;
c := c1 + 2*c2*t + c3*t^2;

p0 := Determinant(A)^2*b*(b^2 - a*c);


h := Evaluate(h, [x, y + la*z, z]);
g := Evaluate(g, [x, y + la*z, z]);
f := Evaluate(f, [x, y + la*z, z]);

h2 := MonomialCoefficient(h, y^2); h1 := MonomialCoefficient(h, y*z); h0 := MonomialCoefficient(h, z^2);
g2 := MonomialCoefficient(g, y^2); g1 := MonomialCoefficient(g, y*z); g0 := MonomialCoefficient(g, z^2);
f2 := MonomialCoefficient(f, y^2); f1 := MonomialCoefficient(f, y*z); f0 := MonomialCoefficient(f, z^2);

A := Matrix([ [ f2, f1, f0 ], [ h2, h1, h0 ], [ g2, g1, g0 ] ]);
B := A^(-1);

a1 := B[1,1]; b1 := B[1,2]; c1 := B[1,3];
a2 := B[2,1]; b2 := B[2,2]; c2 := B[2,3];
a3 := B[3,1]; b3 := B[3,2]; c3 := B[3,3];

a := a1 + 2*a2*t + a3*t^2;
b := b1 + 2*b2*t + b3*t^2;
c := c1 + 2*c2*t + c3*t^2;

p := Determinant(A)^2*b*(b^2 - a*c);
p := Evaluate(p, t + la);

print "";
print p0 eq p;
