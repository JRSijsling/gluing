/* Arithmetic reconstruction */

SetVerbose("QuarticIso", 1);
SetVerbose("Reconstruction", 1);
SetVerbose("Gluing", 1);
SetVerbose("CurveRec", 1);
SetVerbose("EndoFind", 1);

import "../magma/interpolated/routines.m": CompatibleRootPairings, CubicResolvent;

F := FiniteField(1009);
//F := Rationals();
R<x> := PolynomialRing(F);

if Type(F) eq FldRat then
    D := [-5..5];
else
    D := F;
end if;

while true do
    repeat
        f1 := 2*(x^4 + &+[ Random(D)*x^i : i in [0..3] ]);
        f2 := 3*(x^6 + &+[ Random(D)*x^i : i in [0..5] ]);

        //f1 := 4*x^3 + 5*x^2 - 98*x + 157;
        //f2 := x^6 + 2*x^3 - 4*x^2 + 1;
    until Discriminant(f1)*Discriminant(f2) ne 0;

    X1 := HyperellipticCurve(f1);
    X2 := HyperellipticCurve(f2);

    ress := AllArithmetic2Gluings(X1, X2);
    if #ress eq 0 then
        continue;
    end if;

    print "";
    print "Input curves:";
    print X1;
    print X2;

    if Type(F) eq FldRat then
        for res in ress do
            F3, c := Explode(res);
            assert #Factorization(GCD([ Integers() ! c : c in Coefficients(F3) ])) eq 0;
            assert c in Integers();
            print "";
            print F3;
            print Factorization(Integers() ! c);
        end for;
    else
        for res in ress do
            F3, c := Explode(res);
            print "";
            print F3;
            print IsSquare(c);
        end for;
    end if;
end while;
