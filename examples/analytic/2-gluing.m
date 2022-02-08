/* Gluing along 2-torsion */

SetVerbose("QuarticIso", 1);
//SetVerbose("QuarticRec", 1);
//SetVerbose("Gluing", 1);
//SetVerbose("CurveRec", 1);
//SetVerbose("EndoFind", 1);

prec := 500;
F := RationalsExtra(prec);
R<x> := PolynomialRing(F);

f1 := 4*(x^3 - x^2 - 2*x - 1)+ x^2;
f2 := x^6 + 3*x^5 + 10*x^3 - 15*x^2 + 15*x - 6;

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);

//Ys := AllGeometric2GluingsCC(X1, X2, F);
//print Ys;
print SomeGeometricGluingCC(X1, X2, F, 2);
