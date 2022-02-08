/* Arithmetic reconstruction */

SetVerbose("QuarticIso", 1);
SetVerbose("QuarticRec", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 1);
SetVerbose("EndoFind", 1);

prec := 500;
F := RationalsExtra(prec);
R<x> := PolynomialRing(F);

f1 := x^3 - x;
f2 := x^5 + 20*x^3 + 36*x;

print "";
print "Can we glue over QQ?";
print ExistsGaloisStableSubgroup(f1, f2);

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);

print "";
print "All arithmetic 2-gluings:";
Ys := AllArithmetic2GluingsCC(X1, X2, F);
print Ys;

S<x,y,z> := PolynomialRing(F, 3);
fs := [ ];
for Y in [ Y : Y in Ys | Type(Y) eq CrvPln ] do
    f := DefiningPolynomial(Y);
    f *:= LCM([ Denominator(c) : c in Coefficients(f) ]);
    Append(~fs, S ! f);
end for;
print fs;

/*
[
    x^4 + 48*x^2*y*z - 288*y^4 + 288*y^2*z^2 - 8*z^4,
    x^4 + 24*x^2*y*z - 720*y^4 + 144*y^2*z^2 - 20*z^4,
    x^4 - 48*x^2*y*z - 288*y^4 + 288*y^2*z^2 - 8*z^4,
    x^4 - 24*x^2*y*z - 720*y^4 + 144*y^2*z^2 - 20*z^4,
    x^4 + 48*x^2*y*z + 1008*y^4 - 432*y^2*z^2 + 28*z^4,
    x^4 - 48*x^2*y*z + 1008*y^4 - 432*y^2*z^2 + 28*z^4
]
*/

