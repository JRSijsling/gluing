/***
 *  Reconstructing the glued curves
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


declare verbose Gluing, 2;
import "Vs.m": AllVs2For12, AllVs2For111, GenerateVFor12, GenerateVFor111, LiftFF;


function QFromPVFor12(P, V)
/* Creates quotient of abelian variety corresponding to P by symplectic
 * subgroup corresponding to V */

p := Characteristic(BaseRing(V));
L1 := Lattice(IdentityMatrix(Rationals(), 6));
M2 := Matrix(Basis(V));
M2 := Matrix(Rationals(), #Rows(M2), #Rows(Transpose(M2)), [ LiftFF(c, p) : c in Eltseq(M2) ]);
L2 := Lattice(M2);
L := L1 + L2;
T := Matrix(Basis(L));

E1 := StandardSymplecticMatrix(1);
E2 := StandardSymplecticMatrix(2);
E3 := DiagonalJoin(E1, E2);
T1 := Transpose(T);
E := Transpose(T1)*E3*T1;

E0, T2 := FrobeniusFormAlternating(ChangeRing(p*E, Integers()));
BT := T1*Transpose(T2);

Q := P*ChangeRing(BT, BaseRing(P));
assert IsBigPeriodMatrix(Q);
return Q;

end function;


function QFromPVFor111(P, V)
/* Creates quotient of abelian variety corresponding to P by symplectic
 * subgroup corresponding to V */

p := Characteristic(BaseRing(V));
L1 := Lattice(IdentityMatrix(Rationals(), 6));
M2 := Matrix(Basis(V));
M2 := Matrix(Rationals(), #Rows(M2), #Rows(Transpose(M2)), [ LiftFF(c, p) : c in Eltseq(M2) ]);
L2 := Lattice(M2);
L := L1 + L2;
T := Matrix(Basis(L));

E1 := StandardSymplecticMatrix(1);
E3 := DiagonalJoin([ E1, E1, E1 ]);
T1 := Transpose(T);
E := Transpose(T1)*E3*T1;

E0, T2 := FrobeniusFormAlternating(ChangeRing(p*E, Integers()));
BT := T1*Transpose(T2);

Q := P*ChangeRing(BT, BaseRing(P));
assert IsBigPeriodMatrix(Q);
return Q;

end function;


intrinsic AllGeometric2GluingsCC(X1::Crv, X2::Crv, F::Fld) -> .
{Returns all geometric gluings whose invariants are defined over F.}
/* TODO: In the hyperelliptic case other methods are available. */

P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2);
P := DiagonalJoin(P1, P2);

/* First find invariants */
Vs := AllVs2For12();
invss := [ ];
for i in [1..#Vs] do
    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup number:", i;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor12(P, Vs[i]);
    tau := SmallPeriodMatrix(Q);

    invs, _, test := AlgebraizedInvariants(tau, F : Base := true);
    if test then
        vprint Gluing : "";
        if #invs eq 9 then
            vprint Gluing : "Shioda invariants found:";
        else
            vprint Gluing : "Dixmier--Ohno invariants found:";
        end if;
        vprint Gluing : invs;
        Append(~invss, invs);
    end if;
end for;
invss := [ invs : invs in Set(invss) ];

/* Then find curves */
Ys := [* *];
for invs in invss do
    if #invs eq 9 then
        Y := HyperellipticCurveFromShiodaInvariants(invs);
        //Y := ReducedMinimalWeierstrassModel(HyperellipticCurveFromShiodaInvariants(invs));
    else
        f, aut := TernaryQuarticFromDixmierOhnoInvariants(invs);
        if #aut eq 0 then
            f := MinimizeC2Quartic(f);
        end if;
        Y := PlaneCurve(f);
    end if;
    Append(~Ys, Y);
end for;
return Ys;

end intrinsic;


intrinsic SomeGeometricGluingCC(X1::Crv, X2::Crv, F::Fld, p::RngIntElt : Base := true) -> .
{Keeps trying to find a single geometric gluing whose invariants are defined over F. For now p is prime.}

/* TODO: For now we impose the following */
assert Base;
assert IsPrime(p);
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2);
P := DiagonalJoin(P1, P2);

while true do
    V := GenerateVFor12(p);

    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor12(P, V);
    tau := SmallPeriodMatrix(Q);

    invs, _, test := AlgebraizedInvariants(tau, F : Base := true);
    if test then
        vprint Gluing : "";
        if #invs eq 9 then
            vprint Gluing : "Shioda invariants found:";
        else
            vprint Gluing : "Dixmier--Ohno invariants found:";
        end if;
        vprint Gluing : invs;

        if #invs eq 9 then
            Y := HyperellipticCurveFromShiodaInvariants(invs);
            //Y := ReducedMinimalWeierstrassModel(HyperellipticCurveFromShiodaInvariants(invs));
        else
            f, aut := TernaryQuarticFromDixmierOhnoInvariants(invs);
            if #aut eq 0 then
                f := MinimizeC2Quartic(f);
            end if;
            Y := PlaneCurve(f);
        end if;
        return Y;

    end if;
end while;

end intrinsic;


intrinsic SomeGeometricGluingCC(X1::Crv, X2::Crv, X3::Crv, F::Fld, p::RngIntElt : Base := true) -> .
{Keeps trying to find a single geometric gluing whose invariants are defined over F. For now p is prime.}

/* TODO: For now we impose the following */
assert Base;
assert IsPrime(p);
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2); P3 := PeriodMatrix(X3);
P := DiagonalJoin([ P1, P2, P3 ]);

while true do
    V := GenerateVFor111(p);

    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor111(P, V);
    tau := SmallPeriodMatrix(Q);

    invs, _, test := AlgebraizedInvariants(tau, F : Base := true);
    if test then
        vprint Gluing : "";
        if #invs eq 9 then
            vprint Gluing : "Shioda invariants found:";
        else
            vprint Gluing : "Dixmier--Ohno invariants found:";
        end if;
        vprint Gluing : invs;

        if #invs eq 9 then
            Y := HyperellipticCurveFromShiodaInvariants(invs);
            //Y := ReducedMinimalWeierstrassModel(HyperellipticCurveFromShiodaInvariants(invs));
        else
            f, aut := TernaryQuarticFromDixmierOhnoInvariants(invs);
            if #aut eq 0 then
                f := MinimizeC2Quartic(f);
            end if;
            Y := PlaneCurve(f);
        end if;
        return Y;

    end if;
end while;

end intrinsic;



intrinsic AllArithmetic2GluingsCC(X1::Crv, X2::Crv, F::Fld : Base := true) -> .
{Returns all gluings over the base field.}

/* TODO: For now we impose the following */
assert Base;
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2);
P := DiagonalJoin(P1, P2);

Vs := GaloisStableSubgroups(X1, X2);
Ys := [* *];
for V in Vs do
    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor12(P, V);
    //Y, hKL, test := ReconstructCurveGeometric(SmallPeriodMatrix(Q), F : Base := Base);
    Y, hKL, test := ReconstructCurve(Q, F : Base := Base);
    print Y;
    Append(~Ys, Y);
end for;
return Ys, Vs;

end intrinsic;


intrinsic AllArithmetic2GluingsCC(X1::Crv, X2::Crv, X3::Crv, F::Fld : Base := true) -> .
{Returns all gluings over the base field.}

/* TODO: For now we impose the following */
assert Base;
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2); P3 := PeriodMatrix(X3);
P := DiagonalJoin(P1, P2, P3);

Vs := GaloisStableSubgroups(X1, X2, X3);
Ys := [* *];
for V in Vs do
    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor111(P, V);
    Y, hKL, test := ReconstructCurve(Q, F : Base := Base);
    Append(~Ys, Y);
end for;
return Ys, Vs;

end intrinsic;


intrinsic SomeArithmeticGluingCC(X1::Crv, X2::Crv, F::Fld, p::RngIntElt : Base := true) -> .
{Keeps trying to find a single gluing over the base field. For now p is prime.}
// TODO: There are considerable subtleties here. The group is rational iff
// there is some morphism to another variety defined over the base, and
// preserving symplectic property yields induced polarization. We consider
// PPAVs, so this makes sense. Yet what if there is rationality for another
// polarization?

// Idea for now: construct period matrix and see if that comes from a curve
// over the base.

assert Base;
assert IsPrime(p);
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2);
P := DiagonalJoin(P1, P2);

while true do
    V := GenerateVFor12(p);
    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor12(P, V);
    Y, hKL, test := ReconstructCurve(Q, F : Base := Base);
    if test then
        return Y;
    end if;
end while;

end intrinsic;


intrinsic SomeArithmeticGluingCC(X1::Crv, X2::Crv, X3::Crv, F::Fld, p::RngIntElt : Base := true) -> .
{Keeps trying to find a single gluing over the base field. For now p is prime.}

/* TODO: For now we impose the following */
assert Base;
assert IsPrime(p);
P1 := PeriodMatrix(X1); P2 := PeriodMatrix(X2); P3 := PeriodMatrix(X3);
P := DiagonalJoin(P1, P2, P3);

while true do
    V := GenerateVFor111(p);
    vprint Gluing : "";
    vprint Gluing : "-----------------------";
    vprint Gluing : "Subgroup:";
    vprint Gluing : V;
    vprint Gluing : "-----------------------";

    Q := QFromPVFor111(P, V);
    Y, hKL, test := ReconstructCurve(Q, F : Base := Base);
    if test then
        return Y;
    end if;
end while;

end intrinsic;
