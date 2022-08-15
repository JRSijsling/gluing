/* Arithmetic reconstruction */

F := FiniteField(17);
//F := Rationals();
R<x> := PolynomialRing(F);

if Type(F) eq FldRat then
    D := [-5..5];
else
    D := F;
end if;

while true do
    repeat
        repeat c1 := Random(D); until c1 ne 0;
        repeat c2 := Random(D); until c2 ne 0;
        f1 := c1*(x^4 + &+[ Random(D)*x^i : i in [0..3] ]);
        f2 := c2*(x^6 + &+[ Random(D)*x^i : i in [0..5] ]);

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
            F3, c, fab, pair := Explode(res);
            assert #Factorization(GCD([ Integers() ! c : c in Coefficients(F3) ])) eq 0;
            print "";
            print "Glued curve";
            print F3;
            if c in Integers() then
                print "";
                print "Factorization of twisting scalar:";
                print Factorization(Integers() ! c);
            end if;
            print "Complementary quadratic factor:";
            print fab;
            print "Torsion isomorphism:";
            print pair;
        end for;
    else
        for res in ress do
            F3, c, fab, pair := Explode(res);
            print "";
            print "Glued curve";
            print F3;
            print "";
            print "Is the twisting scalar a square?";
            print IsSquare(c);
            print "Complementary quadratic factor:";
            print fab;
            print "Torsion isomorphism:";
            print pair;
        end for;
    end if;
end while;
