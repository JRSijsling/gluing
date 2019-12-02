/* Examples of Galois-stable maximal isotropic subgroups */

prec := 500;
F := RationalsExtra(prec);
R<x> := PolynomialRing(F);

f1 := x^3 + 400;
f2 := x^5 + 20*x^3 + 36*x;

print "";
print FactoredGaloisGroup([f1, f2]);

print "";
print ExistsGaloisStableSubgroup(f1, f2);

f1 := x*(x^2 - 6);
f2 := x*(x - 1)*(x - 2)*(x^2 - 6);
print "";
print ExistsGaloisStableSubgroup(f1, f2);

f1 := x*(x^2 - 6);
f2 := x*(x^2 - 6);
f3 := x*(x^2 - 6);
print "";
print ExistsGaloisStableSubgroup(f1, f2, f3);

f1 := x*(x^2 - 6);
f2 := x*(x^2 - 6);
f3 := x*(x - 1)*(x - 2);
print "";
print ExistsGaloisStableSubgroup(f1, f2, f3);

f1 := x^3 + 400;
f2 := x^5 + 20*x^3 + 36*x;
X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);
Vs := GaloisStableSubgroups(X1, X2);
print "";
print #Vs;

f1 := x*(x^2 - 6);
f2 := x*(x - 1)*(x - 2)*(x^2 - 6);
X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);
Vs := GaloisStableSubgroups(X1, X2);
print "";
print #Vs;

f1 := x*(x^2 - 6);
f2 := x*(x^2 - 6);
f3 := x*(x^2 - 6);
X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);
X3 := HyperellipticCurve(f3);
Vs := GaloisStableSubgroups(X1, X2, X3);
print "";
print #Vs;

f1 := x*(x^2 - 6);
f2 := x*(x^2 - 6);
f3 := x*(x - 1)*(x - 2);
X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);
X3 := HyperellipticCurve(f3);
Vs := GaloisStableSubgroups(X1, X2, X3);
print "";
print #Vs;
