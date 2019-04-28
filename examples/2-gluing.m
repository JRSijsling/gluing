/* Gluing along 2-torsion */

SetVerbose("QuarticIso", 1);
SetVerbose("Reconstruction", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 1);
SetVerbose("EndoFind", 1);

prec := 500;
F := RationalsExtra(prec);
R<x> := PolynomialRing(F);

f1 := x*(x^2 - 6);
f2 := x*(x + 2)*(x^2 - 2*x - 2)*(x^2 - 6);

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);

//Ys := AllGeometric2Gluings(X1, X2, F);
//print Ys;
print SomeGeometricGluing(X1, X2, F, 2);
