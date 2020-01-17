/***
 *  Finds 2-gluings obtained by dividing out Galois-stable subgroups
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

import "formulae.m": GluingFormulaABRs, GluingFormulaAB, GluingFormulaRsSs, GluingFormulaRs, GluingFormulaSs, GluingFormula;
import "routines.m": CubicResolvent, CompatibleRootPairings, TwistMu, HasDegree2Factor, CrossRatio3;

forward ApplyFormulaABRs;
forward ApplyFormulaAB;
forward ApplyFormulaRsSs;
forward ApplyFormulaRs;
forward ApplyFormulaSs;
forward ApplyFormula;


intrinsic AllArithmetic2Gluings(X1::Crv, X2::Crv : Simplify := true) -> .
{Returns all gluings (F3, c) over the base field. These have the property that the quadratic twist by c of the Jacobian of F3 is (2,2)-isogenous to the Jacobians of the input curves.}

f1, h1 := HyperellipticPolynomials(X1);
f2, h2 := HyperellipticPolynomials(X2);
p1 := (4*f1 + h1^2)/4;
p2 := (4*f2 + h2^2)/4;

test, fabs := HasDegree2Factor(p2);
if not test then
    return [ ];
end if;

/* From now on fab is monic and frs, fss contain the relevant leading
 * coefficients */
ress := [ ];
for fab in fabs do
    frs := f1;
    fss := f2 div fab;
    if Degree(fab) eq 1 then
        if Degree(frs) eq 3 then
            ress cat:= ApplyFormulaABRs(frs, fss, fab : Simplify := Simplify);
        elif Degree(frs) eq 4 then
            ress cat:= ApplyFormulaAB(frs, fss, fab : Simplify := Simplify);
        end if;
    else
        if Degree(frs) eq 3 and Degree(fss) eq 3 then
            ress cat:= ApplyFormulaRsSs(frs, fss, fab : Simplify := Simplify);
        elif Degree(frs) eq 3 and Degree(fss) eq 4 then
            ress cat:= ApplyFormulaRs(frs, fss, fab : Simplify := Simplify);
        elif Degree(frs) eq 4 and Degree(fss) eq 3 then
            ress cat:= ApplyFormulaSs(frs, fss, fab : Simplify := Simplify);
        elif Degree(frs) eq 4 and Degree(fss) eq 4 then
            ress cat:= ApplyFormula(frs, fss, fab : Simplify := Simplify);
        end if;
    end if;
end for;
return ress;

end intrinsic;


function ApplyFormulaABRs(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

gss := CubicResolvent(fss);
pairs := CompatibleRootPairings(frs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! -Coefficient(fab, 0) ];
a1s := L ! Coefficient(fss, 3);
a3s := L ! Coefficient(fss, 1);

ress := [ ];
for pair in pairs do
    rs := pair[1];
    invss := [ a1s, a3s ] cat pair[2];
    F3, c := GluingFormulaABRs(rs, invss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;


function ApplyFormulaAB(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

grs := CubicResolvent(frs);
gss := CubicResolvent(fss);
pairs := CompatibleRootPairings(grs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! -Coefficient(fab, 0) ];
a1r := L ! Coefficient(frs, 3);
a3r := L ! Coefficient(frs, 1);
a1s := L ! Coefficient(fss, 3);
a3s := L ! Coefficient(fss, 1);

ress := [ ];
for pair in pairs do
    invrs := [ a1r, a3r ] cat pair[1];
    invss := [ a1s, a3s ] cat pair[2];
    F3, c := GluingFormulaAB(invrs, invss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;


function ApplyFormulaRsSs(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

grs := frs;
gss := fss;
pairs := CompatibleRootPairings(grs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! Coefficient(fab, 1), L ! Coefficient(fab, 0) ];

ress := [ ];
for pair in pairs do
    rs := pair[1];
    ss := pair[2];
    F3, c := GluingFormulaRsSs(rs, ss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;


function ApplyFormulaRs(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

grs := frs;
gss := CubicResolvent(fss);
pairs := CompatibleRootPairings(grs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! Coefficient(fab, 1), L ! Coefficient(fab, 0) ];
a1s := L ! Coefficient(fss, 3);
a3s := L ! Coefficient(fss, 1);

ress := [ ];
for pair in pairs do
    rs := pair[1];
    invss := [ a1s, a3s ] cat pair[2];
    F3, c := GluingFormulaRs(rs, invss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;


function ApplyFormulaSs(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

grs := CubicResolvent(frs);
gss := fss;
pairs := CompatibleRootPairings(grs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! Coefficient(fab, 1), L ! Coefficient(fab, 0) ];
a1r := L ! Coefficient(frs, 3);
a3r := L ! Coefficient(frs, 1);

ress := [ ];
for pair in pairs do
    invrs := [ a1r, a3r ] cat pair[1];
    ss := pair[2];
    F3, c := GluingFormulaSs(invrs, ss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;


function ApplyFormula(frs, fss, fab : Simplify := true)

K := BaseRing(Parent(fab));
S<x,y,z> := PolynomialRing(K, 3);

crs := LeadingCoefficient(frs);
css := LeadingCoefficient(fss);
cab := LeadingCoefficient(fab);
frs /:= crs;
fss /:= css;
la := crs/css^2;
mu := crs/css;
assert cab eq 1;

grs := CubicResolvent(frs);
gss := CubicResolvent(fss);
pairs := CompatibleRootPairings(grs, gss);
if #pairs eq 0 then
    return [ ];
end if;

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];

L := Parent(pairs[1][1][1]);
ab :=  [ L ! Coefficient(fab, 1), L ! Coefficient(fab, 0) ];
a1r := L ! Coefficient(frs, 3);
a3r := L ! Coefficient(frs, 1);
a1s := L ! Coefficient(fss, 3);
a3s := L ! Coefficient(fss, 1);

ress := [ ];
for pair in pairs do
    invrs := [ a1r, a3r ] cat pair[1];
    invss := [ a1s, a3s ] cat pair[2];
    F3, c := GluingFormula(invrs, invss, ab);
    F3 := S ! F3; c := K ! c;

    /* Twist to correct for leading coefficients */
    F3 := S ! TwistMu(F3, mu);
    c *:= la;
    F3 *:= css^2;
    c *:= css^4;

    if Simplify then
        if Type(K) eq FldFin then
            nu := MonomialCoefficient(F3, x^4);
            F3 /:= nu;
            c /:= nu^2;
        elif Type(K) eq FldRat then
            nuden := LCM([ Integers() ! Denominator(d) : d in Coefficients(F3) ]);
            nunum := GCD([ Integers() ! Numerator(d) : d in Coefficients(F3) ]);
            nu := nunum/nuden;
            F3 /:= nu;
            c /:= nu^2;
        end if;
    end if;
    Append(~ress, [* F3, c *]);
end for;
return ress;

end function;
