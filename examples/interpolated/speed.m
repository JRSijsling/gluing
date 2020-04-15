/* Sanity check. Error of the kind
    >> num2*t^2 + num1*t + num0)/den;
                                ^
    Runtime error in '/': Argument 2 is not a unit
are fine */

F := Rationals();
R<x> := PolynomialRing(F);

if Type(F) eq FldRat then
    D := [-10^100..10^100];
else
    D := F;
end if;

counter := 0;
while true do
    counter +:= 1;
    print counter;
    repeat
        repeat c1 := Random(D); until c1 ne 0;
        repeat c2 := Random(D); until c2 ne 0;
        f1 := &*[ x - Random(D) : i in [1..Random([3,4])] ];
        f2 := &*[ x - Random(D) : i in [1..Random([5,6])] ];
    until Discriminant(f1)*Discriminant(f2) ne 0;

    X1 := HyperellipticCurve(f1);
    X2 := HyperellipticCurve(f2);

    ress := AllArithmetic2Gluings(X1, X2);
    //print ress;
end while;
