/* Gluing of elliptic curves along 3-torsion */

SetVerbose("QuarticIso", 1);
SetVerbose("QuarticRec", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 1);
SetVerbose("EndoFind", 1);

prec := 500;
R<t> := PolynomialRing(Rationals());
QQ := RationalsExtra(prec);
/* TODO: SplittingField */
F := BaseNumberFieldExtra(t^6 - 3*t^5 + 7*t^4 - 9*t^3 + 7*t^2 - 3*t + 1, prec);
CC := F`CC;

R<x> := PolynomialRing(F);
rts := RootsPari(t^3 + t - 1, F);

f1 := x^3 + rts[1];
f2 := x^3 + rts[2];
f3 := x^3 + rts[3];

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);
X3 := HyperellipticCurve(f3);

Y := SomeGeometricGluingCC(X1, X2, X3, QQ, 3);
print "";
print Y;

