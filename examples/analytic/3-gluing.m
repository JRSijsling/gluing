/* Gluing along 3-torsion */

SetVerbose("QuarticIso", 1);
SetVerbose("QuarticRec", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 1);
SetVerbose("EndoFind", 1);

prec := 500;
F := RationalsExtra(prec);
R<x> := PolynomialRing(F);

f2 := x^5 + 20*x^3 + 36*x;
f1 := 4*x^3 + 25;

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);

print SomeGeometricGluingCC(X1, X2, F, 3);
