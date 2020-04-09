/***
 *  Check that the factors give rise to the specified curves
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

import "routines.m": CubicResolvent;

function CheckG1(res, pr)
// Checks that value returned defines correct genus-1 factor

F3, c := Explode(res);
S<x,y,z> := Parent(F3);
R<t> := Parent(pr);
//F3 := Evaluate(F3, [x,z,y]);

f400 := MonomialCoefficient(F3, x^4);
f220 := MonomialCoefficient(F3, x^2*y^2);
f211 := MonomialCoefficient(F3, x^2*y*z);
f202 := MonomialCoefficient(F3, x^2*z^2);
f040 := MonomialCoefficient(F3, y^4);
f031 := MonomialCoefficient(F3, y^3*z);
f022 := MonomialCoefficient(F3, y^2*z^2);
f013 := MonomialCoefficient(F3, y*z^3);
f004 := MonomialCoefficient(F3, z^4);

A := f400;
B := f220*t^2 + f211*t + f202;
C := f040*t^4 + f031*t^3 + f022*t^2 + f013*t + f004;

p := B^2 - 4*A*C;
p0 := pr;

j, IJ := BinaryQuarticInvariants(p);
j0, IJ0 := BinaryQuarticInvariants(p0);
I, J := Explode(IJ);
I0, J0 := Explode(IJ0);

testI := I eq 16*I0*c^2;
testJ := J eq 64*J0*c^3;
return testI and testJ;

end function;


function CheckG2(res, ps)
// Checks that value returned defines correct genus-2 factor

F3, c := Explode(res);
S<x,y,z> := Parent(F3);
F3 := Evaluate(F3, [x,z,y]);
R<t> := Parent(ps);
hSR := hom< S -> R | [0,t,1] >;

f400 := MonomialCoefficient(F3, x^4);
f220 := MonomialCoefficient(F3, x^2*y^2);
f211 := MonomialCoefficient(F3, x^2*y*z);
f202 := MonomialCoefficient(F3, x^2*z^2);
f040 := MonomialCoefficient(F3, y^4);
f031 := MonomialCoefficient(F3, y^3*z);
f022 := MonomialCoefficient(F3, y^2*z^2);
f013 := MonomialCoefficient(F3, y*z^3);
f004 := MonomialCoefficient(F3, z^4);

h2 := f220/f400;
h1 := f211/f400;
h0 := f202/f400;
k := f040/f400;
h := h2*y^2 + h1*y*z + h0*z^2;
fg := f040*t^4 + f031*t^3 + f022*t^2 + f013*t + f004;
fg /:= LeadingCoefficient(fg);

a1 := Coefficient(fg, 3);
a2 := Coefficient(fg, 2);
a3 := Coefficient(fg, 1);
a4 := Coefficient(fg, 0);

res := CubicResolvent(fg);
rts := [ tup[1] : tup in Roots(res) ];

test := false;
for b in rts do
    den := h2^2*a3^2 - 4*h2^2*a2*a4 + 4*h2^2*a4*b + 4*h2*h1*a1*a4 -
        2*h2*h1*a3*b - 2*h2*h0*a1*a3 - 4*h1^2*a4 + 4*h2*h0*a2*b + (-4*h2*h0 +
        h1^2)*b^2 + 4*h1*h0*a3 - 2*h1*h0*a1*b + h0^2*a1^2 - 4*h0^2*a2 +
        4*h0^2*b;

    num0 := -h2*k^2*a3^4 + 8*h2*k^2*a2*a3^2*a4 - 16*h2*k^2*a2^2*a4^2 -
        8*h2*k^2*a3^2*a4*b + 32*h2*k^2*a2*a4^2*b - 16*h2*k^2*a4^2*b^2 -
        2*h1*k^2*a1*a3^2*a4 + 8*h1*k^2*a1*a2*a4^2 + h1*k^2*a3^3*b -
        4*h1*k^2*a2*a3*a4*b - 8*h1*k^2*a1*a4^2*b + 4*h1*k^2*a3*a4*b^2 +
        h0*k^2*a1*a3^3 - 4*h0*k^2*a1*a2*a3*a4 + (-h2*h1^2*k + 8*h0*k^2)*a3^2*a4
        + 8*h0*k^2*a1^2*a4^2 + (4*h2*h1^2*k - 32*h0*k^2)*a2*a4^2 -
        2*h0*k^2*a2*a3^2*b + 8*h0*k^2*a2^2*a4*b - 4*h0*k^2*a1*a3*a4*b +
        (-4*h2*h1^2*k + 32*h0*k^2)*a4^2*b + 2*h0*k^2*a3^2*b^2 -
        8*h0*k^2*a2*a4*b^2 + h2*h1*h0*k*a3^3 - 4*h2*h1*h0*k*a2*a3*a4 -
        2*h1^3*k*a1*a4^2 + (4*h2*h1*h0*k + h1^3*k)*a3*a4*b - h2*h0^2*k*a2*a3^2
        + 4*h2*h0^2*k*a2^2*a4 + 3*h1^2*h0*k*a1*a3*a4 + (h2*h0^2*k -
        h1^2*h0*k)*a3^2*b + (-8*h2*h0^2*k - 2*h1^2*h0*k)*a2*a4*b + (4*h2*h0^2*k
        + 2*h1^2*h0*k)*a4*b^2 - h1*h0^2*k*a1*a3^2 - 2*h1*h0^2*k*a1*a2*a4 +
        3*h1*h0^2*k*a2*a3*b + 2*h1*h0^2*k*a1*a4*b - 3*h1*h0^2*k*a3*b^2 +
        h0^3*k*a1*a2*a3 - 2*h0^3*k*a3^2 - 2*h0^3*k*a1^2*a4 + 8*h0^3*k*a2*a4 -
        2*h0^3*k*a2^2*b + h0^3*k*a1*a3*b - 8*h0^3*k*a4*b + 2*h0^3*k*a2*b^2;
    num1 := -12*h2*k^2*a1*a3^2*a4 + 48*h2*k^2*a1*a2*a4^2 + 6*h2*k^2*a3^3*b -
        24*h2*k^2*a2*a3*a4*b - 48*h2*k^2*a1*a4^2*b + 24*h2*k^2*a3*a4*b^2 +
        4*h2^2*h1*k*a3^2*a4 - 24*h1*k^2*a1^2*a4^2 - 16*h2^2*h1*k*a2*a4^2 +
        24*h1*k^2*a1*a3*a4*b + 16*h2^2*h1*k*a4^2*b - 6*h1*k^2*a3^2*b^2 +
        (-2*h2^2*h0*k - 12*h0*k^2)*a3^3 + (8*h2^2*h0*k + 48*h0*k^2)*a2*a3*a4 +
        4*h2*h1^2*k*a1*a4^2 + 6*h0*k^2*a1*a3^2*b - 24*h0*k^2*a1*a2*a4*b +
        (-8*h2^2*h0*k - 2*h2*h1^2*k - 48*h0*k^2)*a3*a4*b + 24*h0*k^2*a1*a4*b^2
        - 4*h2*h1*h0*k*a1*a3*a4 + 8*h1^3*k*a4^2 - 2*h2*h1*h0*k*a3^2*b +
        16*h2*h1*h0*k*a2*a4*b + (-16*h2*h1*h0*k - 2*h1^3*k)*a4*b^2 +
        4*h2*h0^2*k*a1*a3^2 - 12*h2*h0^2*k*a1*a2*a4 - 12*h1^2*h0*k*a3*a4 -
        2*h2*h0^2*k*a2*a3*b + (12*h2*h0^2*k - 2*h1^2*h0*k)*a1*a4*b +
        (2*h2*h0^2*k + 4*h1^2*h0*k)*a3*b^2 + 10*h1*h0^2*k*a3^2 +
        10*h1*h0^2*k*a1^2*a4 - 16*h1*h0^2*k*a2*a4 - 8*h1*h0^2*k*a1*a3*b +
        16*h1*h0^2*k*a4*b - 2*h0^3*k*a1^2*a3 - 4*h0^3*k*a2*a3 +
        6*h0^3*k*a1*a2*b + 4*h0^3*k*a3*b - 6*h0^3*k*a1*b^2;
    num2 := 3*h2*k^2*a1*a3^3 - 12*h2*k^2*a1*a2*a3*a4 + (-4*h2^3*k +
        24*h2*k^2)*a3^2*a4 - 24*h2*k^2*a1^2*a4^2 + (16*h2^3*k -
        96*h2*k^2)*a2*a4^2 - 6*h2*k^2*a2*a3^2*b + 24*h2*k^2*a2^2*a4*b +
        36*h2*k^2*a1*a3*a4*b + (-16*h2^3*k + 96*h2*k^2)*a4^2*b -
        6*h2*k^2*a3^2*b^2 - 24*h2*k^2*a2*a4*b^2 + (-h2^2*h1*k + 6*h1*k^2)*a3^3
        + 12*h1*k^2*a1^2*a3*a4 + (4*h2^2*h1*k - 24*h1*k^2)*a2*a3*a4 +
        (8*h2^2*h1*k + 96*h1*k^2)*a1*a4^2 - 9*h1*k^2*a1*a3^2*b -
        12*h1*k^2*a1*a2*a4*b + (-8*h2^2*h1*k - 24*h1*k^2)*a3*a4*b +
        12*h1*k^2*a2*a3*b^2 - 12*h1*k^2*a1*a4*b^2 - 3*h0*k^2*a1^2*a3^2 +
        (2*h2^2*h0*k + 12*h0*k^2)*a2*a3^2 + 12*h0*k^2*a1^2*a2*a4 +
        (-8*h2^2*h0*k - 48*h0*k^2)*a2^2*a4 + (-4*h2^2*h0*k - h2*h1^2*k -
        48*h0*k^2)*a1*a3*a4 - 32*h2*h1^2*k*a4^2 + (6*h2^2*h0*k + 2*h2*h1^2*k +
        12*h0*k^2)*a3^2*b + 12*h0*k^2*a1^2*a4*b + (-8*h2^2*h0*k - 6*h2*h1^2*k +
        96*h0*k^2)*a2*a4*b - 12*h0*k^2*a1*a3*b^2 + (16*h2^2*h0*k + 14*h2*h1^2*k
        - 48*h0*k^2)*a4*b^2 - h2*h1*h0*k*a1*a3^2 + 8*h2*h1*h0*k*a1*a2*a4 +
        (32*h2*h1*h0*k - 2*h1^3*k)*a3*a4 - 2*h2*h1*h0*k*a2*a3*b +
        (-16*h2*h1*h0*k + 3*h1^3*k)*a1*a4*b + (-2*h2*h1*h0*k - h1^3*k)*a3*b^2 -
        h2*h0^2*k*a1*a2*a3 + (-18*h2*h0^2*k - 4*h1^2*h0*k)*a3^2 + (2*h2*h0^2*k
        - 9*h1^2*h0*k)*a1^2*a4 + (40*h2*h0^2*k + 28*h1^2*h0*k)*a2*a4 +
        2*h2*h0^2*k*a2^2*b + (3*h2*h0^2*k + 5*h1^2*h0*k)*a1*a3*b +
        (-40*h2*h0^2*k - 12*h1^2*h0*k)*a4*b + (-2*h2*h0^2*k -
        4*h1^2*h0*k)*a2*b^2 + 2*h1*h0^2*k*a1^2*a3 - 6*h1*h0^2*k*a2*a3 -
        24*h1*h0^2*k*a1*a4 - h1*h0^2*k*a1*a2*b + 2*h1*h0^2*k*a3*b +
        9*h1*h0^2*k*a1*b^2 - h0^3*k*a1^2*a2 + 4*h0^3*k*a2^2 + 12*h0^3*k*a1*a3 -
        3*h0^3*k*a1^2*b - 16*h0^3*k*a2*b + 12*h0^3*k*b^2;
    num3 := (2*h2^3*k - 16*h2*k^2)*a3^3 + 8*h2*k^2*a1^2*a3*a4 + (-8*h2^3*k +
        64*h2*k^2)*a2*a3*a4 + (-16*h2^3*k + 64*h2*k^2)*a1*a4^2 +
        4*h2*k^2*a1*a3^2*b - 48*h2*k^2*a1*a2*a4*b + (16*h2^3*k -
        96*h2*k^2)*a3*a4*b + 8*h2*k^2*a2*a3*b^2 + 32*h2*k^2*a1*a4*b^2 -
        8*h1*k^2*a2*a3^2 - 8*h1*k^2*a1^2*a2*a4 + 32*h1*k^2*a2^2*a4 +
        (-4*h2^2*h1*k - 48*h1*k^2)*a1*a3*a4 + (32*h2^2*h1*k - 128*h1*k^2)*a4^2
        + 8*h1*k^2*a1*a2*a3*b + (-2*h2^2*h1*k + 16*h1*k^2)*a3^2*b +
        16*h1*k^2*a1^2*a4*b + 16*h2^2*h1*k*a2*a4*b - 8*h1*k^2*a2^2*b^2 -
        4*h1*k^2*a1*a3*b^2 + (-24*h2^2*h1*k + 32*h1*k^2)*a4*b^2 + (-2*h2^2*h0*k
        + 8*h0*k^2)*a1*a3^2 - 16*h0*k^2*a1^3*a4 + (16*h2^2*h0*k +
        64*h0*k^2)*a1*a2*a4 + (-16*h2^2*h0*k + 16*h2*h1^2*k + 64*h0*k^2)*a3*a4
        + 4*h0*k^2*a1^2*a3*b + (-4*h2^2*h0*k - 48*h0*k^2)*a2*a3*b +
        (8*h2^2*h0*k - 4*h2*h1^2*k - 96*h0*k^2)*a1*a4*b + 8*h0*k^2*a1*a2*b^2 +
        (-4*h2^2*h0*k - 2*h2*h1^2*k + 32*h0*k^2)*a3*b^2 + (8*h2*h1*h0*k +
        2*h1^3*k)*a3^2 + (8*h2*h1*h0*k + 2*h1^3*k)*a1^2*a4 + (-96*h2*h1*h0*k -
        8*h1^3*k)*a2*a4 - 2*h1^3*k*a1*a3*b + 64*h2*h1*h0*k*a4*b + (8*h2*h1*h0*k
        + 2*h1^3*k)*a2*b^2 - 2*h2*h0^2*k*a1^2*a3 + 16*h2*h0^2*k*a2*a3 +
        (-16*h2*h0^2*k + 16*h1^2*h0*k)*a1*a4 - 4*h2*h0^2*k*a1*a2*b +
        (8*h2*h0^2*k - 4*h1^2*h0*k)*a3*b + (-4*h2*h0^2*k - 2*h1^2*h0*k)*a1*b^2
        - 4*h1*h0^2*k*a1*a3 + 32*h1*h0^2*k*a4 - 2*h1*h0^2*k*a1^2*b +
        16*h1*h0^2*k*a2*b - 24*h1*h0^2*k*b^2 + 2*h0^3*k*a1^3 - 8*h0^3*k*a1*a2 -
        16*h0^3*k*a3 + 16*h0^3*k*a1*b;
    num4 := -3*h2*k^2*a1^2*a3^2 + (-h2^3*k + 12*h2*k^2)*a2*a3^2 +
        12*h2*k^2*a1^2*a2*a4 + (4*h2^3*k - 48*h2*k^2)*a2^2*a4 + (12*h2^3*k -
        48*h2*k^2)*a1*a3*a4 + (-3*h2^3*k + 12*h2*k^2)*a3^2*b +
        12*h2*k^2*a1^2*a4*b + (-16*h2^3*k + 96*h2*k^2)*a2*a4*b -
        12*h2*k^2*a1*a3*b^2 + (12*h2^3*k - 48*h2*k^2)*a4*b^2 + (2*h2^2*h1*k +
        12*h1*k^2)*a1*a3^2 + 6*h1*k^2*a1^3*a4 + (-6*h2^2*h1*k -
        24*h1*k^2)*a1*a2*a4 + (-24*h2^2*h1*k + 96*h1*k^2)*a3*a4 -
        9*h1*k^2*a1^2*a3*b + (-h2^2*h1*k - 12*h1*k^2)*a2*a3*b + (2*h2^2*h1*k -
        24*h1*k^2)*a1*a4*b + 12*h1*k^2*a1*a2*b^2 + (9*h2^2*h1*k -
        12*h1*k^2)*a3*b^2 + 3*h0*k^2*a1^3*a3 + (-h2^2*h0*k -
        12*h0*k^2)*a1*a2*a3 + (2*h2^2*h0*k - 9*h2*h1^2*k - 24*h0*k^2)*a3^2 +
        (-18*h2^2*h0*k - 4*h2*h1^2*k + 24*h0*k^2)*a1^2*a4 + (40*h2^2*h0*k +
        28*h2*h1^2*k - 96*h0*k^2)*a2*a4 - 6*h0*k^2*a1^2*a2*b + (2*h2^2*h0*k +
        24*h0*k^2)*a2^2*b + (3*h2^2*h0*k + 5*h2*h1^2*k + 36*h0*k^2)*a1*a3*b +
        (-40*h2^2*h0*k - 12*h2*h1^2*k + 96*h0*k^2)*a4*b - 6*h0*k^2*a1^2*b^2 +
        (-2*h2^2*h0*k - 4*h2*h1^2*k - 24*h0*k^2)*a2*b^2 - h2*h1*h0*k*a1^2*a3 +
        8*h2*h1*h0*k*a2*a3 + (32*h2*h1*h0*k - 2*h1^3*k)*a1*a4 -
        2*h2*h1*h0*k*a1*a2*b + (-16*h2*h1*h0*k + 3*h1^3*k)*a3*b +
        (-2*h2*h1*h0*k - h1^3*k)*a1*b^2 + 2*h2*h0^2*k*a1^2*a2 -
        8*h2*h0^2*k*a2^2 + (-4*h2*h0^2*k - h1^2*h0*k)*a1*a3 - 32*h1^2*h0*k*a4 +
        (6*h2*h0^2*k + 2*h1^2*h0*k)*a1^2*b + (-8*h2*h0^2*k - 6*h1^2*h0*k)*a2*b
        + (16*h2*h0^2*k + 14*h1^2*h0*k)*b^2 - h1*h0^2*k*a1^3 +
        4*h1*h0^2*k*a1*a2 + 8*h1*h0^2*k*a3 - 8*h1*h0^2*k*a1*b - 4*h0^3*k*a1^2 +
        16*h0^3*k*a2 - 16*h0^3*k*b;
    num5 := -2*h2^3*k*a1*a3^2 - 12*h2*k^2*a1^3*a4 + (-4*h2^3*k +
        48*h2*k^2)*a1*a2*a4 + 6*h2*k^2*a1^2*a3*b + (6*h2^3*k -
        24*h2*k^2)*a2*a3*b + (4*h2^3*k - 48*h2*k^2)*a1*a4*b + (-6*h2^3*k +
        24*h2*k^2)*a3*b^2 + (10*h2^2*h1*k - 24*h1*k^2)*a3^2 +
        10*h2^2*h1*k*a1^2*a4 - 16*h2^2*h1*k*a2*a4 + (-8*h2^2*h1*k +
        24*h1*k^2)*a1*a3*b + 16*h2^2*h1*k*a4*b - 6*h1*k^2*a1^2*b^2 +
        (4*h2^2*h0*k - 12*h0*k^2)*a1^2*a3 + (-12*h2^2*h0*k + 48*h0*k^2)*a2*a3 -
        12*h2*h1^2*k*a1*a4 + 6*h0*k^2*a1^3*b + (-2*h2^2*h0*k -
        24*h0*k^2)*a1*a2*b + (12*h2^2*h0*k - 2*h2*h1^2*k - 48*h0*k^2)*a3*b +
        (2*h2^2*h0*k + 4*h2*h1^2*k + 24*h0*k^2)*a1*b^2 - 4*h2*h1*h0*k*a1*a3 +
        8*h1^3*k*a4 - 2*h2*h1*h0*k*a1^2*b + 16*h2*h1*h0*k*a2*b +
        (-16*h2*h1*h0*k - 2*h1^3*k)*b^2 - 2*h2*h0^2*k*a1^3 + 8*h2*h0^2*k*a1*a2
        + 4*h1^2*h0*k*a3 + (-8*h2*h0^2*k - 2*h1^2*h0*k)*a1*b + 4*h1*h0^2*k*a1^2
        - 16*h1*h0^2*k*a2 + 16*h1*h0^2*k*b;
    num6 := h2*k^2*a1^3*a3 + (h2^3*k - 4*h2*k^2)*a1*a2*a3 + (-2*h2^3*k +
        8*h2*k^2)*a3^2 + (-2*h2^3*k + 8*h2*k^2)*a1^2*a4 + (8*h2^3*k -
        32*h2*k^2)*a2*a4 - 2*h2*k^2*a1^2*a2*b + (-2*h2^3*k + 8*h2*k^2)*a2^2*b +
        (h2^3*k - 4*h2*k^2)*a1*a3*b + (-8*h2^3*k + 32*h2*k^2)*a4*b +
        2*h2*k^2*a1^2*b^2 + (2*h2^3*k - 8*h2*k^2)*a2*b^2 + (-h2^2*h1*k -
        2*h1*k^2)*a1^2*a3 + (-2*h2^2*h1*k + 8*h1*k^2)*a2*a3 + h1*k^2*a1^3*b +
        (3*h2^2*h1*k - 4*h1*k^2)*a1*a2*b + (2*h2^2*h1*k - 8*h1*k^2)*a3*b +
        (-3*h2^2*h1*k + 4*h1*k^2)*a1*b^2 - h0*k^2*a1^4 + (-h2^2*h0*k +
        8*h0*k^2)*a1^2*a2 + (4*h2^2*h0*k - 16*h0*k^2)*a2^2 + 3*h2*h1^2*k*a1*a3
        + (h2^2*h0*k - h2*h1^2*k - 8*h0*k^2)*a1^2*b + (-8*h2^2*h0*k -
        2*h2*h1^2*k + 32*h0*k^2)*a2*b + (4*h2^2*h0*k + 2*h2*h1^2*k -
        16*h0*k^2)*b^2 + h2*h1*h0*k*a1^3 - 4*h2*h1*h0*k*a1*a2 - 2*h1^3*k*a3 +
        (4*h2*h1*h0*k + h1^3*k)*a1*b - h1^2*h0*k*a1^2 + 4*h1^2*h0*k*a2 -
        4*h1^2*h0*k*b;

    p1 := (num6*t^6 + num5*t^5 + num4*t^4 + num3*t^3 + num2*t^2 + num1*t + num0)/den;
    p1 := R ! (t^6*Evaluate(p1, -1/t));
    //print (p1*f400^2)/ (4*c*ps);
    test or:= (p1*f400^2 eq 4*c*ps);
end for;

return test;

end function;
