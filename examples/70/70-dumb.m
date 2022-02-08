/* Alternative approach to 70-torsion point.
   Replace the package file galois.m by 70-galois.m */

SetVerbose("QuarticIso", 1);
SetVerbose("QuarticRec", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 2);
SetVerbose("EndoFind", 3);


prec := 300;
F := RationalsExtra(prec);
R<t> := PolynomialRing(F);

//118.c1
f1 := 4*t^3 + 5*t^2 - 98*t + 157;
//295.a.295.1
f2 := t^6 + 2*t^3 - 4*t^2 + 1;
f2 := 4*t^5 + 17*t^4 + 22*t^3 + 15*t^2 + 6*t + 1;

X1 := HyperellipticCurve(f1);
X2 := HyperellipticCurve(f2);

/* For some reason the smart version does not work. Yet despair not. */
//Ys := AllGeometric2Gluings(X1, X2, F);

/* In the end this gives */
/*
-32*x1^4 - 43*x1^2*x2^2 + 104*x1^2*x2*x3 + 332*x1^2*x3^2 + 2*x2^4 - 12*x2^3*x3 -
    28*x2^2*x3^2 - 112*x2*x3^3 - 48*x3^4
Reduced normalized curve:
2*x1^4 + 6*x1^3*x2 + 7*x1^3*x3 - 7*x1^2*x2^2 + 2*x1^2*x2*x3 - 5*x1^2*x3^2 +
    14*x1*x2^3 + 14*x1*x2^2*x3 - 5*x1*x2*x3^2 - 14*x1*x3^3 - 3*x2^4 + x2^3*x3 +
    25*x2^2*x3^2 + 17*x2*x3^3 - 2*x3^4
*/

S<x,y,z> := PolynomialRing(F, 3);
F3 := -32*x^4 - 43*x^2*y^2 + 104*x^2*y*z + 332*x^2*z^2 + 2*y^4 - 12*y^3*z - 28*y^2*z^2 - 112*y*z^3 - 48*z^4;
F3 := -32*25*x^4 - 43*5*x^2*y^2 + 104*5*x^2*y*z + 332*5*x^2*z^2 + 2*y^4 - 12*y^3*z - 28*y^2*z^2 - 112*y*z^3 - 48*z^4;
X := PlaneCurve(F3);

X1 := HyperellipticCurve(5*f1);
X2 := HyperellipticCurve(5*f2);

P3 := PeriodMatrix(X);
Q1 := PeriodMatrix(X1);
Q2 := PeriodMatrix(X2);
Q := DiagonalJoin(Q1, Q2);

rep, h := GeometricHomomorphismRepresentation(P3, Q1, F);
rep0 := EndomorphismRepresentation(rep, F, h);
print rep0;

rep, h := GeometricHomomorphismRepresentation(P3, Q2, F);
rep0 := EndomorphismRepresentation(rep, F, h);
print rep0;

rep, h := GeometricHomomorphismRepresentation(P3, Q, F);
rep0 := EndomorphismRepresentation(rep, F, h);
print rep0;

F3 := MinimizeReducePlaneQuartic(F3);
print "";
print "Reduced minimized:";
print F3;

f := F3;
test, Ts := QuarticIsomorphisms(f, f);
Ts := [ T : T in Ts | IsScalar(T^2) and not IsScalar(T) ];
T := Ts[1];
D, U := JordanForm(T);

f := TransformForm(f, U^(-1));
if D[1,1] eq D[2,2] then
    f := Evaluate(f, [z,y,x]);
end if;
cs := Coefficients(f);
f *:= LCM([ Denominator(c) : c in cs ]);
f /:= GCD([ Numerator(c) : c in cs ]);
G3 := f;

print "";
print "Reduced minimized in automorphism-normalized form:";
print G3;

print "";
print "There is a 70-torsion point on the Jacobian of this curve twisted by 5.";
print "The untwisted version still has a 7-torsion point.";

print "";
print ExistsGaloisStableSubgroup(f1, f2);
