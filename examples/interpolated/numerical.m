/* Checks one of the results numerically. */

K := RationalsExtra(300);
R<t> := PolynomialRing(K);
S<x,y,z> := PolynomialRing(K, 3);

pX := 4*t^3 + 5*t^2 - 98*t + 157;
pY := t^6 + 2*t^3 - 4*t^2 + 1;

F := 32*x^4 - 3*x^2*y^2 + 132*x^2*y*z - 37*x^2*z^2 + 3*y^4 - 14*y^3*z + 7*y^2*z^2 - 6*y*z^3 - 2*z^4;
c := 5^3;

X := HyperellipticCurve(pX);
Y := HyperellipticCurve(pY);
Z := PlaneCurve(F);

PX := PeriodMatrix(X);
PY := PeriodMatrix(Y);
PZ := PeriodMatrix(Z);

homZX := GeometricHomomorphismRepresentation(PZ, PX, K);
homZY := GeometricHomomorphismRepresentation(PZ, PY, K);

print homZX;
print homZY;
print BaseRing(homZX[1][1]);

