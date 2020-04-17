/* Checks Prym of one of the results as recovered by RR is a multiple after substituting -1 */

K := RationalsExtra(300);
R<t> := PolynomialRing(K);
S<x,y,z> := PolynomialRing(K, 3);

pX := 4*t^3 + 5*t^2 - 98*t + 157;
pY := t^6 + 2*t^3 - 4*t^2 + 1;

F := 32*x^4 - 3*x^2*y^2 + 132*x^2*y*z - 37*x^2*z^2 + 3*y^4 - 14*y^3*z + 7*y^2*z^2 - 6*y*z^3 - 2*z^4;
h := -3*y^2 + 132*y*z - 37*z^2;
f := y^2 - 4*y*z - z^2;
g := 3*y^2 - 2*y*z + 2*z^2;

h := -h/32;
g := g/32;

h2 := MonomialCoefficient(h, y^2); h1 := MonomialCoefficient(h, y*z); h0 := MonomialCoefficient(h, z^2);
g2 := MonomialCoefficient(g, y^2); g1 := MonomialCoefficient(g, y*z); g0 := MonomialCoefficient(g, z^2);
f2 := MonomialCoefficient(f, y^2); f1 := MonomialCoefficient(f, y*z); f0 := MonomialCoefficient(f, z^2);

A := Matrix([ [ f2, f1, f0 ], [ h2, h1, h0 ], [ g2, g1, g0 ] ]);
B := A^(-1);

a1 := B[1,1]; b1 := B[1,2]; c1 := B[1,3];
a2 := B[2,1]; b2 := B[2,2]; c2 := B[2,3];
a3 := B[3,1]; b3 := B[3,2]; c3 := B[3,3];

a := a1*z^2 + 2*a2*y*z + a3*y^2;
b := b1*z^2 + 2*b2*y*z + b3*y^2;
c := c1*z^2 + 2*c2*y*z + c3*y^2;

p0 := Determinant(A)^2*b*(b^2 - a*c);
pY := S ! (z^6*Evaluate(pY, y/z));
print p0;
print pY;
