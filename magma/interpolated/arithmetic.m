/***
 *  Finds 2-gluings obtained by dividing out Galois-stable subgroups
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

import "formulae.m": GluingFormulaABRs, GluingFormulaAB, GluingFormulaRsSs, GluingFormulaRs, GluingFormulaSs, GluingFormula;
import "routines.m": CubicResolvent, CompatibleRootPairings, TwistMu, HasDegree2Factor, CrossRatio3;
import "check.m": CheckG1, CheckG2;

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

test, pabs := HasDegree2Factor(p2);
if not test then
    return [ ];
end if;

/* From now on pab is monic and prs, pss contain the relevant leading
 * coefficients */
ress := [ ];
for pab in pabs do
    prs := p1;
    pss := p2 div pab;

    if Degree(pab) eq 1 then
        if Degree(prs) eq 3 then
            //print "ABRs";
            ress cat:= ApplyFormulaABRs(prs, pss, pab : Simplify := Simplify);
        elif Degree(prs) eq 4 then
            //print "AB";
            ress cat:= ApplyFormulaAB(prs, pss, pab : Simplify := Simplify);
        end if;
    else
        if Degree(prs) eq 3 and Degree(pss) eq 3 then
            //print "RsSs";
            ress cat:= ApplyFormulaRsSs(prs, pss, pab : Simplify := Simplify);
        elif Degree(prs) eq 3 and Degree(pss) eq 4 then
            //print "Rs";
            ress cat:= ApplyFormulaRs(prs, pss, pab : Simplify := Simplify);
        elif Degree(prs) eq 4 and Degree(pss) eq 3 then
            //print "Ss";
            ress cat:= ApplyFormulaSs(prs, pss, pab : Simplify := Simplify);
        elif Degree(prs) eq 4 and Degree(pss) eq 4 then
            ress cat:= ApplyFormula(prs, pss, pab : Simplify := Simplify);
        end if;
    end if;
end for;
return ress;

end intrinsic;


function ApplyFormulaABRs(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

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
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;


function ApplyFormulaAB(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

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
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;


function ApplyFormulaRsSs(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

L := Parent(pairs[1][1][1]);
ab :=  [ L ! Coefficient(fab, 1), L ! Coefficient(fab, 0) ];

ress := [ ];
for pair in pairs do
    rs := pair[1];
    ss := pair[2];
    F3, c := GluingFormulaRsSs(rs, ss, ab);
    F3 := S ! F3; c := K ! c;
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;


function ApplyFormulaRs(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

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
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;


function ApplyFormulaSs(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

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
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;


function ApplyFormula(frs, fss, fab : Simplify := true)

pr := frs;
ps := fab*fss;
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

/* Exclude hyperelliptic case */
pairs := [ pair : pair in pairs | CrossRatio3(pair[1]) ne CrossRatio3(pair[2]) ];
if #pairs eq 0 then
    return [ ];
end if;

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
    Z := Curve(ProjectiveSpace(S), F3);
    if IsIrreducible(F3) then if Genus(Z) ne 3 then continue; end if; end if;

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
            F3 *:= Sign(MonomialCoefficient(F3, x^4));
            c /:= nu^2;
        end if;
    end if;
    res := [* F3, c, fab, pair *];

    test1 := CheckG1(res, pr); test2 := CheckG2(res, ps);
    if test1 and test2 then
        Append(~ress, res);
    end if;
end for;
return ress;

end function;
