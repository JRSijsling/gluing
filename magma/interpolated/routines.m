/***
 *  Some useful routines
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

function CubicResolvent(f4)
// Roots are permutations of r1 r2 + r3 r4

assert IsMonic(f4);
R := Parent(f4);

a1 := Coefficient(f4, 3);
a2 := Coefficient(f4, 2);
a3 := Coefficient(f4, 1);
a4 := Coefficient(f4, 0);

b1 := -a2;
b2 := a1*a3 - 4*a4;
b3 := 4*a4*a2 - a3^2 - a4*a1^2;
g3 := R ! [ b3, b2, b1, 1 ];
return g3;

end function;


function SplittingFieldWithAutomorphisms(f)
// Input: Number field or finite field
// Returns splitting field and generators of the relative Galois group

K := BaseRing(f);
if Type(K) eq FldFin then
    q := #K;
    n := Max([ Degree(tup[1]) : tup in Factorization(f) ]);
    L := ext< K | n >;
    Frob := function(alpha) return Frobenius(alpha, K); end function;
    return L, [ Frob ];
end if;
assert Type(K) eq FldRat or Type(K) eq FldNum;

L := SplittingField(f); fac := 1;
g := MinimalPolynomial(L.1);
coeffs := Coefficients(g);
coeffs := coeffs[1..(#coeffs - 1)];
coeffs := Reverse(coeffs);
dens := [ Denominator(c) : c in coeffs ];
ps := [ p : p in Set(&cat[ PrimeDivisors(den) : den in dens ]) ];
for p in ps do
    e := Max([ Ceiling(Valuation(dens[i], p) / i) : i in [1..#coeffs] ]);
    fac *:= p^e;
end for;
R := Parent(g);
g := Evaluate(g, R.1/fac);
g /:= LeadingCoefficient(g);
L := NumberField(g);
Gp, Ga, Gphi := AutomorphismGroup(L, K);
return L, [ Gphi(gen) : gen in Generators(Gp) ];

end function;


function AreCompatibleRoots(rts1, rts2, gens);
// Tests if Galois action on sets of roots is identical
// Very naive, and G-sets should be used instead

for gen in gens do
    for i in [1..#rts1] do
        rt1new := gen(rts1[i]);
        rt2new := gen(rts2[i]);
        j1 := [ j : j in [1..#rts1] | rts1[j] eq rt1new ][1];
        j2 := [ j : j in [1..#rts2] | rts2[j] eq rt2new ][1];
        if not j1 eq j2 then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function CompatibleRootPairings(f1, f2)
// Returned in splitting field of f1

L1, gens := SplittingFieldWithAutomorphisms(f1);
rts1 := [ tup[1] : tup in Roots(f1, L1) ];
rts2 := [ tup[1] : tup in Roots(f2, L1) ];
if #rts2 ne #rts1 then
    return [ ];
end if;
rts2s := [ [ rts2[Eltseq(g)[i]] : i in [1..#rts1] ] : g in Sym(#rts1) ];
rts2s := [ rts2 : rts2 in rts2s | AreCompatibleRoots(rts1, rts2, gens) ];
pairs := [ [ rts1, rts2 ] : rts2 in rts2s ];
return pairs;

end function;


function TwistMu(F, mu)

S<x,y,z> := Parent(F);
F400 := MonomialCoefficient(F, x^4);
F220 := MonomialCoefficient(F, x^2*y^2);
F211 := MonomialCoefficient(F, x^2*y*z);
F202 := MonomialCoefficient(F, x^2*z^2);
F040 := MonomialCoefficient(F, y^4);
F031 := MonomialCoefficient(F, y^3*z);
F022 := MonomialCoefficient(F, y^2*z^2);
F013 := MonomialCoefficient(F, y*z^3);
F004 := MonomialCoefficient(F, z^4);
Fmu := mu^2*F400*x^4 + mu*(F220*y^2 + F211*y*z + F202*z^2)*x^2 + F040*y^4 +
    F031*y^3*z + F022*y^2*z^2 + F013*y*z^3 + F004*z^4;
return Fmu;

end function;


function HasDegree2Factor(p2)

test := false; deg2facs := [ ];
facs := [ tup[1] : tup in Factorization(p2) ];
facs1 := [ fac : fac in facs | Degree(fac) eq 1 ];
facs2 := [ fac : fac in facs | Degree(fac) eq 2 ];

if Degree(p2) eq 5 then
    /* Single degree-1 factor */
    for fac in facs1 do
        test := true;
        Append(~deg2facs, fac);
    end for;

    /* Single degree-2 factor */
    for fac in facs2 do
        test := true;
        Append(~deg2facs, fac);
    end for;

    /* Two degree-1 factors */
    CP := CartesianPower(facs1, 2);
    facs12 := [ fac : fac in Set([ tup[1]*tup[2] : tup in CP | tup[1] ne tup[2] ]) ];
    for fac in facs12 do
        test := true;
        Append(~deg2facs, fac);
    end for;
    return test, deg2facs;
end if;
/* Now in degree 6 case */

/* Single degree-2 factor */
for fac in facs2 do
    test := true;
    Append(~deg2facs, fac);
end for;

/* Two degree-1 factors */
CP := CartesianPower(facs1, 2);
facs12 := [ fac : fac in Set([ tup[1]*tup[2] : tup in CP | tup[1] ne tup[2] ]) ];
for fac in facs12 do
    test := true;
    Append(~deg2facs, fac);
end for;
return test, deg2facs;

end function;


function CrossRatio3(rts);

return (rts[3] - rts[1])/(rts[2] - rts[1]);

end function;
