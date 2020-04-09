/***
 *  Interpolated formulae
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

function GluingFormulaABRs(rs, invss, ab);

assert #rs eq 3;
assert #invss eq 5;
assert #ab eq 1;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

r2, r3, r4 := Explode(rs);
a1s, a3s, b1s, b2s, b3s := Explode(invss);
a := Explode(ab);

F3 := ((r2^2*r3 - r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b1s^2*b2s + (-r2^2*r3
    + r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b1s*b2s^2 + (-r2^2*r3 +
    r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b1s^2*b3s + (r2^2*r3 -
    r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b2s^2*b3s + (r2^2*r3 -
    r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b1s*b3s^2 + (-r2^2*r3 +
    r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b2s*b3s^2)*x^4 +
((-1/2*r3^2 + r3*r4 - 1/2*r4^2)*a1s^2*a3s*b1s^2 + (r2*r3 - r2*r4 - r3*r4 +
    r4^2)*a1s^2*a3s*b1s*b2s + (-r2*r3 + r2*r4 + r3^2 - r3*r4)*a3s*b1s^2*b2s +
    (1/2*r3^2 - r3*r4 + 1/2*r4^2)*a1s*b1s^3*b2s + (-1/2*r2^2 + r2*r4 -
    1/2*r4^2)*a1s^2*a3s*b2s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a3s*b1s*b2s^2 +
    (-r2*r3 + r2*r4 + r3*r4 - r4^2)*a1s*b1s^2*b2s^2 + (1/2*r2^2 - r2*r4 +
    1/2*r4^2)*a1s*b1s*b2s^3 + (-r2*r3 + r2*r4 + r3^2 - r3*r4)*a1s^2*a3s*b1s*b3s +
    (r2*r3 - r2*r4 - r3*r4 + r4^2)*a3s*b1s^2*b3s + (1/2*r3^2 - r3*r4 +
    1/2*r4^2)*a1s*b1s^3*b3s + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a1s^2*a3s*b2s*b3s +
    (-2*r2^2 + 2*r2*r3 + 2*r2*r4 - 2*r3^2 + 2*r3*r4 - 2*r4^2)*a3s*b1s*b2s*b3s +
    (-1/2*r3^2 + r3*r4 - 1/2*r4^2)*a1s*b1s^2*b2s*b3s + (r2*r3 - r2*r4 - r3*r4 +
    r4^2)*a3s*b2s^2*b3s + (-1/2*r2^2 + r2*r4 - 1/2*r4^2)*a1s*b1s*b2s^2*b3s +
    (1/2*r2^2 - r2*r4 + 1/2*r4^2)*a1s*b2s^3*b3s + (-1/2*r2^2 + r2*r3 -
    1/2*r3^2)*a1s^2*a3s*b3s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a3s*b1s*b3s^2 +
    (r2*r3 - r2*r4 - r3^2 + r3*r4)*a1s*b1s^2*b3s^2 + (-r2*r3 + r2*r4 + r3^2 -
    r3*r4)*a3s*b2s*b3s^2 + (-1/2*r2^2 + r2*r3 - 1/2*r3^2)*a1s*b1s*b2s*b3s^2 +
    (-r2^2 + r2*r3 + r2*r4 - r3*r4)*a1s*b2s^2*b3s^2 + (1/2*r2^2 - r2*r3 +
    1/2*r3^2)*a1s*b1s*b3s^3 + (1/2*r2^2 - r2*r3 + 1/2*r3^2)*a1s*b2s*b3s^3 +
    (-a*r3^2 + 2*a*r3*r4 - a*r4^2)*a1s*a3s*b1s^2 + (2*a*r2*r3 - 2*a*r2*r4 -
    2*a*r3*r4 + 2*a*r4^2)*a1s*a3s*b1s*b2s + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4)*b1s^3*b2s + (-a*r2^2 + 2*a*r2*r4 - a*r4^2)*a1s*a3s*b2s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*b1s*b2s^3 + (-2*a*r2*r3 +
    2*a*r2*r4 + 2*a*r3^2 - 2*a*r3*r4)*a1s*a3s*b1s*b3s + (2*a*r2*r3 - 2*a*r2*r4 -
    2*a*r3*r4 + 2*a*r4^2)*b1s^3*b3s + (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 +
    2*a*r3*r4)*a1s*a3s*b2s*b3s + (-2*a*r3^2 + 4*a*r3*r4 - 2*a*r4^2)*b1s^2*b2s*b3s
    + (-2*a*r2^2 + 4*a*r2*r4 - 2*a*r4^2)*b1s*b2s^2*b3s + (2*a*r2*r3 - 2*a*r2*r4 -
    2*a*r3*r4 + 2*a*r4^2)*b2s^3*b3s + (-a*r2^2 + 2*a*r2*r3 - a*r3^2)*a1s*a3s*b3s^2
    + (-2*a*r2^2 + 4*a*r2*r3 - 2*a*r3^2)*b1s*b2s*b3s^2 + (2*a*r2^2 - 2*a*r2*r3 -
    2*a*r2*r4 + 2*a*r3*r4)*b1s*b3s^3 + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4)*b2s*b3s^3)*x^2*y^2 +
((-2*r3^2 + 4*r3*r4 - 2*r4^2)*a1s*a3s*b1s^2 + (4*r2*r3 - 4*r2*r4 - 4*r3*r4 +
    4*r4^2)*a1s*a3s*b1s*b2s + (2*r3^2 - 4*r3*r4 + 2*r4^2)*b1s^3*b2s + (-2*r2^2 +
    4*r2*r4 - 2*r4^2)*a1s*a3s*b2s^2 + (2*r2^2 - 8*r2*r3 + 4*r2*r4 + 2*r3^2 +
    4*r3*r4 - 4*r4^2)*b1s^2*b2s^2 + (2*r2^2 - 4*r2*r4 + 2*r4^2)*b1s*b2s^3 +
    (-4*r2*r3 + 4*r2*r4 + 4*r3^2 - 4*r3*r4)*a1s*a3s*b1s*b3s + (2*r3^2 - 4*r3*r4 +
    2*r4^2)*b1s^3*b3s + (4*r2^2 - 4*r2*r3 - 4*r2*r4 + 4*r3*r4)*a1s*a3s*b2s*b3s +
    (-4*r2^2 + 4*r2*r3 + 4*r2*r4 - 2*r3^2 - 2*r4^2)*b1s^2*b2s*b3s + (-2*r2^2 +
    4*r2*r3 - 4*r3^2 + 4*r3*r4 - 2*r4^2)*b1s*b2s^2*b3s + (2*r2^2 - 4*r2*r4 +
    2*r4^2)*b2s^3*b3s + (-2*r2^2 + 4*r2*r3 - 2*r3^2)*a1s*a3s*b3s^2 + (2*r2^2 +
    4*r2*r3 - 8*r2*r4 - 4*r3^2 + 4*r3*r4 + 2*r4^2)*b1s^2*b3s^2 + (-2*r2^2 +
    4*r2*r4 - 2*r3^2 + 4*r3*r4 - 4*r4^2)*b1s*b2s*b3s^2 + (-4*r2^2 + 4*r2*r3 +
    4*r2*r4 + 2*r3^2 - 8*r3*r4 + 2*r4^2)*b2s^2*b3s^2 + (2*r2^2 - 4*r2*r3 +
    2*r3^2)*b1s*b3s^3 + (2*r2^2 - 4*r2*r3 + 2*r3^2)*b2s*b3s^3 + (-4*a*r3^2 +
    8*a*r3*r4 - 4*a*r4^2)*a3s*b1s^2 + (8*a*r2*r3 - 8*a*r2*r4 - 8*a*r3*r4 +
    8*a*r4^2)*a3s*b1s*b2s + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4)*a1s*b1s^2*b2s + (-4*a*r2^2 + 8*a*r2*r4 - 4*a*r4^2)*a3s*b2s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*a1s*b1s*b2s^2 + (-8*a*r2*r3 +
    8*a*r2*r4 + 8*a*r3^2 - 8*a*r3*r4)*a3s*b1s*b3s + (2*a*r2*r3 - 2*a*r2*r4 -
    2*a*r3*r4 + 2*a*r4^2)*a1s*b1s^2*b3s + (8*a*r2^2 - 8*a*r2*r3 - 8*a*r2*r4 +
    8*a*r3*r4)*a3s*b2s*b3s + (-4*a*r2^2 + 4*a*r2*r3 + 4*a*r2*r4 - 4*a*r3^2 +
    4*a*r3*r4 - 4*a*r4^2)*a1s*b1s*b2s*b3s + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3*r4 +
    2*a*r4^2)*a1s*b2s^2*b3s + (-4*a*r2^2 + 8*a*r2*r3 - 4*a*r3^2)*a3s*b3s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*a1s*b1s*b3s^2 + (-2*a*r2*r3 +
    2*a*r2*r4 + 2*a*r3^2 - 2*a*r3*r4)*a1s*b2s*b3s^2)*x^2*y*z +
((-2*r3^2 + 4*r3*r4 - 2*r4^2)*a3s*b1s^2 + (4*r2*r3 - 4*r2*r4 - 4*r3*r4 +
    4*r4^2)*a3s*b1s*b2s + (-r2*r3 + r2*r4 + r3^2 - r3*r4)*a1s*b1s^2*b2s + (-2*r2^2
    + 4*r2*r4 - 2*r4^2)*a3s*b2s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a1s*b1s*b2s^2 +
    (-4*r2*r3 + 4*r2*r4 + 4*r3^2 - 4*r3*r4)*a3s*b1s*b3s + (r2*r3 - r2*r4 - r3*r4 +
    r4^2)*a1s*b1s^2*b3s + (4*r2^2 - 4*r2*r3 - 4*r2*r4 + 4*r3*r4)*a3s*b2s*b3s +
    (-2*r2^2 + 2*r2*r3 + 2*r2*r4 - 2*r3^2 + 2*r3*r4 - 2*r4^2)*a1s*b1s*b2s*b3s +
    (r2*r3 - r2*r4 - r3*r4 + r4^2)*a1s*b2s^2*b3s + (-2*r2^2 + 4*r2*r3 -
    2*r3^2)*a3s*b3s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a1s*b1s*b3s^2 + (-r2*r3 +
    r2*r4 + r3^2 - r3*r4)*a1s*b2s*b3s^2 + (a*r3^2 - 2*a*r3*r4 +
    a*r4^2)*a1s^2*b1s^2 + (-4*a*r3^2 + 8*a*r3*r4 - 4*a*r4^2)*b1s^3 + (-2*a*r2*r3 +
    2*a*r2*r4 + 2*a*r3*r4 - 2*a*r4^2)*a1s^2*b1s*b2s + (4*a*r2*r3 - 4*a*r2*r4 -
    4*a*r3*r4 + 4*a*r4^2)*b1s^2*b2s + (a*r2^2 - 2*a*r2*r4 + a*r4^2)*a1s^2*b2s^2 +
    (4*a*r2*r3 - 4*a*r2*r4 - 4*a*r3*r4 + 4*a*r4^2)*b1s*b2s^2 + (-4*a*r2^2 +
    8*a*r2*r4 - 4*a*r4^2)*b2s^3 + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3^2 +
    2*a*r3*r4)*a1s^2*b1s*b3s + (-4*a*r2*r3 + 4*a*r2*r4 + 4*a*r3^2 -
    4*a*r3*r4)*b1s^2*b3s + (-2*a*r2^2 + 2*a*r2*r3 + 2*a*r2*r4 -
    2*a*r3*r4)*a1s^2*b2s*b3s + (4*a*r2^2 - 4*a*r2*r3 - 4*a*r2*r4 +
    4*a*r3*r4)*b2s^2*b3s + (a*r2^2 - 2*a*r2*r3 + a*r3^2)*a1s^2*b3s^2 + (-4*a*r2*r3
    + 4*a*r2*r4 + 4*a*r3^2 - 4*a*r3*r4)*b1s*b3s^2 + (4*a*r2^2 - 4*a*r2*r3 -
    4*a*r2*r4 + 4*a*r3*r4)*b2s*b3s^2 + (-4*a*r2^2 + 8*a*r2*r3 - 4*a*r3^2)*b3s^3)*x^2*z^2 +
((1/4*r3 - 1/4*r4)*a1s*a3s*b1s^3*b2s + (-1/4*r2 - 1/4*r3 +
    1/2*r4)*a1s*a3s*b1s^2*b2s^2 + (-1/4*r3 + 1/4*r4)*b1s^4*b2s^2 + (1/4*r2 -
    1/4*r4)*a1s*a3s*b1s*b2s^3 + (1/4*r2 + 1/4*r3 - 1/2*r4)*b1s^3*b2s^3 + (-1/4*r2
    + 1/4*r4)*b1s^2*b2s^4 + (-1/4*r3 + 1/4*r4)*a1s*a3s*b1s^3*b3s + (1/2*r2 -
    1/4*r3 - 1/4*r4)*a1s*a3s*b1s^2*b2s*b3s + (-1/4*r2 + 1/2*r3 -
    1/4*r4)*a1s*a3s*b1s*b2s^2*b3s + (-1/4*r2 + 1/4*r3)*b1s^3*b2s^2*b3s + (-1/4*r2
    + 1/4*r4)*a1s*a3s*b2s^3*b3s + (1/4*r2 - 1/4*r3)*b1s^2*b2s^3*b3s + (-1/4*r2 +
    1/2*r3 - 1/4*r4)*a1s*a3s*b1s^2*b3s^2 + (1/4*r3 - 1/4*r4)*b1s^4*b3s^2 +
    (-1/4*r2 - 1/4*r3 + 1/2*r4)*a1s*a3s*b1s*b2s*b3s^2 + (-1/4*r2 +
    1/4*r4)*b1s^3*b2s*b3s^2 + (1/2*r2 - 1/4*r3 - 1/4*r4)*a1s*a3s*b2s^2*b3s^2 +
    (-1/4*r3 + 1/4*r4)*b1s*b2s^3*b3s^2 + (1/4*r2 - 1/4*r4)*b2s^4*b3s^2 + (1/4*r2 -
    1/4*r3)*a1s*a3s*b1s*b3s^3 + (1/4*r2 - 1/2*r3 + 1/4*r4)*b1s^3*b3s^3 + (-1/4*r2
    + 1/4*r3)*a1s*a3s*b2s*b3s^3 + (1/4*r2 - 1/4*r4)*b1s^2*b2s*b3s^3 + (1/4*r3 -
    1/4*r4)*b1s*b2s^2*b3s^3 + (-1/2*r2 + 1/4*r3 + 1/4*r4)*b2s^3*b3s^3 + (-1/4*r2 +
    1/4*r3)*b1s^2*b3s^4 + (1/4*r2 - 1/4*r3)*b2s^2*b3s^4 + (a*r3 -
    a*r4)*a3s*b1s^3*b2s + (-a*r2 - a*r3 + 2*a*r4)*a3s*b1s^2*b2s^2 + (a*r2 -
    a*r4)*a3s*b1s*b2s^3 + (-a*r3 + a*r4)*a3s*b1s^3*b3s + (2*a*r2 - a*r3 -
    a*r4)*a3s*b1s^2*b2s*b3s + (-a*r2 + 2*a*r3 - a*r4)*a3s*b1s*b2s^2*b3s + (-a*r2 +
    a*r4)*a3s*b2s^3*b3s + (-a*r2 + 2*a*r3 - a*r4)*a3s*b1s^2*b3s^2 + (-a*r2 - a*r3
    + 2*a*r4)*a3s*b1s*b2s*b3s^2 + (2*a*r2 - a*r3 - a*r4)*a3s*b2s^2*b3s^2 + (a*r2 -
    a*r3)*a3s*b1s*b3s^3 + (-a*r2 + a*r3)*a3s*b2s*b3s^3 + (a^2*r3 -
    a^2*r4)*b1s^4*b2s + (-a^2*r3 + a^2*r4)*b1s^3*b2s^2 + (-a^2*r2 +
    a^2*r4)*b1s^2*b2s^3 + (a^2*r2 - a^2*r4)*b1s*b2s^4 + (-a^2*r3 +
    a^2*r4)*b1s^4*b3s + (a^2*r2 + a^2*r3 - 2*a^2*r4)*b1s^2*b2s^2*b3s + (-a^2*r2 +
    a^2*r4)*b2s^4*b3s + (a^2*r3 - a^2*r4)*b1s^3*b3s^2 + (a^2*r2 - 2*a^2*r3 +
    a^2*r4)*b1s^2*b2s*b3s^2 + (-2*a^2*r2 + a^2*r3 + a^2*r4)*b1s*b2s^2*b3s^2 +
    (a^2*r2 - a^2*r4)*b2s^3*b3s^2 + (-a^2*r2 + a^2*r3)*b1s^2*b3s^3 + (a^2*r2 -
    a^2*r3)*b2s^2*b3s^3 + (a^2*r2 - a^2*r3)*b1s*b3s^4 + (-a^2*r2 +
    a^2*r3)*b2s*b3s^4)*y^4 +
((-2*a*r2 + 2*a*r3)*b1s^3*b2s^2 + (2*a*r2 - 2*a*r3)*b1s^2*b2s^3 + (4*a*r2 - 2*a*r3
    - 2*a*r4)*b1s^3*b2s*b3s + (-2*a*r2 - 2*a*r3 + 4*a*r4)*b1s^2*b2s^2*b3s +
    (-2*a*r2 + 4*a*r3 - 2*a*r4)*b1s*b2s^3*b3s + (-2*a*r2 + 2*a*r4)*b1s^3*b3s^2 +
    (-2*a*r2 + 4*a*r3 - 2*a*r4)*b1s^2*b2s*b3s^2 + (4*a*r2 - 2*a*r3 -
    2*a*r4)*b1s*b2s^2*b3s^2 + (-2*a*r3 + 2*a*r4)*b2s^3*b3s^2 + (2*a*r2 -
    2*a*r4)*b1s^2*b3s^3 + (-2*a*r2 - 2*a*r3 + 4*a*r4)*b1s*b2s*b3s^3 + (2*a*r3 -
    2*a*r4)*b2s^2*b3s^3 + (2*a^2*r3 - 2*a^2*r4)*a1s*b1s^3*b2s + (-2*a^2*r2 -
    2*a^2*r3 + 4*a^2*r4)*a1s*b1s^2*b2s^2 + (2*a^2*r2 - 2*a^2*r4)*a1s*b1s*b2s^3 +
    (-2*a^2*r3 + 2*a^2*r4)*a1s*b1s^3*b3s + (4*a^2*r2 - 2*a^2*r3 -
    2*a^2*r4)*a1s*b1s^2*b2s*b3s + (-2*a^2*r2 + 4*a^2*r3 -
    2*a^2*r4)*a1s*b1s*b2s^2*b3s + (-2*a^2*r2 + 2*a^2*r4)*a1s*b2s^3*b3s +
    (-2*a^2*r2 + 4*a^2*r3 - 2*a^2*r4)*a1s*b1s^2*b3s^2 + (-2*a^2*r2 - 2*a^2*r3 +
    4*a^2*r4)*a1s*b1s*b2s*b3s^2 + (4*a^2*r2 - 2*a^2*r3 - 2*a^2*r4)*a1s*b2s^2*b3s^2
    + (2*a^2*r2 - 2*a^2*r3)*a1s*b1s*b3s^3 + (-2*a^2*r2 + 2*a^2*r3)*a1s*b2s*b3s^3)*y^3*z +
((r2 - r3)*b1s^3*b2s^2 + (-r2 + r3)*b1s^2*b2s^3 + (-2*r2 + r3 + r4)*b1s^3*b2s*b3s +
    (r2 + r3 - 2*r4)*b1s^2*b2s^2*b3s + (r2 - 2*r3 + r4)*b1s*b2s^3*b3s + (r2 -
    r4)*b1s^3*b3s^2 + (r2 - 2*r3 + r4)*b1s^2*b2s*b3s^2 + (-2*r2 + r3 +
    r4)*b1s*b2s^2*b3s^2 + (r3 - r4)*b2s^3*b3s^2 + (-r2 + r4)*b1s^2*b3s^3 + (r2 +
    r3 - 2*r4)*b1s*b2s*b3s^3 + (-r3 + r4)*b2s^2*b3s^3 + (-a*r3 +
    a*r4)*a1s*b1s^3*b2s + (a*r2 + a*r3 - 2*a*r4)*a1s*b1s^2*b2s^2 + (-a*r2 +
    a*r4)*a1s*b1s*b2s^3 + (a*r3 - a*r4)*a1s*b1s^3*b3s + (-2*a*r2 + a*r3 +
    a*r4)*a1s*b1s^2*b2s*b3s + (a*r2 - 2*a*r3 + a*r4)*a1s*b1s*b2s^2*b3s + (a*r2 -
    a*r4)*a1s*b2s^3*b3s + (a*r2 - 2*a*r3 + a*r4)*a1s*b1s^2*b3s^2 + (a*r2 + a*r3 -
    2*a*r4)*a1s*b1s*b2s*b3s^2 + (-2*a*r2 + a*r3 + a*r4)*a1s*b2s^2*b3s^2 + (-a*r2 +
    a*r3)*a1s*b1s*b3s^3 + (a*r2 - a*r3)*a1s*b2s*b3s^3 + (4*a^2*r3 -
    4*a^2*r4)*b1s^3*b2s + (-4*a^2*r2 - 4*a^2*r3 + 8*a^2*r4)*b1s^2*b2s^2 +
    (4*a^2*r2 - 4*a^2*r4)*b1s*b2s^3 + (-4*a^2*r3 + 4*a^2*r4)*b1s^3*b3s + (8*a^2*r2
    - 4*a^2*r3 - 4*a^2*r4)*b1s^2*b2s*b3s + (-4*a^2*r2 + 8*a^2*r3 -
    4*a^2*r4)*b1s*b2s^2*b3s + (-4*a^2*r2 + 4*a^2*r4)*b2s^3*b3s + (-4*a^2*r2 +
    8*a^2*r3 - 4*a^2*r4)*b1s^2*b3s^2 + (-4*a^2*r2 - 4*a^2*r3 +
    8*a^2*r4)*b1s*b2s*b3s^2 + (8*a^2*r2 - 4*a^2*r3 - 4*a^2*r4)*b2s^2*b3s^2 +
    (4*a^2*r2 - 4*a^2*r3)*b1s*b3s^3 + (-4*a^2*r2 + 4*a^2*r3)*b2s*b3s^3)*y^2*z^2 +
((-4*a*r3 + 4*a*r4)*b1s^3*b2s + (4*a*r2 + 4*a*r3 - 8*a*r4)*b1s^2*b2s^2 + (-4*a*r2 +
    4*a*r4)*b1s*b2s^3 + (4*a*r3 - 4*a*r4)*b1s^3*b3s + (-8*a*r2 + 4*a*r3 +
    4*a*r4)*b1s^2*b2s*b3s + (4*a*r2 - 8*a*r3 + 4*a*r4)*b1s*b2s^2*b3s + (4*a*r2 -
    4*a*r4)*b2s^3*b3s + (4*a*r2 - 8*a*r3 + 4*a*r4)*b1s^2*b3s^2 + (4*a*r2 + 4*a*r3
    - 8*a*r4)*b1s*b2s*b3s^2 + (-8*a*r2 + 4*a*r3 + 4*a*r4)*b2s^2*b3s^2 + (-4*a*r2 +
    4*a*r3)*b1s*b3s^3 + (4*a*r2 - 4*a*r3)*b2s*b3s^3)*y*z^3 +
((r3 - r4)*b1s^3*b2s + (-r2 - r3 + 2*r4)*b1s^2*b2s^2 + (r2 - r4)*b1s*b2s^3 + (-r3 +
    r4)*b1s^3*b3s + (2*r2 - r3 - r4)*b1s^2*b2s*b3s + (-r2 + 2*r3 -
    r4)*b1s*b2s^2*b3s + (-r2 + r4)*b2s^3*b3s + (-r2 + 2*r3 - r4)*b1s^2*b3s^2 +
    (-r2 - r3 + 2*r4)*b1s*b2s*b3s^2 + (2*r2 - r3 - r4)*b2s^2*b3s^2 + (r2 -
    r3)*b1s*b3s^3 + (-r2 + r3)*b2s*b3s^3)*z^4;

discs := b1s^2*b2s - b1s*b2s^2 - b1s^2*b3s + b2s^2*b3s + b1s*b3s^2 - b2s*b3s^2;
c1 := (-r3 + r4)*b1s + (r2 - r4)*b2s + (-r2 + r3)*b3s;
c2 := (-r3^2 + 2*r3*r4 - r4^2)*a1s*a3s*b1s^2 + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 +
    2*r4^2)*a1s*a3s*b1s*b2s + (r3^2 - 2*r3*r4 + r4^2)*b1s^3*b2s + (-r2^2 + 2*r2*r4
    - r4^2)*a1s*a3s*b2s^2 + (r2^2 - 4*r2*r3 + 2*r2*r4 + r3^2 + 2*r3*r4 -
    2*r4^2)*b1s^2*b2s^2 + (r2^2 - 2*r2*r4 + r4^2)*b1s*b2s^3 + (-2*r2*r3 + 2*r2*r4
    + 2*r3^2 - 2*r3*r4)*a1s*a3s*b1s*b3s + (r3^2 - 2*r3*r4 + r4^2)*b1s^3*b3s +
    (2*r2^2 - 2*r2*r3 - 2*r2*r4 + 2*r3*r4)*a1s*a3s*b2s*b3s + (-2*r2^2 + 2*r2*r3 +
    2*r2*r4 - r3^2 - r4^2)*b1s^2*b2s*b3s + (-r2^2 + 2*r2*r3 - 2*r3^2 + 2*r3*r4 -
    r4^2)*b1s*b2s^2*b3s + (r2^2 - 2*r2*r4 + r4^2)*b2s^3*b3s + (-r2^2 + 2*r2*r3 -
    r3^2)*a1s*a3s*b3s^2 + (r2^2 + 2*r2*r3 - 4*r2*r4 - 2*r3^2 + 2*r3*r4 +
    r4^2)*b1s^2*b3s^2 + (-r2^2 + 2*r2*r4 - r3^2 + 2*r3*r4 - 2*r4^2)*b1s*b2s*b3s^2
    + (-2*r2^2 + 2*r2*r3 + 2*r2*r4 + r3^2 - 4*r3*r4 + r4^2)*b2s^2*b3s^2 + (r2^2 -
    2*r2*r3 + r3^2)*b1s*b3s^3 + (r2^2 - 2*r2*r3 + r3^2)*b2s*b3s^3 + (-4*a*r3^2 +
    8*a*r3*r4 - 4*a*r4^2)*a3s*b1s^2 + (8*a*r2*r3 - 8*a*r2*r4 - 8*a*r3*r4 +
    8*a*r4^2)*a3s*b1s*b2s + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4)*a1s*b1s^2*b2s + (-4*a*r2^2 + 8*a*r2*r4 - 4*a*r4^2)*a3s*b2s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*a1s*b1s*b2s^2 + (-8*a*r2*r3 +
    8*a*r2*r4 + 8*a*r3^2 - 8*a*r3*r4)*a3s*b1s*b3s + (2*a*r2*r3 - 2*a*r2*r4 -
    2*a*r3*r4 + 2*a*r4^2)*a1s*b1s^2*b3s + (8*a*r2^2 - 8*a*r2*r3 - 8*a*r2*r4 +
    8*a*r3*r4)*a3s*b2s*b3s + (-4*a*r2^2 + 4*a*r2*r3 + 4*a*r2*r4 - 4*a*r3^2 +
    4*a*r3*r4 - 4*a*r4^2)*a1s*b1s*b2s*b3s + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3*r4 +
    2*a*r4^2)*a1s*b2s^2*b3s + (-4*a*r2^2 + 8*a*r2*r3 - 4*a*r3^2)*a3s*b3s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*a1s*b1s*b3s^2 + (-2*a*r2*r3 +
    2*a*r2*r4 + 2*a*r3^2 - 2*a*r3*r4)*a1s*b2s*b3s^2 + (a^2*r3^2 - 2*a^2*r3*r4 +
    a^2*r4^2)*a1s^2*b1s^2 + (-4*a^2*r3^2 + 8*a^2*r3*r4 - 4*a^2*r4^2)*b1s^3 +
    (-2*a^2*r2*r3 + 2*a^2*r2*r4 + 2*a^2*r3*r4 - 2*a^2*r4^2)*a1s^2*b1s*b2s +
    (4*a^2*r2*r3 - 4*a^2*r2*r4 - 4*a^2*r3*r4 + 4*a^2*r4^2)*b1s^2*b2s + (a^2*r2^2 -
    2*a^2*r2*r4 + a^2*r4^2)*a1s^2*b2s^2 + (4*a^2*r2*r3 - 4*a^2*r2*r4 - 4*a^2*r3*r4
    + 4*a^2*r4^2)*b1s*b2s^2 + (-4*a^2*r2^2 + 8*a^2*r2*r4 - 4*a^2*r4^2)*b2s^3 +
    (2*a^2*r2*r3 - 2*a^2*r2*r4 - 2*a^2*r3^2 + 2*a^2*r3*r4)*a1s^2*b1s*b3s +
    (-4*a^2*r2*r3 + 4*a^2*r2*r4 + 4*a^2*r3^2 - 4*a^2*r3*r4)*b1s^2*b3s +
    (-2*a^2*r2^2 + 2*a^2*r2*r3 + 2*a^2*r2*r4 - 2*a^2*r3*r4)*a1s^2*b2s*b3s +
    (4*a^2*r2^2 - 4*a^2*r2*r3 - 4*a^2*r2*r4 + 4*a^2*r3*r4)*b2s^2*b3s + (a^2*r2^2 -
    2*a^2*r2*r3 + a^2*r3^2)*a1s^2*b3s^2 + (-4*a^2*r2*r3 + 4*a^2*r2*r4 + 4*a^2*r3^2
    - 4*a^2*r3*r4)*b1s*b3s^2 + (4*a^2*r2^2 - 4*a^2*r2*r3 - 4*a^2*r2*r4 +
    4*a^2*r3*r4)*b2s*b3s^2 + (-4*a^2*r2^2 + 8*a^2*r2*r3 - 4*a^2*r3^2)*b3s^3;
c := -discs*c1*c2;

F3 := Evaluate(F3, [x,z,y]);
return F3, c;

end function;


function GluingFormulaAB(invrs, invss, ab);

assert #invrs eq 5;
assert #invss eq 5;
assert #ab eq 1;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

a1r, a3r, b1r, b2r, b3r := Explode(invrs);
a1s, a3s, b1s, b2s, b3s := Explode(invss);
a := Explode(ab);

F3 := ((b1r^2*b2r - b1r^2*b3r - b1r*b2r^2 + b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*b1s^2*b2s
    + (-b1r^2*b2r + b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 - b2r^2*b3r +
    b2r*b3r^2)*b1s*b2s^2 + (-b1r^2*b2r + b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 -
    b2r^2*b3r + b2r*b3r^2)*b1s^2*b3s + (b1r^2*b2r - b1r^2*b3r - b1r*b2r^2 +
    b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*b2s^2*b3s + (b1r^2*b2r - b1r^2*b3r -
    b1r*b2r^2 + b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*b1s*b3s^2 + (-b1r^2*b2r +
    b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 - b2r^2*b3r + b2r*b3r^2)*b2s*b3s^2)*x^4 +
-((-1/2*b2r^2 + b2r*b3r - 1/2*b3r^2)*a1s^2*a3s*b1s^2 + (b1r*b2r - b1r*b3r - b2r*b3r
    + b3r^2)*a1s^2*a3s*b1s*b2s + (-b1r*b2r + b1r*b3r + b2r^2 -
    b2r*b3r)*a3s*b1s^2*b2s + (1/2*b2r^2 - b2r*b3r + 1/2*b3r^2)*a1s*b1s^3*b2s +
    (-1/2*b1r^2 + b1r*b3r - 1/2*b3r^2)*a1s^2*a3s*b2s^2 + (b1r^2 - b1r*b2r -
    b1r*b3r + b2r*b3r)*a3s*b1s*b2s^2 + (-b1r*b2r + b1r*b3r + b2r*b3r -
    b3r^2)*a1s*b1s^2*b2s^2 + (1/2*b1r^2 - b1r*b3r + 1/2*b3r^2)*a1s*b1s*b2s^3 +
    (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a1s^2*a3s*b1s*b3s + (b1r*b2r - b1r*b3r
    - b2r*b3r + b3r^2)*a3s*b1s^2*b3s + (1/2*b2r^2 - b2r*b3r +
    1/2*b3r^2)*a1s*b1s^3*b3s + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s^2*a3s*b2s*b3s + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - 2*b2r^2 +
    2*b2r*b3r - 2*b3r^2)*a3s*b1s*b2s*b3s + (-1/2*b2r^2 + b2r*b3r -
    1/2*b3r^2)*a1s*b1s^2*b2s*b3s + (b1r*b2r - b1r*b3r - b2r*b3r +
    b3r^2)*a3s*b2s^2*b3s + (-1/2*b1r^2 + b1r*b3r - 1/2*b3r^2)*a1s*b1s*b2s^2*b3s +
    (1/2*b1r^2 - b1r*b3r + 1/2*b3r^2)*a1s*b2s^3*b3s + (-1/2*b1r^2 + b1r*b2r -
    1/2*b2r^2)*a1s^2*a3s*b3s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a3s*b1s*b3s^2 + (b1r*b2r - b1r*b3r - b2r^2 + b2r*b3r)*a1s*b1s^2*b3s^2
    + (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a3s*b2s*b3s^2 + (-1/2*b1r^2 + b1r*b2r
    - 1/2*b2r^2)*a1s*b1s*b2s*b3s^2 + (-b1r^2 + b1r*b2r + b1r*b3r -
    b2r*b3r)*a1s*b2s^2*b3s^2 + (1/2*b1r^2 - b1r*b2r + 1/2*b2r^2)*a1s*b1s*b3s^3 +
    (1/2*b1r^2 - b1r*b2r + 1/2*b2r^2)*a1s*b2s*b3s^3 + (-a*b2r^2 + 2*a*b2r*b3r -
    a*b3r^2)*a1s*a3s*b1s^2 + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r +
    2*a*b3r^2)*a1s*a3s*b1s*b2s + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 -
    2*a*b2r*b3r)*b1s^3*b2s + (-a*b1r^2 + 2*a*b1r*b3r - a*b3r^2)*a1s*a3s*b2s^2 +
    (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*b1s*b2s^3 +
    (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 - 2*a*b2r*b3r)*a1s*a3s*b1s*b3s +
    (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r + 2*a*b3r^2)*b1s^3*b3s + (2*a*b1r^2 -
    2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*a*b2r^2 +
    4*a*b2r*b3r - 2*a*b3r^2)*b1s^2*b2s*b3s + (-2*a*b1r^2 + 4*a*b1r*b3r -
    2*a*b3r^2)*b1s*b2s^2*b3s + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r +
    2*a*b3r^2)*b2s^3*b3s + (-a*b1r^2 + 2*a*b1r*b2r - a*b2r^2)*a1s*a3s*b3s^2 +
    (-2*a*b1r^2 + 4*a*b1r*b2r - 2*a*b2r^2)*b1s*b2s*b3s^2 + (2*a*b1r^2 -
    2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*b1s*b3s^3 + (-2*a*b1r*b2r +
    2*a*b1r*b3r + 2*a*b2r^2 - 2*a*b2r*b3r)*b2s*b3s^3)*x^2*y^2 +
-((-2*b2r^2 + 4*b2r*b3r - 2*b3r^2)*a1s*a3s*b1s^2 + (4*b1r*b2r - 4*b1r*b3r -
    4*b2r*b3r + 4*b3r^2)*a1s*a3s*b1s*b2s + (2*b2r^2 - 4*b2r*b3r +
    2*b3r^2)*b1s^3*b2s + (-2*b1r^2 + 4*b1r*b3r - 2*b3r^2)*a1s*a3s*b2s^2 + (2*b1r^2
    - 8*b1r*b2r + 4*b1r*b3r + 2*b2r^2 + 4*b2r*b3r - 4*b3r^2)*b1s^2*b2s^2 +
    (2*b1r^2 - 4*b1r*b3r + 2*b3r^2)*b1s*b2s^3 + (-4*b1r*b2r + 4*b1r*b3r + 4*b2r^2
    - 4*b2r*b3r)*a1s*a3s*b1s*b3s + (2*b2r^2 - 4*b2r*b3r + 2*b3r^2)*b1s^3*b3s +
    (4*b1r^2 - 4*b1r*b2r - 4*b1r*b3r + 4*b2r*b3r)*a1s*a3s*b2s*b3s + (-4*b1r^2 +
    4*b1r*b2r + 4*b1r*b3r - 2*b2r^2 - 2*b3r^2)*b1s^2*b2s*b3s + (-2*b1r^2 +
    4*b1r*b2r - 4*b2r^2 + 4*b2r*b3r - 2*b3r^2)*b1s*b2s^2*b3s + (2*b1r^2 -
    4*b1r*b3r + 2*b3r^2)*b2s^3*b3s + (-2*b1r^2 + 4*b1r*b2r -
    2*b2r^2)*a1s*a3s*b3s^2 + (2*b1r^2 + 4*b1r*b2r - 8*b1r*b3r - 4*b2r^2 +
    4*b2r*b3r + 2*b3r^2)*b1s^2*b3s^2 + (-2*b1r^2 + 4*b1r*b3r - 2*b2r^2 + 4*b2r*b3r
    - 4*b3r^2)*b1s*b2s*b3s^2 + (-4*b1r^2 + 4*b1r*b2r + 4*b1r*b3r + 2*b2r^2 -
    8*b2r*b3r + 2*b3r^2)*b2s^2*b3s^2 + (2*b1r^2 - 4*b1r*b2r + 2*b2r^2)*b1s*b3s^3 +
    (2*b1r^2 - 4*b1r*b2r + 2*b2r^2)*b2s*b3s^3 + (-4*a*b2r^2 + 8*a*b2r*b3r -
    4*a*b3r^2)*a3s*b1s^2 + (8*a*b1r*b2r - 8*a*b1r*b3r - 8*a*b2r*b3r +
    8*a*b3r^2)*a3s*b1s*b2s + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 -
    2*a*b2r*b3r)*a1s*b1s^2*b2s + (-4*a*b1r^2 + 8*a*b1r*b3r - 4*a*b3r^2)*a3s*b2s^2
    + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*b1s*b2s^2 +
    (-8*a*b1r*b2r + 8*a*b1r*b3r + 8*a*b2r^2 - 8*a*b2r*b3r)*a3s*b1s*b3s +
    (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r + 2*a*b3r^2)*a1s*b1s^2*b3s +
    (8*a*b1r^2 - 8*a*b1r*b2r - 8*a*b1r*b3r + 8*a*b2r*b3r)*a3s*b2s*b3s +
    (-4*a*b1r^2 + 4*a*b1r*b2r + 4*a*b1r*b3r - 4*a*b2r^2 + 4*a*b2r*b3r -
    4*a*b3r^2)*a1s*b1s*b2s*b3s + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r +
    2*a*b3r^2)*a1s*b2s^2*b3s + (-4*a*b1r^2 + 8*a*b1r*b2r - 4*a*b2r^2)*a3s*b3s^2 +
    (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*b1s*b3s^2 +
    (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 - 2*a*b2r*b3r)*a1s*b2s*b3s^2)*x^2*y*z +
-((-2*b2r^2 + 4*b2r*b3r - 2*b3r^2)*a3s*b1s^2 + (4*b1r*b2r - 4*b1r*b3r - 4*b2r*b3r +
    4*b3r^2)*a3s*b1s*b2s + (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a1s*b1s^2*b2s +
    (-2*b1r^2 + 4*b1r*b3r - 2*b3r^2)*a3s*b2s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s*b1s*b2s^2 + (-4*b1r*b2r + 4*b1r*b3r + 4*b2r^2 -
    4*b2r*b3r)*a3s*b1s*b3s + (b1r*b2r - b1r*b3r - b2r*b3r + b3r^2)*a1s*b1s^2*b3s +
    (4*b1r^2 - 4*b1r*b2r - 4*b1r*b3r + 4*b2r*b3r)*a3s*b2s*b3s + (-2*b1r^2 +
    2*b1r*b2r + 2*b1r*b3r - 2*b2r^2 + 2*b2r*b3r - 2*b3r^2)*a1s*b1s*b2s*b3s +
    (b1r*b2r - b1r*b3r - b2r*b3r + b3r^2)*a1s*b2s^2*b3s + (-2*b1r^2 + 4*b1r*b2r -
    2*b2r^2)*a3s*b3s^2 + (b1r^2 - b1r*b2r - b1r*b3r + b2r*b3r)*a1s*b1s*b3s^2 +
    (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a1s*b2s*b3s^2 + (a*b2r^2 - 2*a*b2r*b3r
    + a*b3r^2)*a1s^2*b1s^2 + (-4*a*b2r^2 + 8*a*b2r*b3r - 4*a*b3r^2)*b1s^3 +
    (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r*b3r - 2*a*b3r^2)*a1s^2*b1s*b2s +
    (4*a*b1r*b2r - 4*a*b1r*b3r - 4*a*b2r*b3r + 4*a*b3r^2)*b1s^2*b2s + (a*b1r^2 -
    2*a*b1r*b3r + a*b3r^2)*a1s^2*b2s^2 + (4*a*b1r*b2r - 4*a*b1r*b3r - 4*a*b2r*b3r
    + 4*a*b3r^2)*b1s*b2s^2 + (-4*a*b1r^2 + 8*a*b1r*b3r - 4*a*b3r^2)*b2s^3 +
    (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r^2 + 2*a*b2r*b3r)*a1s^2*b1s*b3s +
    (-4*a*b1r*b2r + 4*a*b1r*b3r + 4*a*b2r^2 - 4*a*b2r*b3r)*b1s^2*b3s + (-2*a*b1r^2
    + 2*a*b1r*b2r + 2*a*b1r*b3r - 2*a*b2r*b3r)*a1s^2*b2s*b3s + (4*a*b1r^2 -
    4*a*b1r*b2r - 4*a*b1r*b3r + 4*a*b2r*b3r)*b2s^2*b3s + (a*b1r^2 - 2*a*b1r*b2r +
    a*b2r^2)*a1s^2*b3s^2 + (-4*a*b1r*b2r + 4*a*b1r*b3r + 4*a*b2r^2 -
    4*a*b2r*b3r)*b1s*b3s^2 + (4*a*b1r^2 - 4*a*b1r*b2r - 4*a*b1r*b3r +
    4*a*b2r*b3r)*b2s*b3s^2 + (-4*a*b1r^2 + 8*a*b1r*b2r - 4*a*b2r^2)*b3s^3)*x^2*z^2 +
((1/4*b2r - 1/4*b3r)*a1s*a3s*b1s^3*b2s + (-1/4*b1r - 1/4*b2r +
    1/2*b3r)*a1s*a3s*b1s^2*b2s^2 + (-1/4*b2r + 1/4*b3r)*b1s^4*b2s^2 + (1/4*b1r -
    1/4*b3r)*a1s*a3s*b1s*b2s^3 + (1/4*b1r + 1/4*b2r - 1/2*b3r)*b1s^3*b2s^3 +
    (-1/4*b1r + 1/4*b3r)*b1s^2*b2s^4 + (-1/4*b2r + 1/4*b3r)*a1s*a3s*b1s^3*b3s +
    (1/2*b1r - 1/4*b2r - 1/4*b3r)*a1s*a3s*b1s^2*b2s*b3s + (-1/4*b1r + 1/2*b2r -
    1/4*b3r)*a1s*a3s*b1s*b2s^2*b3s + (-1/4*b1r + 1/4*b2r)*b1s^3*b2s^2*b3s +
    (-1/4*b1r + 1/4*b3r)*a1s*a3s*b2s^3*b3s + (1/4*b1r - 1/4*b2r)*b1s^2*b2s^3*b3s +
    (-1/4*b1r + 1/2*b2r - 1/4*b3r)*a1s*a3s*b1s^2*b3s^2 + (1/4*b2r -
    1/4*b3r)*b1s^4*b3s^2 + (-1/4*b1r - 1/4*b2r + 1/2*b3r)*a1s*a3s*b1s*b2s*b3s^2 +
    (-1/4*b1r + 1/4*b3r)*b1s^3*b2s*b3s^2 + (1/2*b1r - 1/4*b2r -
    1/4*b3r)*a1s*a3s*b2s^2*b3s^2 + (-1/4*b2r + 1/4*b3r)*b1s*b2s^3*b3s^2 + (1/4*b1r
    - 1/4*b3r)*b2s^4*b3s^2 + (1/4*b1r - 1/4*b2r)*a1s*a3s*b1s*b3s^3 + (1/4*b1r -
    1/2*b2r + 1/4*b3r)*b1s^3*b3s^3 + (-1/4*b1r + 1/4*b2r)*a1s*a3s*b2s*b3s^3 +
    (1/4*b1r - 1/4*b3r)*b1s^2*b2s*b3s^3 + (1/4*b2r - 1/4*b3r)*b1s*b2s^2*b3s^3 +
    (-1/2*b1r + 1/4*b2r + 1/4*b3r)*b2s^3*b3s^3 + (-1/4*b1r + 1/4*b2r)*b1s^2*b3s^4
    + (1/4*b1r - 1/4*b2r)*b2s^2*b3s^4 + (a*b2r - a*b3r)*a3s*b1s^3*b2s + (-a*b1r -
    a*b2r + 2*a*b3r)*a3s*b1s^2*b2s^2 + (a*b1r - a*b3r)*a3s*b1s*b2s^3 + (-a*b2r +
    a*b3r)*a3s*b1s^3*b3s + (2*a*b1r - a*b2r - a*b3r)*a3s*b1s^2*b2s*b3s + (-a*b1r +
    2*a*b2r - a*b3r)*a3s*b1s*b2s^2*b3s + (-a*b1r + a*b3r)*a3s*b2s^3*b3s + (-a*b1r
    + 2*a*b2r - a*b3r)*a3s*b1s^2*b3s^2 + (-a*b1r - a*b2r +
    2*a*b3r)*a3s*b1s*b2s*b3s^2 + (2*a*b1r - a*b2r - a*b3r)*a3s*b2s^2*b3s^2 +
    (a*b1r - a*b2r)*a3s*b1s*b3s^3 + (-a*b1r + a*b2r)*a3s*b2s*b3s^3 + (a^2*b2r -
    a^2*b3r)*b1s^4*b2s + (-a^2*b2r + a^2*b3r)*b1s^3*b2s^2 + (-a^2*b1r +
    a^2*b3r)*b1s^2*b2s^3 + (a^2*b1r - a^2*b3r)*b1s*b2s^4 + (-a^2*b2r +
    a^2*b3r)*b1s^4*b3s + (a^2*b1r + a^2*b2r - 2*a^2*b3r)*b1s^2*b2s^2*b3s +
    (-a^2*b1r + a^2*b3r)*b2s^4*b3s + (a^2*b2r - a^2*b3r)*b1s^3*b3s^2 + (a^2*b1r -
    2*a^2*b2r + a^2*b3r)*b1s^2*b2s*b3s^2 + (-2*a^2*b1r + a^2*b2r +
    a^2*b3r)*b1s*b2s^2*b3s^2 + (a^2*b1r - a^2*b3r)*b2s^3*b3s^2 + (-a^2*b1r +
    a^2*b2r)*b1s^2*b3s^3 + (a^2*b1r - a^2*b2r)*b2s^2*b3s^3 + (a^2*b1r -
    a^2*b2r)*b1s*b3s^4 + (-a^2*b1r + a^2*b2r)*b2s*b3s^4)*y^4 +
((-2*a*b1r + 2*a*b2r)*b1s^3*b2s^2 + (2*a*b1r - 2*a*b2r)*b1s^2*b2s^3 + (4*a*b1r -
    2*a*b2r - 2*a*b3r)*b1s^3*b2s*b3s + (-2*a*b1r - 2*a*b2r +
    4*a*b3r)*b1s^2*b2s^2*b3s + (-2*a*b1r + 4*a*b2r - 2*a*b3r)*b1s*b2s^3*b3s +
    (-2*a*b1r + 2*a*b3r)*b1s^3*b3s^2 + (-2*a*b1r + 4*a*b2r -
    2*a*b3r)*b1s^2*b2s*b3s^2 + (4*a*b1r - 2*a*b2r - 2*a*b3r)*b1s*b2s^2*b3s^2 +
    (-2*a*b2r + 2*a*b3r)*b2s^3*b3s^2 + (2*a*b1r - 2*a*b3r)*b1s^2*b3s^3 + (-2*a*b1r
    - 2*a*b2r + 4*a*b3r)*b1s*b2s*b3s^3 + (2*a*b2r - 2*a*b3r)*b2s^2*b3s^3 +
    (2*a^2*b2r - 2*a^2*b3r)*a1s*b1s^3*b2s + (-2*a^2*b1r - 2*a^2*b2r +
    4*a^2*b3r)*a1s*b1s^2*b2s^2 + (2*a^2*b1r - 2*a^2*b3r)*a1s*b1s*b2s^3 +
    (-2*a^2*b2r + 2*a^2*b3r)*a1s*b1s^3*b3s + (4*a^2*b1r - 2*a^2*b2r -
    2*a^2*b3r)*a1s*b1s^2*b2s*b3s + (-2*a^2*b1r + 4*a^2*b2r -
    2*a^2*b3r)*a1s*b1s*b2s^2*b3s + (-2*a^2*b1r + 2*a^2*b3r)*a1s*b2s^3*b3s +
    (-2*a^2*b1r + 4*a^2*b2r - 2*a^2*b3r)*a1s*b1s^2*b3s^2 + (-2*a^2*b1r - 2*a^2*b2r
    + 4*a^2*b3r)*a1s*b1s*b2s*b3s^2 + (4*a^2*b1r - 2*a^2*b2r -
    2*a^2*b3r)*a1s*b2s^2*b3s^2 + (2*a^2*b1r - 2*a^2*b2r)*a1s*b1s*b3s^3 +
    (-2*a^2*b1r + 2*a^2*b2r)*a1s*b2s*b3s^3)*y^3*z +
((b1r - b2r)*b1s^3*b2s^2 + (-b1r + b2r)*b1s^2*b2s^3 + (-2*b1r + b2r +
    b3r)*b1s^3*b2s*b3s + (b1r + b2r - 2*b3r)*b1s^2*b2s^2*b3s + (b1r - 2*b2r +
    b3r)*b1s*b2s^3*b3s + (b1r - b3r)*b1s^3*b3s^2 + (b1r - 2*b2r +
    b3r)*b1s^2*b2s*b3s^2 + (-2*b1r + b2r + b3r)*b1s*b2s^2*b3s^2 + (b2r -
    b3r)*b2s^3*b3s^2 + (-b1r + b3r)*b1s^2*b3s^3 + (b1r + b2r -
    2*b3r)*b1s*b2s*b3s^3 + (-b2r + b3r)*b2s^2*b3s^3 + (-a*b2r +
    a*b3r)*a1s*b1s^3*b2s + (a*b1r + a*b2r - 2*a*b3r)*a1s*b1s^2*b2s^2 + (-a*b1r +
    a*b3r)*a1s*b1s*b2s^3 + (a*b2r - a*b3r)*a1s*b1s^3*b3s + (-2*a*b1r + a*b2r +
    a*b3r)*a1s*b1s^2*b2s*b3s + (a*b1r - 2*a*b2r + a*b3r)*a1s*b1s*b2s^2*b3s +
    (a*b1r - a*b3r)*a1s*b2s^3*b3s + (a*b1r - 2*a*b2r + a*b3r)*a1s*b1s^2*b3s^2 +
    (a*b1r + a*b2r - 2*a*b3r)*a1s*b1s*b2s*b3s^2 + (-2*a*b1r + a*b2r +
    a*b3r)*a1s*b2s^2*b3s^2 + (-a*b1r + a*b2r)*a1s*b1s*b3s^3 + (a*b1r -
    a*b2r)*a1s*b2s*b3s^3 + (4*a^2*b2r - 4*a^2*b3r)*b1s^3*b2s + (-4*a^2*b1r -
    4*a^2*b2r + 8*a^2*b3r)*b1s^2*b2s^2 + (4*a^2*b1r - 4*a^2*b3r)*b1s*b2s^3 +
    (-4*a^2*b2r + 4*a^2*b3r)*b1s^3*b3s + (8*a^2*b1r - 4*a^2*b2r -
    4*a^2*b3r)*b1s^2*b2s*b3s + (-4*a^2*b1r + 8*a^2*b2r - 4*a^2*b3r)*b1s*b2s^2*b3s
    + (-4*a^2*b1r + 4*a^2*b3r)*b2s^3*b3s + (-4*a^2*b1r + 8*a^2*b2r -
    4*a^2*b3r)*b1s^2*b3s^2 + (-4*a^2*b1r - 4*a^2*b2r + 8*a^2*b3r)*b1s*b2s*b3s^2 +
    (8*a^2*b1r - 4*a^2*b2r - 4*a^2*b3r)*b2s^2*b3s^2 + (4*a^2*b1r -
    4*a^2*b2r)*b1s*b3s^3 + (-4*a^2*b1r + 4*a^2*b2r)*b2s*b3s^3)*y^2*z^2 +
((-4*a*b2r + 4*a*b3r)*b1s^3*b2s + (4*a*b1r + 4*a*b2r - 8*a*b3r)*b1s^2*b2s^2 +
    (-4*a*b1r + 4*a*b3r)*b1s*b2s^3 + (4*a*b2r - 4*a*b3r)*b1s^3*b3s + (-8*a*b1r +
    4*a*b2r + 4*a*b3r)*b1s^2*b2s*b3s + (4*a*b1r - 8*a*b2r + 4*a*b3r)*b1s*b2s^2*b3s
    + (4*a*b1r - 4*a*b3r)*b2s^3*b3s + (4*a*b1r - 8*a*b2r + 4*a*b3r)*b1s^2*b3s^2 +
    (4*a*b1r + 4*a*b2r - 8*a*b3r)*b1s*b2s*b3s^2 + (-8*a*b1r + 4*a*b2r +
    4*a*b3r)*b2s^2*b3s^2 + (-4*a*b1r + 4*a*b2r)*b1s*b3s^3 + (4*a*b1r -
    4*a*b2r)*b2s*b3s^3)*y*z^3 +
((b2r - b3r)*b1s^3*b2s + (-b1r - b2r + 2*b3r)*b1s^2*b2s^2 + (b1r - b3r)*b1s*b2s^3 +
    (-b2r + b3r)*b1s^3*b3s + (2*b1r - b2r - b3r)*b1s^2*b2s*b3s + (-b1r + 2*b2r -
    b3r)*b1s*b2s^2*b3s + (-b1r + b3r)*b2s^3*b3s + (-b1r + 2*b2r - b3r)*b1s^2*b3s^2
    + (-b1r - b2r + 2*b3r)*b1s*b2s*b3s^2 + (2*b1r - b2r - b3r)*b2s^2*b3s^2 + (b1r
    - b2r)*b1s*b3s^3 + (-b1r + b2r)*b2s*b3s^3)*z^4;

discs := b1s^2*b2s - b1s*b2s^2 - b1s^2*b3s + b2s^2*b3s + b1s*b3s^2 - b2s*b3s^2;
c1 := (-b2r + b3r)*b1s + (b1r - b3r)*b2s + (-b1r + b2r)*b3s;
c2 := (-b2r^2 + 2*b2r*b3r - b3r^2)*a1s*a3s*b1s^2 + (2*b1r*b2r - 2*b1r*b3r - 2*b2r*b3r +
    2*b3r^2)*a1s*a3s*b1s*b2s + (b2r^2 - 2*b2r*b3r + b3r^2)*b1s^3*b2s + (-b1r^2 +
    2*b1r*b3r - b3r^2)*a1s*a3s*b2s^2 + (b1r^2 - 4*b1r*b2r + 2*b1r*b3r + b2r^2 +
    2*b2r*b3r - 2*b3r^2)*b1s^2*b2s^2 + (b1r^2 - 2*b1r*b3r + b3r^2)*b1s*b2s^3 +
    (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 - 2*b2r*b3r)*a1s*a3s*b1s*b3s + (b2r^2 -
    2*b2r*b3r + b3r^2)*b1s^3*b3s + (2*b1r^2 - 2*b1r*b2r - 2*b1r*b3r +
    2*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - b2r^2 -
    b3r^2)*b1s^2*b2s*b3s + (-b1r^2 + 2*b1r*b2r - 2*b2r^2 + 2*b2r*b3r -
    b3r^2)*b1s*b2s^2*b3s + (b1r^2 - 2*b1r*b3r + b3r^2)*b2s^3*b3s + (-b1r^2 +
    2*b1r*b2r - b2r^2)*a1s*a3s*b3s^2 + (b1r^2 + 2*b1r*b2r - 4*b1r*b3r - 2*b2r^2 +
    2*b2r*b3r + b3r^2)*b1s^2*b3s^2 + (-b1r^2 + 2*b1r*b3r - b2r^2 + 2*b2r*b3r -
    2*b3r^2)*b1s*b2s*b3s^2 + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r + b2r^2 - 4*b2r*b3r
    + b3r^2)*b2s^2*b3s^2 + (b1r^2 - 2*b1r*b2r + b2r^2)*b1s*b3s^3 + (b1r^2 -
    2*b1r*b2r + b2r^2)*b2s*b3s^3 + (-4*a*b2r^2 + 8*a*b2r*b3r -
    4*a*b3r^2)*a3s*b1s^2 + (8*a*b1r*b2r - 8*a*b1r*b3r - 8*a*b2r*b3r +
    8*a*b3r^2)*a3s*b1s*b2s + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 -
    2*a*b2r*b3r)*a1s*b1s^2*b2s + (-4*a*b1r^2 + 8*a*b1r*b3r - 4*a*b3r^2)*a3s*b2s^2
    + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*b1s*b2s^2 +
    (-8*a*b1r*b2r + 8*a*b1r*b3r + 8*a*b2r^2 - 8*a*b2r*b3r)*a3s*b1s*b3s +
    (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r + 2*a*b3r^2)*a1s*b1s^2*b3s +
    (8*a*b1r^2 - 8*a*b1r*b2r - 8*a*b1r*b3r + 8*a*b2r*b3r)*a3s*b2s*b3s +
    (-4*a*b1r^2 + 4*a*b1r*b2r + 4*a*b1r*b3r - 4*a*b2r^2 + 4*a*b2r*b3r -
    4*a*b3r^2)*a1s*b1s*b2s*b3s + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r*b3r +
    2*a*b3r^2)*a1s*b2s^2*b3s + (-4*a*b1r^2 + 8*a*b1r*b2r - 4*a*b2r^2)*a3s*b3s^2 +
    (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*b1s*b3s^2 +
    (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 - 2*a*b2r*b3r)*a1s*b2s*b3s^2 +
    (a^2*b2r^2 - 2*a^2*b2r*b3r + a^2*b3r^2)*a1s^2*b1s^2 + (-4*a^2*b2r^2 +
    8*a^2*b2r*b3r - 4*a^2*b3r^2)*b1s^3 + (-2*a^2*b1r*b2r + 2*a^2*b1r*b3r +
    2*a^2*b2r*b3r - 2*a^2*b3r^2)*a1s^2*b1s*b2s + (4*a^2*b1r*b2r - 4*a^2*b1r*b3r -
    4*a^2*b2r*b3r + 4*a^2*b3r^2)*b1s^2*b2s + (a^2*b1r^2 - 2*a^2*b1r*b3r +
    a^2*b3r^2)*a1s^2*b2s^2 + (4*a^2*b1r*b2r - 4*a^2*b1r*b3r - 4*a^2*b2r*b3r +
    4*a^2*b3r^2)*b1s*b2s^2 + (-4*a^2*b1r^2 + 8*a^2*b1r*b3r - 4*a^2*b3r^2)*b2s^3 +
    (2*a^2*b1r*b2r - 2*a^2*b1r*b3r - 2*a^2*b2r^2 + 2*a^2*b2r*b3r)*a1s^2*b1s*b3s +
    (-4*a^2*b1r*b2r + 4*a^2*b1r*b3r + 4*a^2*b2r^2 - 4*a^2*b2r*b3r)*b1s^2*b3s +
    (-2*a^2*b1r^2 + 2*a^2*b1r*b2r + 2*a^2*b1r*b3r - 2*a^2*b2r*b3r)*a1s^2*b2s*b3s +
    (4*a^2*b1r^2 - 4*a^2*b1r*b2r - 4*a^2*b1r*b3r + 4*a^2*b2r*b3r)*b2s^2*b3s +
    (a^2*b1r^2 - 2*a^2*b1r*b2r + a^2*b2r^2)*a1s^2*b3s^2 + (-4*a^2*b1r*b2r +
    4*a^2*b1r*b3r + 4*a^2*b2r^2 - 4*a^2*b2r*b3r)*b1s*b3s^2 + (4*a^2*b1r^2 -
    4*a^2*b1r*b2r - 4*a^2*b1r*b3r + 4*a^2*b2r*b3r)*b2s*b3s^2 + (-4*a^2*b1r^2 +
    8*a^2*b1r*b2r - 4*a^2*b2r^2)*b3s^3;
c := discs*c1*c2;

F3 := Evaluate(F3, [x,z,y]);
return F3, c;

end function;


function GluingFormulaRsSs(rs, ss, ab);

assert #rs eq 3;
assert #ss eq 3;
assert #ab eq 2;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

r2, r3, r4 := Explode(rs);
s2, s3, s4 := Explode(ss);
a, b := Explode(ab);

F3 := (r2^2*r3*s2^2*s3 - r2^2*r3*s2^2*s4 - r2^2*r3*s2*s3^2 + r2^2*r3*s2*s4^2 +
    r2^2*r3*s3^2*s4 - r2^2*r3*s3*s4^2 - r2^2*r4*s2^2*s3 + r2^2*r4*s2^2*s4 +
    r2^2*r4*s2*s3^2 - r2^2*r4*s2*s4^2 - r2^2*r4*s3^2*s4 + r2^2*r4*s3*s4^2 -
    r2*r3^2*s2^2*s3 + r2*r3^2*s2^2*s4 + r2*r3^2*s2*s3^2 - r2*r3^2*s2*s4^2 -
    r2*r3^2*s3^2*s4 + r2*r3^2*s3*s4^2 + r2*r4^2*s2^2*s3 - r2*r4^2*s2^2*s4 -
    r2*r4^2*s2*s3^2 + r2*r4^2*s2*s4^2 + r2*r4^2*s3^2*s4 - r2*r4^2*s3*s4^2 +
    r3^2*r4*s2^2*s3 - r3^2*r4*s2^2*s4 - r3^2*r4*s2*s3^2 + r3^2*r4*s2*s4^2 +
    r3^2*r4*s3^2*s4 - r3^2*r4*s3*s4^2 - r3*r4^2*s2^2*s3 + r3*r4^2*s2^2*s4 +
    r3*r4^2*s2*s3^2 - r3*r4^2*s2*s4^2 - r3*r4^2*s3^2*s4 + r3*r4^2*s3*s4^2)*x^4 +
    (a*r2^2*s2^2*s3^3 - a*r2^2*s2^2*s3^2*s4 - a*r2^2*s2^2*s3*s4^2 +
    a*r2^2*s2^2*s4^3 - a*r2^2*s2*s3^3*s4 + 2*a*r2^2*s2*s3^2*s4^2 -
    a*r2^2*s2*s3*s4^3 - a*r2*r3*s2^3*s3^2 + a*r2*r3*s2^3*s4^2 - a*r2*r3*s2^2*s3^3
    + 4*a*r2*r3*s2^2*s3^2*s4 - 2*a*r2*r3*s2^2*s3*s4^2 - a*r2*r3*s2^2*s4^3 -
    2*a*r2*r3*s2*s3^2*s4^2 + 2*a*r2*r3*s2*s3*s4^3 + a*r2*r3*s3^3*s4^2 -
    a*r2*r3*s3^2*s4^3 + a*r2*r4*s2^3*s3^2 - a*r2*r4*s2^3*s4^2 - a*r2*r4*s2^2*s3^3
    - 2*a*r2*r4*s2^2*s3^2*s4 + 4*a*r2*r4*s2^2*s3*s4^2 - a*r2*r4*s2^2*s4^3 +
    2*a*r2*r4*s2*s3^3*s4 - 2*a*r2*r4*s2*s3^2*s4^2 - a*r2*r4*s3^3*s4^2 +
    a*r2*r4*s3^2*s4^3 + a*r3^2*s2^3*s3^2 - a*r3^2*s2^3*s3*s4 - a*r3^2*s2^2*s3^2*s4
    + 2*a*r3^2*s2^2*s3*s4^2 - a*r3^2*s2*s3^2*s4^2 - a*r3^2*s2*s3*s4^3 +
    a*r3^2*s3^2*s4^3 - a*r3*r4*s2^3*s3^2 + 2*a*r3*r4*s2^3*s3*s4 -
    a*r3*r4*s2^3*s4^2 + a*r3*r4*s2^2*s3^3 - 2*a*r3*r4*s2^2*s3^2*s4 -
    2*a*r3*r4*s2^2*s3*s4^2 + a*r3*r4*s2^2*s4^3 + 4*a*r3*r4*s2*s3^2*s4^2 -
    a*r3*r4*s3^3*s4^2 - a*r3*r4*s3^2*s4^3 - a*r4^2*s2^3*s3*s4 + a*r4^2*s2^3*s4^2 +
    2*a*r4^2*s2^2*s3^2*s4 - a*r4^2*s2^2*s3*s4^2 - a*r4^2*s2*s3^3*s4 -
    a*r4^2*s2*s3^2*s4^2 + a*r4^2*s3^3*s4^2 + b*r2^2*s2*s3^3 - b*r2^2*s2*s3^2*s4 -
    b*r2^2*s2*s3*s4^2 + b*r2^2*s2*s4^3 - b*r2^2*s3^3*s4 + 2*b*r2^2*s3^2*s4^2 -
    b*r2^2*s3*s4^3 - 2*b*r2*r3*s2^3*s3 + 2*b*r2*r3*s2^3*s4 + 2*b*r2*r3*s2^2*s3^2 -
    2*b*r2*r3*s2^2*s4^2 - 2*b*r2*r3*s2*s3^3 + 2*b*r2*r3*s2*s3*s4^2 +
    2*b*r2*r3*s3^3*s4 - 2*b*r2*r3*s3^2*s4^2 + 2*b*r2*r4*s2^3*s3 -
    2*b*r2*r4*s2^3*s4 - 2*b*r2*r4*s2^2*s3^2 + 2*b*r2*r4*s2^2*s4^2 +
    2*b*r2*r4*s2*s3^2*s4 - 2*b*r2*r4*s2*s4^3 - 2*b*r2*r4*s3^2*s4^2 +
    2*b*r2*r4*s3*s4^3 + b*r3^2*s2^3*s3 - b*r3^2*s2^3*s4 - b*r3^2*s2^2*s3*s4 +
    2*b*r3^2*s2^2*s4^2 - b*r3^2*s2*s3*s4^2 - b*r3^2*s2*s4^3 + b*r3^2*s3*s4^3 -
    2*b*r3*r4*s2^2*s3^2 + 2*b*r3*r4*s2^2*s3*s4 - 2*b*r3*r4*s2^2*s4^2 +
    2*b*r3*r4*s2*s3^3 + 2*b*r3*r4*s2*s4^3 - 2*b*r3*r4*s3^3*s4 +
    2*b*r3*r4*s3^2*s4^2 - 2*b*r3*r4*s3*s4^3 - b*r4^2*s2^3*s3 + b*r4^2*s2^3*s4 +
    2*b*r4^2*s2^2*s3^2 - b*r4^2*s2^2*s3*s4 - b*r4^2*s2*s3^3 - b*r4^2*s2*s3^2*s4 +
    b*r4^2*s3^3*s4 + r2^2*s2^2*s3^4 - 2*r2^2*s2^2*s3^2*s4^2 + r2^2*s2^2*s4^4 -
    2*r2^2*s2*s3^4*s4 + 2*r2^2*s2*s3^3*s4^2 + 2*r2^2*s2*s3^2*s4^3 -
    2*r2^2*s2*s3*s4^4 + r2^2*s3^4*s4^2 - 2*r2^2*s3^3*s4^3 + r2^2*s3^2*s4^4 -
    2*r2*r3*s2^3*s3^3 + 2*r2*r3*s2^3*s3^2*s4 - 2*r2*r3*s2^3*s3*s4^2 +
    2*r2*r3*s2^3*s4^3 + 2*r2*r3*s2^2*s3^3*s4 + 2*r2*r3*s2^2*s3^2*s4^2 -
    2*r2*r3*s2^2*s3*s4^3 - 2*r2*r3*s2^2*s4^4 - 2*r2*r3*s2*s3^3*s4^2 -
    2*r2*r3*s2*s3^2*s4^3 + 4*r2*r3*s2*s3*s4^4 + 2*r2*r3*s3^3*s4^3 -
    2*r2*r3*s3^2*s4^4 + 2*r2*r4*s2^3*s3^3 - 2*r2*r4*s2^3*s3^2*s4 +
    2*r2*r4*s2^3*s3*s4^2 - 2*r2*r4*s2^3*s4^3 - 2*r2*r4*s2^2*s3^4 -
    2*r2*r4*s2^2*s3^3*s4 + 2*r2*r4*s2^2*s3^2*s4^2 + 2*r2*r4*s2^2*s3*s4^3 +
    4*r2*r4*s2*s3^4*s4 - 2*r2*r4*s2*s3^3*s4^2 - 2*r2*r4*s2*s3^2*s4^3 -
    2*r2*r4*s3^4*s4^2 + 2*r2*r4*s3^3*s4^3 + r3^2*s2^4*s3^2 - 2*r3^2*s2^4*s3*s4 +
    r3^2*s2^4*s4^2 + 2*r3^2*s2^3*s3*s4^2 - 2*r3^2*s2^3*s4^3 -
    2*r3^2*s2^2*s3^2*s4^2 + 2*r3^2*s2^2*s3*s4^3 + r3^2*s2^2*s4^4 -
    2*r3^2*s2*s3*s4^4 + r3^2*s3^2*s4^4 - 2*r3*r4*s2^4*s3^2 + 4*r3*r4*s2^4*s3*s4 -
    2*r3*r4*s2^4*s4^2 + 2*r3*r4*s2^3*s3^3 - 2*r3*r4*s2^3*s3^2*s4 -
    2*r3*r4*s2^3*s3*s4^2 + 2*r3*r4*s2^3*s4^3 - 2*r3*r4*s2^2*s3^3*s4 +
    2*r3*r4*s2^2*s3^2*s4^2 - 2*r3*r4*s2^2*s3*s4^3 + 2*r3*r4*s2*s3^3*s4^2 +
    2*r3*r4*s2*s3^2*s4^3 - 2*r3*r4*s3^3*s4^3 + r4^2*s2^4*s3^2 - 2*r4^2*s2^4*s3*s4
    + r4^2*s2^4*s4^2 - 2*r4^2*s2^3*s3^3 + 2*r4^2*s2^3*s3^2*s4 + r4^2*s2^2*s3^4 +
    2*r4^2*s2^2*s3^3*s4 - 2*r4^2*s2^2*s3^2*s4^2 - 2*r4^2*s2*s3^4*s4 +
    r4^2*s3^4*s4^2)*x^2*y^2 + (-2*a*r2^2*s2^2*s3^2 + 4*a*r2^2*s2^2*s3*s4 -
    2*a*r2^2*s2^2*s4^2 + 4*a*r2*r3*s2^2*s3^2 - 4*a*r2*r3*s2^2*s3*s4 -
    4*a*r2*r3*s2*s3^2*s4 + 4*a*r2*r3*s2*s3*s4^2 - 4*a*r2*r4*s2^2*s3*s4 +
    4*a*r2*r4*s2^2*s4^2 + 4*a*r2*r4*s2*s3^2*s4 - 4*a*r2*r4*s2*s3*s4^2 -
    2*a*r3^2*s2^2*s3^2 + 4*a*r3^2*s2*s3^2*s4 - 2*a*r3^2*s3^2*s4^2 +
    4*a*r3*r4*s2^2*s3*s4 - 4*a*r3*r4*s2*s3^2*s4 - 4*a*r3*r4*s2*s3*s4^2 +
    4*a*r3*r4*s3^2*s4^2 - 2*a*r4^2*s2^2*s4^2 + 4*a*r4^2*s2*s3*s4^2 -
    2*a*r4^2*s3^2*s4^2 - 2*b*r2^2*s2*s3^2 + 4*b*r2^2*s2*s3*s4 - 2*b*r2^2*s2*s4^2 +
    2*b*r2*r3*s2^2*s3 - 2*b*r2*r3*s2^2*s4 + 2*b*r2*r3*s2*s3^2 - 4*b*r2*r3*s2*s3*s4
    + 2*b*r2*r3*s2*s4^2 - 2*b*r2*r3*s3^2*s4 + 2*b*r2*r3*s3*s4^2 -
    2*b*r2*r4*s2^2*s3 + 2*b*r2*r4*s2^2*s4 + 2*b*r2*r4*s2*s3^2 - 4*b*r2*r4*s2*s3*s4
    + 2*b*r2*r4*s2*s4^2 + 2*b*r2*r4*s3^2*s4 - 2*b*r2*r4*s3*s4^2 - 2*b*r3^2*s2^2*s3
    + 4*b*r3^2*s2*s3*s4 - 2*b*r3^2*s3*s4^2 + 2*b*r3*r4*s2^2*s3 + 2*b*r3*r4*s2^2*s4
    - 2*b*r3*r4*s2*s3^2 - 4*b*r3*r4*s2*s3*s4 - 2*b*r3*r4*s2*s4^2 +
    2*b*r3*r4*s3^2*s4 + 2*b*r3*r4*s3*s4^2 - 2*b*r4^2*s2^2*s4 + 4*b*r4^2*s2*s3*s4 -
    2*b*r4^2*s3^2*s4 - 2*r2^2*s2^2*s3^3 + 2*r2^2*s2^2*s3^2*s4 +
    2*r2^2*s2^2*s3*s4^2 - 2*r2^2*s2^2*s4^3 + 2*r2^2*s2*s3^3*s4 -
    4*r2^2*s2*s3^2*s4^2 + 2*r2^2*s2*s3*s4^3 + 2*r2*r3*s2^3*s3^2 -
    2*r2*r3*s2^3*s4^2 + 2*r2*r3*s2^2*s3^3 - 8*r2*r3*s2^2*s3^2*s4 +
    4*r2*r3*s2^2*s3*s4^2 + 2*r2*r3*s2^2*s4^3 + 4*r2*r3*s2*s3^2*s4^2 -
    4*r2*r3*s2*s3*s4^3 - 2*r2*r3*s3^3*s4^2 + 2*r2*r3*s3^2*s4^3 - 2*r2*r4*s2^3*s3^2
    + 2*r2*r4*s2^3*s4^2 + 2*r2*r4*s2^2*s3^3 + 4*r2*r4*s2^2*s3^2*s4 -
    8*r2*r4*s2^2*s3*s4^2 + 2*r2*r4*s2^2*s4^3 - 4*r2*r4*s2*s3^3*s4 +
    4*r2*r4*s2*s3^2*s4^2 + 2*r2*r4*s3^3*s4^2 - 2*r2*r4*s3^2*s4^3 -
    2*r3^2*s2^3*s3^2 + 2*r3^2*s2^3*s3*s4 + 2*r3^2*s2^2*s3^2*s4 -
    4*r3^2*s2^2*s3*s4^2 + 2*r3^2*s2*s3^2*s4^2 + 2*r3^2*s2*s3*s4^3 -
    2*r3^2*s3^2*s4^3 + 2*r3*r4*s2^3*s3^2 - 4*r3*r4*s2^3*s3*s4 + 2*r3*r4*s2^3*s4^2
    - 2*r3*r4*s2^2*s3^3 + 4*r3*r4*s2^2*s3^2*s4 + 4*r3*r4*s2^2*s3*s4^2 -
    2*r3*r4*s2^2*s4^3 - 8*r3*r4*s2*s3^2*s4^2 + 2*r3*r4*s3^3*s4^2 +
    2*r3*r4*s3^2*s4^3 + 2*r4^2*s2^3*s3*s4 - 2*r4^2*s2^3*s4^2 - 4*r4^2*s2^2*s3^2*s4
    + 2*r4^2*s2^2*s3*s4^2 + 2*r4^2*s2*s3^3*s4 + 2*r4^2*s2*s3^2*s4^2 -
    2*r4^2*s3^3*s4^2)*x^2*y*z + (a*r2^2*s2*s3^2 - 2*a*r2^2*s2*s3*s4 +
    a*r2^2*s2*s4^2 - a*r2*r3*s2^2*s3 + a*r2*r3*s2^2*s4 - a*r2*r3*s2*s3^2 +
    2*a*r2*r3*s2*s3*s4 - a*r2*r3*s2*s4^2 + a*r2*r3*s3^2*s4 - a*r2*r3*s3*s4^2 +
    a*r2*r4*s2^2*s3 - a*r2*r4*s2^2*s4 - a*r2*r4*s2*s3^2 + 2*a*r2*r4*s2*s3*s4 -
    a*r2*r4*s2*s4^2 - a*r2*r4*s3^2*s4 + a*r2*r4*s3*s4^2 + a*r3^2*s2^2*s3 -
    2*a*r3^2*s2*s3*s4 + a*r3^2*s3*s4^2 - a*r3*r4*s2^2*s3 - a*r3*r4*s2^2*s4 +
    a*r3*r4*s2*s3^2 + 2*a*r3*r4*s2*s3*s4 + a*r3*r4*s2*s4^2 - a*r3*r4*s3^2*s4 -
    a*r3*r4*s3*s4^2 + a*r4^2*s2^2*s4 - 2*a*r4^2*s2*s3*s4 + a*r4^2*s3^2*s4 +
    b*r2^2*s3^2 - 2*b*r2^2*s3*s4 + b*r2^2*s4^2 - 2*b*r2*r3*s2*s3 + 2*b*r2*r3*s2*s4
    + 2*b*r2*r3*s3*s4 - 2*b*r2*r3*s4^2 + 2*b*r2*r4*s2*s3 - 2*b*r2*r4*s2*s4 -
    2*b*r2*r4*s3^2 + 2*b*r2*r4*s3*s4 + b*r3^2*s2^2 - 2*b*r3^2*s2*s4 + b*r3^2*s4^2
    - 2*b*r3*r4*s2^2 + 2*b*r3*r4*s2*s3 + 2*b*r3*r4*s2*s4 - 2*b*r3*r4*s3*s4 +
    b*r4^2*s2^2 - 2*b*r4^2*s2*s3 + b*r4^2*s3^2 + r2^2*s2*s3^3 - r2^2*s2*s3^2*s4 -
    r2^2*s2*s3*s4^2 + r2^2*s2*s4^3 - r2^2*s3^3*s4 + 2*r2^2*s3^2*s4^2 -
    r2^2*s3*s4^3 - 2*r2*r3*s2^3*s3 + 2*r2*r3*s2^3*s4 + 2*r2*r3*s2^2*s3^2 -
    2*r2*r3*s2^2*s4^2 - 2*r2*r3*s2*s3^3 + 2*r2*r3*s2*s3*s4^2 + 2*r2*r3*s3^3*s4 -
    2*r2*r3*s3^2*s4^2 + 2*r2*r4*s2^3*s3 - 2*r2*r4*s2^3*s4 - 2*r2*r4*s2^2*s3^2 +
    2*r2*r4*s2^2*s4^2 + 2*r2*r4*s2*s3^2*s4 - 2*r2*r4*s2*s4^3 - 2*r2*r4*s3^2*s4^2 +
    2*r2*r4*s3*s4^3 + r3^2*s2^3*s3 - r3^2*s2^3*s4 - r3^2*s2^2*s3*s4 +
    2*r3^2*s2^2*s4^2 - r3^2*s2*s3*s4^2 - r3^2*s2*s4^3 + r3^2*s3*s4^3 -
    2*r3*r4*s2^2*s3^2 + 2*r3*r4*s2^2*s3*s4 - 2*r3*r4*s2^2*s4^2 + 2*r3*r4*s2*s3^3 +
    2*r3*r4*s2*s4^3 - 2*r3*r4*s3^3*s4 + 2*r3*r4*s3^2*s4^2 - 2*r3*r4*s3*s4^3 -
    r4^2*s2^3*s3 + r4^2*s2^3*s4 + 2*r4^2*s2^2*s3^2 - r4^2*s2^2*s3*s4 -
    r4^2*s2*s3^3 - r4^2*s2*s3^2*s4 + r4^2*s3^3*s4)*x^2*z^2 + (-a^2*r2*s2^3*s3^3*s4
    + 2*a^2*r2*s2^3*s3^2*s4^2 - a^2*r2*s2^3*s3*s4^3 + a^2*r2*s2^2*s3^4*s4 -
    a^2*r2*s2^2*s3^3*s4^2 - a^2*r2*s2^2*s3^2*s4^3 + a^2*r2*s2^2*s3*s4^4 -
    a^2*r2*s2*s3^4*s4^2 + 2*a^2*r2*s2*s3^3*s4^3 - a^2*r2*s2*s3^2*s4^4 +
    a^2*r3*s2^4*s3^2*s4 - a^2*r3*s2^4*s3*s4^2 - a^2*r3*s2^3*s3^3*s4 -
    a^2*r3*s2^3*s3^2*s4^2 + 2*a^2*r3*s2^3*s3*s4^3 + 2*a^2*r3*s2^2*s3^3*s4^2 -
    a^2*r3*s2^2*s3^2*s4^3 - a^2*r3*s2^2*s3*s4^4 - a^2*r3*s2*s3^3*s4^3 +
    a^2*r3*s2*s3^2*s4^4 - a^2*r4*s2^4*s3^2*s4 + a^2*r4*s2^4*s3*s4^2 +
    2*a^2*r4*s2^3*s3^3*s4 - a^2*r4*s2^3*s3^2*s4^2 - a^2*r4*s2^3*s3*s4^3 -
    a^2*r4*s2^2*s3^4*s4 - a^2*r4*s2^2*s3^3*s4^2 + 2*a^2*r4*s2^2*s3^2*s4^3 +
    a^2*r4*s2*s3^4*s4^2 - a^2*r4*s2*s3^3*s4^3 - a*b*r2*s2^3*s3^3 +
    a*b*r2*s2^3*s3^2*s4 + a*b*r2*s2^3*s3*s4^2 - a*b*r2*s2^3*s4^3 +
    a*b*r2*s2^2*s3^4 - a*b*r2*s2^2*s3^3*s4 - a*b*r2*s2^2*s3*s4^3 +
    a*b*r2*s2^2*s4^4 - a*b*r2*s3^4*s4^2 + 2*a*b*r2*s3^3*s4^3 - a*b*r2*s3^2*s4^4 +
    a*b*r3*s2^4*s3^2 - a*b*r3*s2^4*s4^2 - a*b*r3*s2^3*s3^3 - a*b*r3*s2^3*s3^2*s4 +
    2*a*b*r3*s2^3*s4^3 + a*b*r3*s2^2*s3^3*s4 - a*b*r3*s2^2*s4^4 +
    a*b*r3*s2*s3^3*s4^2 - a*b*r3*s2*s3^2*s4^3 - a*b*r3*s3^3*s4^3 +
    a*b*r3*s3^2*s4^4 - a*b*r4*s2^4*s3^2 + a*b*r4*s2^4*s4^2 + 2*a*b*r4*s2^3*s3^3 -
    a*b*r4*s2^3*s3*s4^2 - a*b*r4*s2^3*s4^3 - a*b*r4*s2^2*s3^4 +
    a*b*r4*s2^2*s3*s4^3 - a*b*r4*s2*s3^3*s4^2 + a*b*r4*s2*s3^2*s4^3 +
    a*b*r4*s3^4*s4^2 - a*b*r4*s3^3*s4^3 - b^2*r2*s2^2*s3^3 + b^2*r2*s2^2*s3^2*s4 +
    b^2*r2*s2^2*s3*s4^2 - b^2*r2*s2^2*s4^3 + b^2*r2*s2*s3^4 -
    2*b^2*r2*s2*s3^2*s4^2 + b^2*r2*s2*s4^4 - b^2*r2*s3^4*s4 + b^2*r2*s3^3*s4^2 +
    b^2*r2*s3^2*s4^3 - b^2*r2*s3*s4^4 + b^2*r3*s2^4*s3 - b^2*r3*s2^4*s4 -
    b^2*r3*s2^3*s3^2 + b^2*r3*s2^3*s4^2 + b^2*r3*s2^2*s3^2*s4 -
    2*b^2*r3*s2^2*s3*s4^2 + b^2*r3*s2^2*s4^3 + b^2*r3*s2*s3^2*s4^2 -
    b^2*r3*s2*s4^4 - b^2*r3*s3^2*s4^3 + b^2*r3*s3*s4^4 - b^2*r4*s2^4*s3 +
    b^2*r4*s2^4*s4 + b^2*r4*s2^3*s3^2 - b^2*r4*s2^3*s4^2 + b^2*r4*s2^2*s3^3 -
    2*b^2*r4*s2^2*s3^2*s4 + b^2*r4*s2^2*s3*s4^2 - b^2*r4*s2*s3^4 +
    b^2*r4*s2*s3^2*s4^2 + b^2*r4*s3^4*s4 - b^2*r4*s3^3*s4^2)*y^4 +
    (2*a*b*r2*s2^3*s3^2 - 4*a*b*r2*s2^3*s3*s4 + 2*a*b*r2*s2^3*s4^2 -
    2*a*b*r2*s2^2*s3^3 + 2*a*b*r2*s2^2*s3^2*s4 + 2*a*b*r2*s2^2*s3*s4^2 -
    2*a*b*r2*s2^2*s4^3 + 2*a*b*r2*s2*s3^3*s4 - 4*a*b*r2*s2*s3^2*s4^2 +
    2*a*b*r2*s2*s3*s4^3 - 2*a*b*r3*s2^3*s3^2 + 2*a*b*r3*s2^3*s3*s4 +
    2*a*b*r3*s2^2*s3^3 + 2*a*b*r3*s2^2*s3^2*s4 - 4*a*b*r3*s2^2*s3*s4^2 -
    4*a*b*r3*s2*s3^3*s4 + 2*a*b*r3*s2*s3^2*s4^2 + 2*a*b*r3*s2*s3*s4^3 +
    2*a*b*r3*s3^3*s4^2 - 2*a*b*r3*s3^2*s4^3 + 2*a*b*r4*s2^3*s3*s4 -
    2*a*b*r4*s2^3*s4^2 - 4*a*b*r4*s2^2*s3^2*s4 + 2*a*b*r4*s2^2*s3*s4^2 +
    2*a*b*r4*s2^2*s4^3 + 2*a*b*r4*s2*s3^3*s4 + 2*a*b*r4*s2*s3^2*s4^2 -
    4*a*b*r4*s2*s3*s4^3 - 2*a*b*r4*s3^3*s4^2 + 2*a*b*r4*s3^2*s4^3 -
    4*a*r2*s2^3*s3^3*s4 + 8*a*r2*s2^3*s3^2*s4^2 - 4*a*r2*s2^3*s3*s4^3 +
    4*a*r2*s2^2*s3^4*s4 - 4*a*r2*s2^2*s3^3*s4^2 - 4*a*r2*s2^2*s3^2*s4^3 +
    4*a*r2*s2^2*s3*s4^4 - 4*a*r2*s2*s3^4*s4^2 + 8*a*r2*s2*s3^3*s4^3 -
    4*a*r2*s2*s3^2*s4^4 + 4*a*r3*s2^4*s3^2*s4 - 4*a*r3*s2^4*s3*s4^2 -
    4*a*r3*s2^3*s3^3*s4 - 4*a*r3*s2^3*s3^2*s4^2 + 8*a*r3*s2^3*s3*s4^3 +
    8*a*r3*s2^2*s3^3*s4^2 - 4*a*r3*s2^2*s3^2*s4^3 - 4*a*r3*s2^2*s3*s4^4 -
    4*a*r3*s2*s3^3*s4^3 + 4*a*r3*s2*s3^2*s4^4 - 4*a*r4*s2^4*s3^2*s4 +
    4*a*r4*s2^4*s3*s4^2 + 8*a*r4*s2^3*s3^3*s4 - 4*a*r4*s2^3*s3^2*s4^2 -
    4*a*r4*s2^3*s3*s4^3 - 4*a*r4*s2^2*s3^4*s4 - 4*a*r4*s2^2*s3^3*s4^2 +
    8*a*r4*s2^2*s3^2*s4^3 + 4*a*r4*s2*s3^4*s4^2 - 4*a*r4*s2*s3^3*s4^3 +
    2*b^2*r2*s2^2*s3^2 - 4*b^2*r2*s2^2*s3*s4 + 2*b^2*r2*s2^2*s4^2 -
    2*b^2*r2*s2*s3^3 + 2*b^2*r2*s2*s3^2*s4 + 2*b^2*r2*s2*s3*s4^2 -
    2*b^2*r2*s2*s4^3 + 2*b^2*r2*s3^3*s4 - 4*b^2*r2*s3^2*s4^2 + 2*b^2*r2*s3*s4^3 -
    2*b^2*r3*s2^3*s3 + 2*b^2*r3*s2^3*s4 + 2*b^2*r3*s2^2*s3^2 + 2*b^2*r3*s2^2*s3*s4
    - 4*b^2*r3*s2^2*s4^2 - 4*b^2*r3*s2*s3^2*s4 + 2*b^2*r3*s2*s3*s4^2 +
    2*b^2*r3*s2*s4^3 + 2*b^2*r3*s3^2*s4^2 - 2*b^2*r3*s3*s4^3 + 2*b^2*r4*s2^3*s3 -
    2*b^2*r4*s2^3*s4 - 4*b^2*r4*s2^2*s3^2 + 2*b^2*r4*s2^2*s3*s4 +
    2*b^2*r4*s2^2*s4^2 + 2*b^2*r4*s2*s3^3 + 2*b^2*r4*s2*s3^2*s4 -
    4*b^2*r4*s2*s3*s4^2 - 2*b^2*r4*s3^3*s4 + 2*b^2*r4*s3^2*s4^2 - 2*b*r2*s2^3*s3^3
    + 2*b*r2*s2^3*s3^2*s4 + 2*b*r2*s2^3*s3*s4^2 - 2*b*r2*s2^3*s4^3 +
    2*b*r2*s2^2*s3^4 - 2*b*r2*s2^2*s3^3*s4 - 2*b*r2*s2^2*s3*s4^3 +
    2*b*r2*s2^2*s4^4 - 2*b*r2*s3^4*s4^2 + 4*b*r2*s3^3*s4^3 - 2*b*r2*s3^2*s4^4 +
    2*b*r3*s2^4*s3^2 - 2*b*r3*s2^4*s4^2 - 2*b*r3*s2^3*s3^3 - 2*b*r3*s2^3*s3^2*s4 +
    4*b*r3*s2^3*s4^3 + 2*b*r3*s2^2*s3^3*s4 - 2*b*r3*s2^2*s4^4 +
    2*b*r3*s2*s3^3*s4^2 - 2*b*r3*s2*s3^2*s4^3 - 2*b*r3*s3^3*s4^3 +
    2*b*r3*s3^2*s4^4 - 2*b*r4*s2^4*s3^2 + 2*b*r4*s2^4*s4^2 + 4*b*r4*s2^3*s3^3 -
    2*b*r4*s2^3*s3*s4^2 - 2*b*r4*s2^3*s4^3 - 2*b*r4*s2^2*s3^4 +
    2*b*r4*s2^2*s3*s4^3 - 2*b*r4*s2*s3^3*s4^2 + 2*b*r4*s2*s3^2*s4^3 +
    2*b*r4*s3^4*s4^2 - 2*b*r4*s3^3*s4^3)*y^3*z + (a^2*r2*s2^3*s3^2 -
    2*a^2*r2*s2^3*s3*s4 + a^2*r2*s2^3*s4^2 - a^2*r2*s2^2*s3^3 +
    a^2*r2*s2^2*s3^2*s4 + a^2*r2*s2^2*s3*s4^2 - a^2*r2*s2^2*s4^3 +
    a^2*r2*s2*s3^3*s4 - 2*a^2*r2*s2*s3^2*s4^2 + a^2*r2*s2*s3*s4^3 -
    a^2*r3*s2^3*s3^2 + a^2*r3*s2^3*s3*s4 + a^2*r3*s2^2*s3^3 + a^2*r3*s2^2*s3^2*s4
    - 2*a^2*r3*s2^2*s3*s4^2 - 2*a^2*r3*s2*s3^3*s4 + a^2*r3*s2*s3^2*s4^2 +
    a^2*r3*s2*s3*s4^3 + a^2*r3*s3^3*s4^2 - a^2*r3*s3^2*s4^3 + a^2*r4*s2^3*s3*s4 -
    a^2*r4*s2^3*s4^2 - 2*a^2*r4*s2^2*s3^2*s4 + a^2*r4*s2^2*s3*s4^2 +
    a^2*r4*s2^2*s4^3 + a^2*r4*s2*s3^3*s4 + a^2*r4*s2*s3^2*s4^2 -
    2*a^2*r4*s2*s3*s4^3 - a^2*r4*s3^3*s4^2 + a^2*r4*s3^2*s4^3 + a*b*r2*s2^2*s3^2 -
    2*a*b*r2*s2^2*s3*s4 + a*b*r2*s2^2*s4^2 - a*b*r2*s2*s3^3 + a*b*r2*s2*s3^2*s4 +
    a*b*r2*s2*s3*s4^2 - a*b*r2*s2*s4^3 + a*b*r2*s3^3*s4 - 2*a*b*r2*s3^2*s4^2 +
    a*b*r2*s3*s4^3 - a*b*r3*s2^3*s3 + a*b*r3*s2^3*s4 + a*b*r3*s2^2*s3^2 +
    a*b*r3*s2^2*s3*s4 - 2*a*b*r3*s2^2*s4^2 - 2*a*b*r3*s2*s3^2*s4 +
    a*b*r3*s2*s3*s4^2 + a*b*r3*s2*s4^3 + a*b*r3*s3^2*s4^2 - a*b*r3*s3*s4^3 +
    a*b*r4*s2^3*s3 - a*b*r4*s2^3*s4 - 2*a*b*r4*s2^2*s3^2 + a*b*r4*s2^2*s3*s4 +
    a*b*r4*s2^2*s4^2 + a*b*r4*s2*s3^3 + a*b*r4*s2*s3^2*s4 - 2*a*b*r4*s2*s3*s4^2 -
    a*b*r4*s3^3*s4 + a*b*r4*s3^2*s4^2 + a*r2*s2^3*s3^3 - a*r2*s2^3*s3^2*s4 -
    a*r2*s2^3*s3*s4^2 + a*r2*s2^3*s4^3 - a*r2*s2^2*s3^4 + a*r2*s2^2*s3^3*s4 +
    a*r2*s2^2*s3*s4^3 - a*r2*s2^2*s4^4 + a*r2*s3^4*s4^2 - 2*a*r2*s3^3*s4^3 +
    a*r2*s3^2*s4^4 - a*r3*s2^4*s3^2 + a*r3*s2^4*s4^2 + a*r3*s2^3*s3^3 +
    a*r3*s2^3*s3^2*s4 - 2*a*r3*s2^3*s4^3 - a*r3*s2^2*s3^3*s4 + a*r3*s2^2*s4^4 -
    a*r3*s2*s3^3*s4^2 + a*r3*s2*s3^2*s4^3 + a*r3*s3^3*s4^3 - a*r3*s3^2*s4^4 +
    a*r4*s2^4*s3^2 - a*r4*s2^4*s4^2 - 2*a*r4*s2^3*s3^3 + a*r4*s2^3*s3*s4^2 +
    a*r4*s2^3*s4^3 + a*r4*s2^2*s3^4 - a*r4*s2^2*s3*s4^3 + a*r4*s2*s3^3*s4^2 -
    a*r4*s2*s3^2*s4^3 - a*r4*s3^4*s4^2 + a*r4*s3^3*s4^3 + 4*b*r2*s2^3*s3^2 -
    8*b*r2*s2^3*s3*s4 + 4*b*r2*s2^3*s4^2 - 2*b*r2*s2^2*s3^3 + 2*b*r2*s2^2*s3^2*s4
    + 2*b*r2*s2^2*s3*s4^2 - 2*b*r2*s2^2*s4^3 - 2*b*r2*s2*s3^4 + 4*b*r2*s2*s3^3*s4
    - 4*b*r2*s2*s3^2*s4^2 + 4*b*r2*s2*s3*s4^3 - 2*b*r2*s2*s4^4 + 2*b*r2*s3^4*s4 -
    2*b*r2*s3^3*s4^2 - 2*b*r2*s3^2*s4^3 + 2*b*r2*s3*s4^4 - 2*b*r3*s2^4*s3 +
    2*b*r3*s2^4*s4 - 2*b*r3*s2^3*s3^2 + 4*b*r3*s2^3*s3*s4 - 2*b*r3*s2^3*s4^2 +
    4*b*r3*s2^2*s3^3 + 2*b*r3*s2^2*s3^2*s4 - 4*b*r3*s2^2*s3*s4^2 -
    2*b*r3*s2^2*s4^3 - 8*b*r3*s2*s3^3*s4 + 2*b*r3*s2*s3^2*s4^2 + 4*b*r3*s2*s3*s4^3
    + 2*b*r3*s2*s4^4 + 4*b*r3*s3^3*s4^2 - 2*b*r3*s3^2*s4^3 - 2*b*r3*s3*s4^4 +
    2*b*r4*s2^4*s3 - 2*b*r4*s2^4*s4 - 2*b*r4*s2^3*s3^2 + 4*b*r4*s2^3*s3*s4 -
    2*b*r4*s2^3*s4^2 - 2*b*r4*s2^2*s3^3 - 4*b*r4*s2^2*s3^2*s4 +
    2*b*r4*s2^2*s3*s4^2 + 4*b*r4*s2^2*s4^3 + 2*b*r4*s2*s3^4 + 4*b*r4*s2*s3^3*s4 +
    2*b*r4*s2*s3^2*s4^2 - 8*b*r4*s2*s3*s4^3 - 2*b*r4*s3^4*s4 - 2*b*r4*s3^3*s4^2 +
    4*b*r4*s3^2*s4^3 - 4*r2*s2^3*s3^3*s4 + 8*r2*s2^3*s3^2*s4^2 - 4*r2*s2^3*s3*s4^3
    + 4*r2*s2^2*s3^4*s4 - 4*r2*s2^2*s3^3*s4^2 - 4*r2*s2^2*s3^2*s4^3 +
    4*r2*s2^2*s3*s4^4 - 4*r2*s2*s3^4*s4^2 + 8*r2*s2*s3^3*s4^3 - 4*r2*s2*s3^2*s4^4
    + 4*r3*s2^4*s3^2*s4 - 4*r3*s2^4*s3*s4^2 - 4*r3*s2^3*s3^3*s4 -
    4*r3*s2^3*s3^2*s4^2 + 8*r3*s2^3*s3*s4^3 + 8*r3*s2^2*s3^3*s4^2 -
    4*r3*s2^2*s3^2*s4^3 - 4*r3*s2^2*s3*s4^4 - 4*r3*s2*s3^3*s4^3 +
    4*r3*s2*s3^2*s4^4 - 4*r4*s2^4*s3^2*s4 + 4*r4*s2^4*s3*s4^2 + 8*r4*s2^3*s3^3*s4
    - 4*r4*s2^3*s3^2*s4^2 - 4*r4*s2^3*s3*s4^3 - 4*r4*s2^2*s3^4*s4 -
    4*r4*s2^2*s3^3*s4^2 + 8*r4*s2^2*s3^2*s4^3 + 4*r4*s2*s3^4*s4^2 -
    4*r4*s2*s3^3*s4^3)*y^2*z^2 + (2*a*r2*s2^3*s3^2 - 4*a*r2*s2^3*s3*s4 +
    2*a*r2*s2^3*s4^2 - 2*a*r2*s2^2*s3^3 + 2*a*r2*s2^2*s3^2*s4 +
    2*a*r2*s2^2*s3*s4^2 - 2*a*r2*s2^2*s4^3 + 2*a*r2*s2*s3^3*s4 -
    4*a*r2*s2*s3^2*s4^2 + 2*a*r2*s2*s3*s4^3 - 2*a*r3*s2^3*s3^2 + 2*a*r3*s2^3*s3*s4
    + 2*a*r3*s2^2*s3^3 + 2*a*r3*s2^2*s3^2*s4 - 4*a*r3*s2^2*s3*s4^2 -
    4*a*r3*s2*s3^3*s4 + 2*a*r3*s2*s3^2*s4^2 + 2*a*r3*s2*s3*s4^3 + 2*a*r3*s3^3*s4^2
    - 2*a*r3*s3^2*s4^3 + 2*a*r4*s2^3*s3*s4 - 2*a*r4*s2^3*s4^2 -
    4*a*r4*s2^2*s3^2*s4 + 2*a*r4*s2^2*s3*s4^2 + 2*a*r4*s2^2*s4^3 +
    2*a*r4*s2*s3^3*s4 + 2*a*r4*s2*s3^2*s4^2 - 4*a*r4*s2*s3*s4^3 - 2*a*r4*s3^3*s4^2
    + 2*a*r4*s3^2*s4^3 - 2*b*r2*s2^2*s3^2 + 4*b*r2*s2^2*s3*s4 - 2*b*r2*s2^2*s4^2 +
    2*b*r2*s2*s3^3 - 2*b*r2*s2*s3^2*s4 - 2*b*r2*s2*s3*s4^2 + 2*b*r2*s2*s4^3 -
    2*b*r2*s3^3*s4 + 4*b*r2*s3^2*s4^2 - 2*b*r2*s3*s4^3 + 2*b*r3*s2^3*s3 -
    2*b*r3*s2^3*s4 - 2*b*r3*s2^2*s3^2 - 2*b*r3*s2^2*s3*s4 + 4*b*r3*s2^2*s4^2 +
    4*b*r3*s2*s3^2*s4 - 2*b*r3*s2*s3*s4^2 - 2*b*r3*s2*s4^3 - 2*b*r3*s3^2*s4^2 +
    2*b*r3*s3*s4^3 - 2*b*r4*s2^3*s3 + 2*b*r4*s2^3*s4 + 4*b*r4*s2^2*s3^2 -
    2*b*r4*s2^2*s3*s4 - 2*b*r4*s2^2*s4^2 - 2*b*r4*s2*s3^3 - 2*b*r4*s2*s3^2*s4 +
    4*b*r4*s2*s3*s4^2 + 2*b*r4*s3^3*s4 - 2*b*r4*s3^2*s4^2 + 2*r2*s2^3*s3^3 -
    2*r2*s2^3*s3^2*s4 - 2*r2*s2^3*s3*s4^2 + 2*r2*s2^3*s4^3 - 2*r2*s2^2*s3^4 +
    2*r2*s2^2*s3^3*s4 + 2*r2*s2^2*s3*s4^3 - 2*r2*s2^2*s4^4 + 2*r2*s3^4*s4^2 -
    4*r2*s3^3*s4^3 + 2*r2*s3^2*s4^4 - 2*r3*s2^4*s3^2 + 2*r3*s2^4*s4^2 +
    2*r3*s2^3*s3^3 + 2*r3*s2^3*s3^2*s4 - 4*r3*s2^3*s4^3 - 2*r3*s2^2*s3^3*s4 +
    2*r3*s2^2*s4^4 - 2*r3*s2*s3^3*s4^2 + 2*r3*s2*s3^2*s4^3 + 2*r3*s3^3*s4^3 -
    2*r3*s3^2*s4^4 + 2*r4*s2^4*s3^2 - 2*r4*s2^4*s4^2 - 4*r4*s2^3*s3^3 +
    2*r4*s2^3*s3*s4^2 + 2*r4*s2^3*s4^3 + 2*r4*s2^2*s3^4 - 2*r4*s2^2*s3*s4^3 +
    2*r4*s2*s3^3*s4^2 - 2*r4*s2*s3^2*s4^3 - 2*r4*s3^4*s4^2 + 2*r4*s3^3*s4^3)*y*z^3
    + (-a*r2*s2^2*s3^2 + 2*a*r2*s2^2*s3*s4 - a*r2*s2^2*s4^2 + a*r2*s2*s3^3 -
    a*r2*s2*s3^2*s4 - a*r2*s2*s3*s4^2 + a*r2*s2*s4^3 - a*r2*s3^3*s4 +
    2*a*r2*s3^2*s4^2 - a*r2*s3*s4^3 + a*r3*s2^3*s3 - a*r3*s2^3*s4 - a*r3*s2^2*s3^2
    - a*r3*s2^2*s3*s4 + 2*a*r3*s2^2*s4^2 + 2*a*r3*s2*s3^2*s4 - a*r3*s2*s3*s4^2 -
    a*r3*s2*s4^3 - a*r3*s3^2*s4^2 + a*r3*s3*s4^3 - a*r4*s2^3*s3 + a*r4*s2^3*s4 +
    2*a*r4*s2^2*s3^2 - a*r4*s2^2*s3*s4 - a*r4*s2^2*s4^2 - a*r4*s2*s3^3 -
    a*r4*s2*s3^2*s4 + 2*a*r4*s2*s3*s4^2 + a*r4*s3^3*s4 - a*r4*s3^2*s4^2 -
    r2*s2^2*s3^3 + r2*s2^2*s3^2*s4 + r2*s2^2*s3*s4^2 - r2*s2^2*s4^3 + r2*s2*s3^4 -
    2*r2*s2*s3^2*s4^2 + r2*s2*s4^4 - r2*s3^4*s4 + r2*s3^3*s4^2 + r2*s3^2*s4^3 -
    r2*s3*s4^4 + r3*s2^4*s3 - r3*s2^4*s4 - r3*s2^3*s3^2 + r3*s2^3*s4^2 +
    r3*s2^2*s3^2*s4 - 2*r3*s2^2*s3*s4^2 + r3*s2^2*s4^3 + r3*s2*s3^2*s4^2 -
    r3*s2*s4^4 - r3*s3^2*s4^3 + r3*s3*s4^4 - r4*s2^4*s3 + r4*s2^4*s4 +
    r4*s2^3*s3^2 - r4*s2^3*s4^2 + r4*s2^2*s3^3 - 2*r4*s2^2*s3^2*s4 +
    r4*s2^2*s3*s4^2 - r4*s2*s3^4 + r4*s2*s3^2*s4^2 + r4*s3^4*s4 -
    r4*s3^3*s4^2)*z^4;

discs := (s2 - s3)*(s2 - s4)*(s3 - s4);
c1 := r2*s3 - r2*s4 - r3*s2 + r3*s4 + r4*s2 - r4*s3;
c2 := a^2*r2^2*s2^2*s3^2 - 2*a^2*r2^2*s2^2*s3*s4 + a^2*r2^2*s2^2*s4^2 -
    2*a^2*r2*r3*s2^2*s3^2 + 2*a^2*r2*r3*s2^2*s3*s4 + 2*a^2*r2*r3*s2*s3^2*s4 -
    2*a^2*r2*r3*s2*s3*s4^2 + 2*a^2*r2*r4*s2^2*s3*s4 - 2*a^2*r2*r4*s2^2*s4^2 -
    2*a^2*r2*r4*s2*s3^2*s4 + 2*a^2*r2*r4*s2*s3*s4^2 + a^2*r3^2*s2^2*s3^2 -
    2*a^2*r3^2*s2*s3^2*s4 + a^2*r3^2*s3^2*s4^2 - 2*a^2*r3*r4*s2^2*s3*s4 +
    2*a^2*r3*r4*s2*s3^2*s4 + 2*a^2*r3*r4*s2*s3*s4^2 - 2*a^2*r3*r4*s3^2*s4^2 +
    a^2*r4^2*s2^2*s4^2 - 2*a^2*r4^2*s2*s3*s4^2 + a^2*r4^2*s3^2*s4^2 +
    2*a*b*r2^2*s2*s3^2 - 4*a*b*r2^2*s2*s3*s4 + 2*a*b*r2^2*s2*s4^2 -
    2*a*b*r2*r3*s2^2*s3 + 2*a*b*r2*r3*s2^2*s4 - 2*a*b*r2*r3*s2*s3^2 +
    4*a*b*r2*r3*s2*s3*s4 - 2*a*b*r2*r3*s2*s4^2 + 2*a*b*r2*r3*s3^2*s4 -
    2*a*b*r2*r3*s3*s4^2 + 2*a*b*r2*r4*s2^2*s3 - 2*a*b*r2*r4*s2^2*s4 -
    2*a*b*r2*r4*s2*s3^2 + 4*a*b*r2*r4*s2*s3*s4 - 2*a*b*r2*r4*s2*s4^2 -
    2*a*b*r2*r4*s3^2*s4 + 2*a*b*r2*r4*s3*s4^2 + 2*a*b*r3^2*s2^2*s3 -
    4*a*b*r3^2*s2*s3*s4 + 2*a*b*r3^2*s3*s4^2 - 2*a*b*r3*r4*s2^2*s3 -
    2*a*b*r3*r4*s2^2*s4 + 2*a*b*r3*r4*s2*s3^2 + 4*a*b*r3*r4*s2*s3*s4 +
    2*a*b*r3*r4*s2*s4^2 - 2*a*b*r3*r4*s3^2*s4 - 2*a*b*r3*r4*s3*s4^2 +
    2*a*b*r4^2*s2^2*s4 - 4*a*b*r4^2*s2*s3*s4 + 2*a*b*r4^2*s3^2*s4 +
    2*a*r2^2*s2^2*s3^3 - 2*a*r2^2*s2^2*s3^2*s4 - 2*a*r2^2*s2^2*s3*s4^2 +
    2*a*r2^2*s2^2*s4^3 - 2*a*r2^2*s2*s3^3*s4 + 4*a*r2^2*s2*s3^2*s4^2 -
    2*a*r2^2*s2*s3*s4^3 - 2*a*r2*r3*s2^3*s3^2 + 2*a*r2*r3*s2^3*s4^2 -
    2*a*r2*r3*s2^2*s3^3 + 8*a*r2*r3*s2^2*s3^2*s4 - 4*a*r2*r3*s2^2*s3*s4^2 -
    2*a*r2*r3*s2^2*s4^3 - 4*a*r2*r3*s2*s3^2*s4^2 + 4*a*r2*r3*s2*s3*s4^3 +
    2*a*r2*r3*s3^3*s4^2 - 2*a*r2*r3*s3^2*s4^3 + 2*a*r2*r4*s2^3*s3^2 -
    2*a*r2*r4*s2^3*s4^2 - 2*a*r2*r4*s2^2*s3^3 - 4*a*r2*r4*s2^2*s3^2*s4 +
    8*a*r2*r4*s2^2*s3*s4^2 - 2*a*r2*r4*s2^2*s4^3 + 4*a*r2*r4*s2*s3^3*s4 -
    4*a*r2*r4*s2*s3^2*s4^2 - 2*a*r2*r4*s3^3*s4^2 + 2*a*r2*r4*s3^2*s4^3 +
    2*a*r3^2*s2^3*s3^2 - 2*a*r3^2*s2^3*s3*s4 - 2*a*r3^2*s2^2*s3^2*s4 +
    4*a*r3^2*s2^2*s3*s4^2 - 2*a*r3^2*s2*s3^2*s4^2 - 2*a*r3^2*s2*s3*s4^3 +
    2*a*r3^2*s3^2*s4^3 - 2*a*r3*r4*s2^3*s3^2 + 4*a*r3*r4*s2^3*s3*s4 -
    2*a*r3*r4*s2^3*s4^2 + 2*a*r3*r4*s2^2*s3^3 - 4*a*r3*r4*s2^2*s3^2*s4 -
    4*a*r3*r4*s2^2*s3*s4^2 + 2*a*r3*r4*s2^2*s4^3 + 8*a*r3*r4*s2*s3^2*s4^2 -
    2*a*r3*r4*s3^3*s4^2 - 2*a*r3*r4*s3^2*s4^3 - 2*a*r4^2*s2^3*s3*s4 +
    2*a*r4^2*s2^3*s4^2 + 4*a*r4^2*s2^2*s3^2*s4 - 2*a*r4^2*s2^2*s3*s4^2 -
    2*a*r4^2*s2*s3^3*s4 - 2*a*r4^2*s2*s3^2*s4^2 + 2*a*r4^2*s3^3*s4^2 +
    b^2*r2^2*s3^2 - 2*b^2*r2^2*s3*s4 + b^2*r2^2*s4^2 - 2*b^2*r2*r3*s2*s3 +
    2*b^2*r2*r3*s2*s4 + 2*b^2*r2*r3*s3*s4 - 2*b^2*r2*r3*s4^2 + 2*b^2*r2*r4*s2*s3 -
    2*b^2*r2*r4*s2*s4 - 2*b^2*r2*r4*s3^2 + 2*b^2*r2*r4*s3*s4 + b^2*r3^2*s2^2 -
    2*b^2*r3^2*s2*s4 + b^2*r3^2*s4^2 - 2*b^2*r3*r4*s2^2 + 2*b^2*r3*r4*s2*s3 +
    2*b^2*r3*r4*s2*s4 - 2*b^2*r3*r4*s3*s4 + b^2*r4^2*s2^2 - 2*b^2*r4^2*s2*s3 +
    b^2*r4^2*s3^2 + 2*b*r2^2*s2*s3^3 - 2*b*r2^2*s2*s3^2*s4 - 2*b*r2^2*s2*s3*s4^2 +
    2*b*r2^2*s2*s4^3 - 2*b*r2^2*s3^3*s4 + 4*b*r2^2*s3^2*s4^2 - 2*b*r2^2*s3*s4^3 -
    4*b*r2*r3*s2^3*s3 + 4*b*r2*r3*s2^3*s4 + 4*b*r2*r3*s2^2*s3^2 -
    4*b*r2*r3*s2^2*s4^2 - 4*b*r2*r3*s2*s3^3 + 4*b*r2*r3*s2*s3*s4^2 +
    4*b*r2*r3*s3^3*s4 - 4*b*r2*r3*s3^2*s4^2 + 4*b*r2*r4*s2^3*s3 -
    4*b*r2*r4*s2^3*s4 - 4*b*r2*r4*s2^2*s3^2 + 4*b*r2*r4*s2^2*s4^2 +
    4*b*r2*r4*s2*s3^2*s4 - 4*b*r2*r4*s2*s4^3 - 4*b*r2*r4*s3^2*s4^2 +
    4*b*r2*r4*s3*s4^3 + 2*b*r3^2*s2^3*s3 - 2*b*r3^2*s2^3*s4 - 2*b*r3^2*s2^2*s3*s4
    + 4*b*r3^2*s2^2*s4^2 - 2*b*r3^2*s2*s3*s4^2 - 2*b*r3^2*s2*s4^3 +
    2*b*r3^2*s3*s4^3 - 4*b*r3*r4*s2^2*s3^2 + 4*b*r3*r4*s2^2*s3*s4 -
    4*b*r3*r4*s2^2*s4^2 + 4*b*r3*r4*s2*s3^3 + 4*b*r3*r4*s2*s4^3 -
    4*b*r3*r4*s3^3*s4 + 4*b*r3*r4*s3^2*s4^2 - 4*b*r3*r4*s3*s4^3 - 2*b*r4^2*s2^3*s3
    + 2*b*r4^2*s2^3*s4 + 4*b*r4^2*s2^2*s3^2 - 2*b*r4^2*s2^2*s3*s4 -
    2*b*r4^2*s2*s3^3 - 2*b*r4^2*s2*s3^2*s4 + 2*b*r4^2*s3^3*s4 + r2^2*s2^2*s3^4 -
    2*r2^2*s2^2*s3^2*s4^2 + r2^2*s2^2*s4^4 - 2*r2^2*s2*s3^4*s4 +
    2*r2^2*s2*s3^3*s4^2 + 2*r2^2*s2*s3^2*s4^3 - 2*r2^2*s2*s3*s4^4 + r2^2*s3^4*s4^2
    - 2*r2^2*s3^3*s4^3 + r2^2*s3^2*s4^4 - 2*r2*r3*s2^3*s3^3 + 2*r2*r3*s2^3*s3^2*s4
    - 2*r2*r3*s2^3*s3*s4^2 + 2*r2*r3*s2^3*s4^3 + 2*r2*r3*s2^2*s3^3*s4 +
    2*r2*r3*s2^2*s3^2*s4^2 - 2*r2*r3*s2^2*s3*s4^3 - 2*r2*r3*s2^2*s4^4 -
    2*r2*r3*s2*s3^3*s4^2 - 2*r2*r3*s2*s3^2*s4^3 + 4*r2*r3*s2*s3*s4^4 +
    2*r2*r3*s3^3*s4^3 - 2*r2*r3*s3^2*s4^4 + 2*r2*r4*s2^3*s3^3 -
    2*r2*r4*s2^3*s3^2*s4 + 2*r2*r4*s2^3*s3*s4^2 - 2*r2*r4*s2^3*s4^3 -
    2*r2*r4*s2^2*s3^4 - 2*r2*r4*s2^2*s3^3*s4 + 2*r2*r4*s2^2*s3^2*s4^2 +
    2*r2*r4*s2^2*s3*s4^3 + 4*r2*r4*s2*s3^4*s4 - 2*r2*r4*s2*s3^3*s4^2 -
    2*r2*r4*s2*s3^2*s4^3 - 2*r2*r4*s3^4*s4^2 + 2*r2*r4*s3^3*s4^3 + r3^2*s2^4*s3^2
    - 2*r3^2*s2^4*s3*s4 + r3^2*s2^4*s4^2 + 2*r3^2*s2^3*s3*s4^2 - 2*r3^2*s2^3*s4^3
    - 2*r3^2*s2^2*s3^2*s4^2 + 2*r3^2*s2^2*s3*s4^3 + r3^2*s2^2*s4^4 -
    2*r3^2*s2*s3*s4^4 + r3^2*s3^2*s4^4 - 2*r3*r4*s2^4*s3^2 + 4*r3*r4*s2^4*s3*s4 -
    2*r3*r4*s2^4*s4^2 + 2*r3*r4*s2^3*s3^3 - 2*r3*r4*s2^3*s3^2*s4 -
    2*r3*r4*s2^3*s3*s4^2 + 2*r3*r4*s2^3*s4^3 - 2*r3*r4*s2^2*s3^3*s4 +
    2*r3*r4*s2^2*s3^2*s4^2 - 2*r3*r4*s2^2*s3*s4^3 + 2*r3*r4*s2*s3^3*s4^2 +
    2*r3*r4*s2*s3^2*s4^3 - 2*r3*r4*s3^3*s4^3 + r4^2*s2^4*s3^2 - 2*r4^2*s2^4*s3*s4
    + r4^2*s2^4*s4^2 - 2*r4^2*s2^3*s3^3 + 2*r4^2*s2^3*s3^2*s4 + r4^2*s2^2*s3^4 +
    2*r4^2*s2^2*s3^3*s4 - 2*r4^2*s2^2*s3^2*s4^2 - 2*r4^2*s2*s3^4*s4 +
    r4^2*s3^4*s4^2;
c := -discs*c1*c2;

F3 := Evaluate(F3, [x,z,y]);
return F3, c;

end function;


function GluingFormulaRs(rs, invss, ab);

assert #rs eq 3;
assert #invss eq 5;
assert #ab eq 2;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

r2, r3, r4 := Explode(rs);
a1s, a3s, b1s, b2s, b3s := Explode(invss);
a, b := Explode(ab);

F3 := ((r2^2*r3 - r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b1s^2*b2s + (-r2^2*r3
    + r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b1s*b2s^2 + (-r2^2*r3 +
    r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b1s^2*b3s + (r2^2*r3 -
    r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b2s^2*b3s + (r2^2*r3 -
    r2^2*r4 - r2*r3^2 + r2*r4^2 + r3^2*r4 - r3*r4^2)*b1s*b3s^2 + (-r2^2*r3 +
    r2^2*r4 + r2*r3^2 - r2*r4^2 - r3^2*r4 + r3*r4^2)*b2s*b3s^2)*x^4 +
-((-1/4*r3^2 + 1/2*r3*r4 - 1/4*r4^2)*a1s^3*a3s*b1s^2 + (1/2*r2*r3 - 1/2*r2*r4 -
    1/2*r3*r4 + 1/2*r4^2)*a1s^3*a3s*b1s*b2s + (-r2*r3 + r2*r4 + r3^2 -
    r3*r4)*a1s*a3s*b1s^2*b2s + (1/4*r3^2 - 1/2*r3*r4 + 1/4*r4^2)*a1s^2*b1s^3*b2s +
    (-1/4*r2^2 + 1/2*r2*r4 - 1/4*r4^2)*a1s^3*a3s*b2s^2 + (r2^2 - r2*r3 - r2*r4 +
    r3*r4)*a1s*a3s*b1s*b2s^2 + (-1/2*r2*r3 + 1/2*r2*r4 + 1/2*r3*r4 -
    1/2*r4^2)*a1s^2*b1s^2*b2s^2 + (r2*r3 - r2*r4 - r3^2 + r3*r4)*b1s^3*b2s^2 +
    (1/4*r2^2 - 1/2*r2*r4 + 1/4*r4^2)*a1s^2*b1s*b2s^3 + (-r2^2 + r2*r3 + r2*r4 -
    r3*r4)*b1s^2*b2s^3 + (-1/2*r2*r3 + 1/2*r2*r4 + 1/2*r3^2 -
    1/2*r3*r4)*a1s^3*a3s*b1s*b3s + (r2*r3 - r2*r4 - r3*r4 +
    r4^2)*a1s*a3s*b1s^2*b3s + (1/4*r3^2 - 1/2*r3*r4 + 1/4*r4^2)*a1s^2*b1s^3*b3s +
    (1/2*r2^2 - 1/2*r2*r3 - 1/2*r2*r4 + 1/2*r3*r4)*a1s^3*a3s*b2s*b3s + (-2*r2^2 +
    2*r2*r3 + 2*r2*r4 - 2*r3^2 + 2*r3*r4 - 2*r4^2)*a1s*a3s*b1s*b2s*b3s +
    (-1/4*r3^2 + 1/2*r3*r4 - 1/4*r4^2)*a1s^2*b1s^2*b2s*b3s + (r2*r3 - r2*r4 -
    r3*r4 + r4^2)*a1s*a3s*b2s^2*b3s + (-1/4*r2^2 + 1/2*r2*r4 -
    1/4*r4^2)*a1s^2*b1s*b2s^2*b3s + (r2^2 - 2*r2*r3 + r3^2)*b1s^2*b2s^2*b3s +
    (1/4*r2^2 - 1/2*r2*r4 + 1/4*r4^2)*a1s^2*b2s^3*b3s + (-1/4*r2^2 + 1/2*r2*r3 -
    1/4*r3^2)*a1s^3*a3s*b3s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a1s*a3s*b1s*b3s^2 +
    (1/2*r2*r3 - 1/2*r2*r4 - 1/2*r3^2 + 1/2*r3*r4)*a1s^2*b1s^2*b3s^2 + (-r2*r3 +
    r2*r4 + r3*r4 - r4^2)*b1s^3*b3s^2 + (-r2*r3 + r2*r4 + r3^2 -
    r3*r4)*a1s*a3s*b2s*b3s^2 + (-1/4*r2^2 + 1/2*r2*r3 -
    1/4*r3^2)*a1s^2*b1s*b2s*b3s^2 + (r2^2 - 2*r2*r4 + r4^2)*b1s^2*b2s*b3s^2 +
    (-1/2*r2^2 + 1/2*r2*r3 + 1/2*r2*r4 - 1/2*r3*r4)*a1s^2*b2s^2*b3s^2 + (r3^2 -
    2*r3*r4 + r4^2)*b1s*b2s^2*b3s^2 + (-r2*r3 + r2*r4 + r3*r4 - r4^2)*b2s^3*b3s^2
    + (1/4*r2^2 - 1/2*r2*r3 + 1/4*r3^2)*a1s^2*b1s*b3s^3 + (-r2^2 + r2*r3 + r2*r4 -
    r3*r4)*b1s^2*b3s^3 + (1/4*r2^2 - 1/2*r2*r3 + 1/4*r3^2)*a1s^2*b2s*b3s^3 +
    (r2*r3 - r2*r4 - r3^2 + r3*r4)*b2s^2*b3s^3 + (1/2*a*r3^2 - a*r3*r4 +
    1/2*a*r4^2)*a1s^2*a3s*b1s^2 + (-a*r2*r3 + a*r2*r4 + a*r3*r4 -
    a*r4^2)*a1s^2*a3s*b1s*b2s + (a*r2*r3 - a*r2*r4 - a*r3^2 +
    a*r3*r4)*a3s*b1s^2*b2s + (-1/2*a*r3^2 + a*r3*r4 - 1/2*a*r4^2)*a1s*b1s^3*b2s +
    (1/2*a*r2^2 - a*r2*r4 + 1/2*a*r4^2)*a1s^2*a3s*b2s^2 + (-a*r2^2 + a*r2*r3 +
    a*r2*r4 - a*r3*r4)*a3s*b1s*b2s^2 + (a*r2*r3 - a*r2*r4 - a*r3*r4 +
    a*r4^2)*a1s*b1s^2*b2s^2 + (-1/2*a*r2^2 + a*r2*r4 - 1/2*a*r4^2)*a1s*b1s*b2s^3 +
    (a*r2*r3 - a*r2*r4 - a*r3^2 + a*r3*r4)*a1s^2*a3s*b1s*b3s + (-a*r2*r3 + a*r2*r4
    + a*r3*r4 - a*r4^2)*a3s*b1s^2*b3s + (-1/2*a*r3^2 + a*r3*r4 -
    1/2*a*r4^2)*a1s*b1s^3*b3s + (-a*r2^2 + a*r2*r3 + a*r2*r4 -
    a*r3*r4)*a1s^2*a3s*b2s*b3s + (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4 + 2*a*r4^2)*a3s*b1s*b2s*b3s + (1/2*a*r3^2 - a*r3*r4 +
    1/2*a*r4^2)*a1s*b1s^2*b2s*b3s + (-a*r2*r3 + a*r2*r4 + a*r3*r4 -
    a*r4^2)*a3s*b2s^2*b3s + (1/2*a*r2^2 - a*r2*r4 + 1/2*a*r4^2)*a1s*b1s*b2s^2*b3s
    + (-1/2*a*r2^2 + a*r2*r4 - 1/2*a*r4^2)*a1s*b2s^3*b3s + (1/2*a*r2^2 - a*r2*r3 +
    1/2*a*r3^2)*a1s^2*a3s*b3s^2 + (-a*r2^2 + a*r2*r3 + a*r2*r4 -
    a*r3*r4)*a3s*b1s*b3s^2 + (-a*r2*r3 + a*r2*r4 + a*r3^2 -
    a*r3*r4)*a1s*b1s^2*b3s^2 + (a*r2*r3 - a*r2*r4 - a*r3^2 +
    a*r3*r4)*a3s*b2s*b3s^2 + (1/2*a*r2^2 - a*r2*r3 + 1/2*a*r3^2)*a1s*b1s*b2s*b3s^2
    + (a*r2^2 - a*r2*r3 - a*r2*r4 + a*r3*r4)*a1s*b2s^2*b3s^2 + (-1/2*a*r2^2 +
    a*r2*r3 - 1/2*a*r3^2)*a1s*b1s*b3s^3 + (-1/2*a*r2^2 + a*r2*r3 -
    1/2*a*r3^2)*a1s*b2s*b3s^3 + (-b*r3^2 + 2*b*r3*r4 - b*r4^2)*a1s*a3s*b1s^2 +
    (2*b*r2*r3 - 2*b*r2*r4 - 2*b*r3*r4 + 2*b*r4^2)*a1s*a3s*b1s*b2s + (-2*b*r2*r3 +
    2*b*r2*r4 + 2*b*r3^2 - 2*b*r3*r4)*b1s^3*b2s + (-b*r2^2 + 2*b*r2*r4 -
    b*r4^2)*a1s*a3s*b2s^2 + (2*b*r2^2 - 2*b*r2*r3 - 2*b*r2*r4 +
    2*b*r3*r4)*b1s*b2s^3 + (-2*b*r2*r3 + 2*b*r2*r4 + 2*b*r3^2 -
    2*b*r3*r4)*a1s*a3s*b1s*b3s + (2*b*r2*r3 - 2*b*r2*r4 - 2*b*r3*r4 +
    2*b*r4^2)*b1s^3*b3s + (2*b*r2^2 - 2*b*r2*r3 - 2*b*r2*r4 +
    2*b*r3*r4)*a1s*a3s*b2s*b3s + (-2*b*r3^2 + 4*b*r3*r4 - 2*b*r4^2)*b1s^2*b2s*b3s
    + (-2*b*r2^2 + 4*b*r2*r4 - 2*b*r4^2)*b1s*b2s^2*b3s + (2*b*r2*r3 - 2*b*r2*r4 -
    2*b*r3*r4 + 2*b*r4^2)*b2s^3*b3s + (-b*r2^2 + 2*b*r2*r3 - b*r3^2)*a1s*a3s*b3s^2
    + (-2*b*r2^2 + 4*b*r2*r3 - 2*b*r3^2)*b1s*b2s*b3s^2 + (2*b*r2^2 - 2*b*r2*r3 -
    2*b*r2*r4 + 2*b*r3*r4)*b1s*b3s^3 + (-2*b*r2*r3 + 2*b*r2*r4 + 2*b*r3^2 -
    2*b*r3*r4)*b2s*b3s^3)*x^2*y^2 +
-((-r3^2 + 2*r3*r4 - r4^2)*a1s^2*a3s*b1s^2 + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 +
    2*r4^2)*a1s^2*a3s*b1s*b2s + (-2*r2*r3 + 2*r2*r4 + 2*r3^2 -
    2*r3*r4)*a3s*b1s^2*b2s + (r3^2 - 2*r3*r4 + r4^2)*a1s*b1s^3*b2s + (-r2^2 +
    2*r2*r4 - r4^2)*a1s^2*a3s*b2s^2 + (2*r2^2 - 2*r2*r3 - 2*r2*r4 +
    2*r3*r4)*a3s*b1s*b2s^2 + (-2*r2*r3 + 2*r2*r4 + 2*r3*r4 -
    2*r4^2)*a1s*b1s^2*b2s^2 + (r2^2 - 2*r2*r4 + r4^2)*a1s*b1s*b2s^3 + (-2*r2*r3 +
    2*r2*r4 + 2*r3^2 - 2*r3*r4)*a1s^2*a3s*b1s*b3s + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 +
    2*r4^2)*a3s*b1s^2*b3s + (r3^2 - 2*r3*r4 + r4^2)*a1s*b1s^3*b3s + (2*r2^2 -
    2*r2*r3 - 2*r2*r4 + 2*r3*r4)*a1s^2*a3s*b2s*b3s + (-4*r2^2 + 4*r2*r3 + 4*r2*r4
    - 4*r3^2 + 4*r3*r4 - 4*r4^2)*a3s*b1s*b2s*b3s + (-r3^2 + 2*r3*r4 -
    r4^2)*a1s*b1s^2*b2s*b3s + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 + 2*r4^2)*a3s*b2s^2*b3s
    + (-r2^2 + 2*r2*r4 - r4^2)*a1s*b1s*b2s^2*b3s + (r2^2 - 2*r2*r4 +
    r4^2)*a1s*b2s^3*b3s + (-r2^2 + 2*r2*r3 - r3^2)*a1s^2*a3s*b3s^2 + (2*r2^2 -
    2*r2*r3 - 2*r2*r4 + 2*r3*r4)*a3s*b1s*b3s^2 + (2*r2*r3 - 2*r2*r4 - 2*r3^2 +
    2*r3*r4)*a1s*b1s^2*b3s^2 + (-2*r2*r3 + 2*r2*r4 + 2*r3^2 -
    2*r3*r4)*a3s*b2s*b3s^2 + (-r2^2 + 2*r2*r3 - r3^2)*a1s*b1s*b2s*b3s^2 + (-2*r2^2
    + 2*r2*r3 + 2*r2*r4 - 2*r3*r4)*a1s*b2s^2*b3s^2 + (r2^2 - 2*r2*r3 +
    r3^2)*a1s*b1s*b3s^3 + (r2^2 - 2*r2*r3 + r3^2)*a1s*b2s*b3s^3 + (2*a*r3^2 -
    4*a*r3*r4 + 2*a*r4^2)*a1s*a3s*b1s^2 + (-4*a*r2*r3 + 4*a*r2*r4 + 4*a*r3*r4 -
    4*a*r4^2)*a1s*a3s*b1s*b2s + (-2*a*r3^2 + 4*a*r3*r4 - 2*a*r4^2)*b1s^3*b2s +
    (2*a*r2^2 - 4*a*r2*r4 + 2*a*r4^2)*a1s*a3s*b2s^2 + (-2*a*r2^2 + 8*a*r2*r3 -
    4*a*r2*r4 - 2*a*r3^2 - 4*a*r3*r4 + 4*a*r4^2)*b1s^2*b2s^2 + (-2*a*r2^2 +
    4*a*r2*r4 - 2*a*r4^2)*b1s*b2s^3 + (4*a*r2*r3 - 4*a*r2*r4 - 4*a*r3^2 +
    4*a*r3*r4)*a1s*a3s*b1s*b3s + (-2*a*r3^2 + 4*a*r3*r4 - 2*a*r4^2)*b1s^3*b3s +
    (-4*a*r2^2 + 4*a*r2*r3 + 4*a*r2*r4 - 4*a*r3*r4)*a1s*a3s*b2s*b3s + (4*a*r2^2 -
    4*a*r2*r3 - 4*a*r2*r4 + 2*a*r3^2 + 2*a*r4^2)*b1s^2*b2s*b3s + (2*a*r2^2 -
    4*a*r2*r3 + 4*a*r3^2 - 4*a*r3*r4 + 2*a*r4^2)*b1s*b2s^2*b3s + (-2*a*r2^2 +
    4*a*r2*r4 - 2*a*r4^2)*b2s^3*b3s + (2*a*r2^2 - 4*a*r2*r3 +
    2*a*r3^2)*a1s*a3s*b3s^2 + (-2*a*r2^2 - 4*a*r2*r3 + 8*a*r2*r4 + 4*a*r3^2 -
    4*a*r3*r4 - 2*a*r4^2)*b1s^2*b3s^2 + (2*a*r2^2 - 4*a*r2*r4 + 2*a*r3^2 -
    4*a*r3*r4 + 4*a*r4^2)*b1s*b2s*b3s^2 + (4*a*r2^2 - 4*a*r2*r3 - 4*a*r2*r4 -
    2*a*r3^2 + 8*a*r3*r4 - 2*a*r4^2)*b2s^2*b3s^2 + (-2*a*r2^2 + 4*a*r2*r3 -
    2*a*r3^2)*b1s*b3s^3 + (-2*a*r2^2 + 4*a*r2*r3 - 2*a*r3^2)*b2s*b3s^3 +
    (-4*b*r3^2 + 8*b*r3*r4 - 4*b*r4^2)*a3s*b1s^2 + (8*b*r2*r3 - 8*b*r2*r4 -
    8*b*r3*r4 + 8*b*r4^2)*a3s*b1s*b2s + (-2*b*r2*r3 + 2*b*r2*r4 + 2*b*r3^2 -
    2*b*r3*r4)*a1s*b1s^2*b2s + (-4*b*r2^2 + 8*b*r2*r4 - 4*b*r4^2)*a3s*b2s^2 +
    (2*b*r2^2 - 2*b*r2*r3 - 2*b*r2*r4 + 2*b*r3*r4)*a1s*b1s*b2s^2 + (-8*b*r2*r3 +
    8*b*r2*r4 + 8*b*r3^2 - 8*b*r3*r4)*a3s*b1s*b3s + (2*b*r2*r3 - 2*b*r2*r4 -
    2*b*r3*r4 + 2*b*r4^2)*a1s*b1s^2*b3s + (8*b*r2^2 - 8*b*r2*r3 - 8*b*r2*r4 +
    8*b*r3*r4)*a3s*b2s*b3s + (-4*b*r2^2 + 4*b*r2*r3 + 4*b*r2*r4 - 4*b*r3^2 +
    4*b*r3*r4 - 4*b*r4^2)*a1s*b1s*b2s*b3s + (2*b*r2*r3 - 2*b*r2*r4 - 2*b*r3*r4 +
    2*b*r4^2)*a1s*b2s^2*b3s + (-4*b*r2^2 + 8*b*r2*r3 - 4*b*r3^2)*a3s*b3s^2 +
    (2*b*r2^2 - 2*b*r2*r3 - 2*b*r2*r4 + 2*b*r3*r4)*a1s*b1s*b3s^2 + (-2*b*r2*r3 +
    2*b*r2*r4 + 2*b*r3^2 - 2*b*r3*r4)*a1s*b2s*b3s^2)*x^2*y*z +
-((-r3^2 + 2*r3*r4 - r4^2)*a1s*a3s*b1s^2 + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 +
    2*r4^2)*a1s*a3s*b1s*b2s + (-2*r2*r3 + 2*r2*r4 + 2*r3^2 - 2*r3*r4)*b1s^3*b2s +
    (-r2^2 + 2*r2*r4 - r4^2)*a1s*a3s*b2s^2 + (2*r2^2 - 2*r2*r3 - 2*r2*r4 +
    2*r3*r4)*b1s*b2s^3 + (-2*r2*r3 + 2*r2*r4 + 2*r3^2 - 2*r3*r4)*a1s*a3s*b1s*b3s +
    (2*r2*r3 - 2*r2*r4 - 2*r3*r4 + 2*r4^2)*b1s^3*b3s + (2*r2^2 - 2*r2*r3 - 2*r2*r4
    + 2*r3*r4)*a1s*a3s*b2s*b3s + (-2*r3^2 + 4*r3*r4 - 2*r4^2)*b1s^2*b2s*b3s +
    (-2*r2^2 + 4*r2*r4 - 2*r4^2)*b1s*b2s^2*b3s + (2*r2*r3 - 2*r2*r4 - 2*r3*r4 +
    2*r4^2)*b2s^3*b3s + (-r2^2 + 2*r2*r3 - r3^2)*a1s*a3s*b3s^2 + (-2*r2^2 +
    4*r2*r3 - 2*r3^2)*b1s*b2s*b3s^2 + (2*r2^2 - 2*r2*r3 - 2*r2*r4 +
    2*r3*r4)*b1s*b3s^3 + (-2*r2*r3 + 2*r2*r4 + 2*r3^2 - 2*r3*r4)*b2s*b3s^3 +
    (2*a*r3^2 - 4*a*r3*r4 + 2*a*r4^2)*a3s*b1s^2 + (-4*a*r2*r3 + 4*a*r2*r4 +
    4*a*r3*r4 - 4*a*r4^2)*a3s*b1s*b2s + (a*r2*r3 - a*r2*r4 - a*r3^2 +
    a*r3*r4)*a1s*b1s^2*b2s + (2*a*r2^2 - 4*a*r2*r4 + 2*a*r4^2)*a3s*b2s^2 +
    (-a*r2^2 + a*r2*r3 + a*r2*r4 - a*r3*r4)*a1s*b1s*b2s^2 + (4*a*r2*r3 - 4*a*r2*r4
    - 4*a*r3^2 + 4*a*r3*r4)*a3s*b1s*b3s + (-a*r2*r3 + a*r2*r4 + a*r3*r4 -
    a*r4^2)*a1s*b1s^2*b3s + (-4*a*r2^2 + 4*a*r2*r3 + 4*a*r2*r4 -
    4*a*r3*r4)*a3s*b2s*b3s + (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4 + 2*a*r4^2)*a1s*b1s*b2s*b3s + (-a*r2*r3 + a*r2*r4 + a*r3*r4 -
    a*r4^2)*a1s*b2s^2*b3s + (2*a*r2^2 - 4*a*r2*r3 + 2*a*r3^2)*a3s*b3s^2 + (-a*r2^2
    + a*r2*r3 + a*r2*r4 - a*r3*r4)*a1s*b1s*b3s^2 + (a*r2*r3 - a*r2*r4 - a*r3^2 +
    a*r3*r4)*a1s*b2s*b3s^2 + (b*r3^2 - 2*b*r3*r4 + b*r4^2)*a1s^2*b1s^2 +
    (-4*b*r3^2 + 8*b*r3*r4 - 4*b*r4^2)*b1s^3 + (-2*b*r2*r3 + 2*b*r2*r4 + 2*b*r3*r4
    - 2*b*r4^2)*a1s^2*b1s*b2s + (4*b*r2*r3 - 4*b*r2*r4 - 4*b*r3*r4 +
    4*b*r4^2)*b1s^2*b2s + (b*r2^2 - 2*b*r2*r4 + b*r4^2)*a1s^2*b2s^2 + (4*b*r2*r3 -
    4*b*r2*r4 - 4*b*r3*r4 + 4*b*r4^2)*b1s*b2s^2 + (-4*b*r2^2 + 8*b*r2*r4 -
    4*b*r4^2)*b2s^3 + (2*b*r2*r3 - 2*b*r2*r4 - 2*b*r3^2 + 2*b*r3*r4)*a1s^2*b1s*b3s
    + (-4*b*r2*r3 + 4*b*r2*r4 + 4*b*r3^2 - 4*b*r3*r4)*b1s^2*b3s + (-2*b*r2^2 +
    2*b*r2*r3 + 2*b*r2*r4 - 2*b*r3*r4)*a1s^2*b2s*b3s + (4*b*r2^2 - 4*b*r2*r3 -
    4*b*r2*r4 + 4*b*r3*r4)*b2s^2*b3s + (b*r2^2 - 2*b*r2*r3 + b*r3^2)*a1s^2*b3s^2 +
    (-4*b*r2*r3 + 4*b*r2*r4 + 4*b*r3^2 - 4*b*r3*r4)*b1s*b3s^2 + (4*b*r2^2 -
    4*b*r2*r3 - 4*b*r2*r4 + 4*b*r3*r4)*b2s*b3s^2 + (-4*b*r2^2 + 8*b*r2*r3 -
    4*b*r3^2)*b3s^3)*x^2*z^2 +
((1/4*a^2*r3 - 1/4*a^2*r4)*a1s*a3s*b1s^3*b2s + (-1/4*a^2*r2 - 1/4*a^2*r3 +
    1/2*a^2*r4)*a1s*a3s*b1s^2*b2s^2 + (-1/4*a^2*r3 + 1/4*a^2*r4)*b1s^4*b2s^2 +
    (1/4*a^2*r2 - 1/4*a^2*r4)*a1s*a3s*b1s*b2s^3 + (1/4*a^2*r2 + 1/4*a^2*r3 -
    1/2*a^2*r4)*b1s^3*b2s^3 + (-1/4*a^2*r2 + 1/4*a^2*r4)*b1s^2*b2s^4 +
    (-1/4*a^2*r3 + 1/4*a^2*r4)*a1s*a3s*b1s^3*b3s + (1/2*a^2*r2 - 1/4*a^2*r3 -
    1/4*a^2*r4)*a1s*a3s*b1s^2*b2s*b3s + (-1/4*a^2*r2 + 1/2*a^2*r3 -
    1/4*a^2*r4)*a1s*a3s*b1s*b2s^2*b3s + (-1/4*a^2*r2 + 1/4*a^2*r3)*b1s^3*b2s^2*b3s
    + (-1/4*a^2*r2 + 1/4*a^2*r4)*a1s*a3s*b2s^3*b3s + (1/4*a^2*r2 -
    1/4*a^2*r3)*b1s^2*b2s^3*b3s + (-1/4*a^2*r2 + 1/2*a^2*r3 -
    1/4*a^2*r4)*a1s*a3s*b1s^2*b3s^2 + (1/4*a^2*r3 - 1/4*a^2*r4)*b1s^4*b3s^2 +
    (-1/4*a^2*r2 - 1/4*a^2*r3 + 1/2*a^2*r4)*a1s*a3s*b1s*b2s*b3s^2 + (-1/4*a^2*r2 +
    1/4*a^2*r4)*b1s^3*b2s*b3s^2 + (1/2*a^2*r2 - 1/4*a^2*r3 -
    1/4*a^2*r4)*a1s*a3s*b2s^2*b3s^2 + (-1/4*a^2*r3 + 1/4*a^2*r4)*b1s*b2s^3*b3s^2 +
    (1/4*a^2*r2 - 1/4*a^2*r4)*b2s^4*b3s^2 + (1/4*a^2*r2 -
    1/4*a^2*r3)*a1s*a3s*b1s*b3s^3 + (1/4*a^2*r2 - 1/2*a^2*r3 +
    1/4*a^2*r4)*b1s^3*b3s^3 + (-1/4*a^2*r2 + 1/4*a^2*r3)*a1s*a3s*b2s*b3s^3 +
    (1/4*a^2*r2 - 1/4*a^2*r4)*b1s^2*b2s*b3s^3 + (1/4*a^2*r3 -
    1/4*a^2*r4)*b1s*b2s^2*b3s^3 + (-1/2*a^2*r2 + 1/4*a^2*r3 +
    1/4*a^2*r4)*b2s^3*b3s^3 + (-1/4*a^2*r2 + 1/4*a^2*r3)*b1s^2*b3s^4 + (1/4*a^2*r2
    - 1/4*a^2*r3)*b2s^2*b3s^4 + (-a*b*r3 + a*b*r4)*a3s*b1s^3*b2s + (a*b*r2 +
    a*b*r3 - 2*a*b*r4)*a3s*b1s^2*b2s^2 + (-a*b*r2 + a*b*r4)*a3s*b1s*b2s^3 +
    (a*b*r3 - a*b*r4)*a3s*b1s^3*b3s + (-2*a*b*r2 + a*b*r3 +
    a*b*r4)*a3s*b1s^2*b2s*b3s + (a*b*r2 - 2*a*b*r3 + a*b*r4)*a3s*b1s*b2s^2*b3s +
    (a*b*r2 - a*b*r4)*a3s*b2s^3*b3s + (a*b*r2 - 2*a*b*r3 + a*b*r4)*a3s*b1s^2*b3s^2
    + (a*b*r2 + a*b*r3 - 2*a*b*r4)*a3s*b1s*b2s*b3s^2 + (-2*a*b*r2 + a*b*r3 +
    a*b*r4)*a3s*b2s^2*b3s^2 + (-a*b*r2 + a*b*r3)*a3s*b1s*b3s^3 + (a*b*r2 -
    a*b*r3)*a3s*b2s*b3s^3 + (b^2*r3 - b^2*r4)*b1s^4*b2s + (-b^2*r3 +
    b^2*r4)*b1s^3*b2s^2 + (-b^2*r2 + b^2*r4)*b1s^2*b2s^3 + (b^2*r2 -
    b^2*r4)*b1s*b2s^4 + (-b^2*r3 + b^2*r4)*b1s^4*b3s + (b^2*r2 + b^2*r3 -
    2*b^2*r4)*b1s^2*b2s^2*b3s + (-b^2*r2 + b^2*r4)*b2s^4*b3s + (b^2*r3 -
    b^2*r4)*b1s^3*b3s^2 + (b^2*r2 - 2*b^2*r3 + b^2*r4)*b1s^2*b2s*b3s^2 +
    (-2*b^2*r2 + b^2*r3 + b^2*r4)*b1s*b2s^2*b3s^2 + (b^2*r2 - b^2*r4)*b2s^3*b3s^2
    + (-b^2*r2 + b^2*r3)*b1s^2*b3s^3 + (b^2*r2 - b^2*r3)*b2s^2*b3s^3 + (b^2*r2 -
    b^2*r3)*b1s*b3s^4 + (-b^2*r2 + b^2*r3)*b2s*b3s^4)*y^4 +
((a*r3 - a*r4)*a1s*a3s*b1s^3*b2s + (-a*r2 - a*r3 + 2*a*r4)*a1s*a3s*b1s^2*b2s^2 +
    (-a*r3 + a*r4)*b1s^4*b2s^2 + (a*r2 - a*r4)*a1s*a3s*b1s*b2s^3 + (a*r2 + a*r3 -
    2*a*r4)*b1s^3*b2s^3 + (-a*r2 + a*r4)*b1s^2*b2s^4 + (-a*r3 +
    a*r4)*a1s*a3s*b1s^3*b3s + (2*a*r2 - a*r3 - a*r4)*a1s*a3s*b1s^2*b2s*b3s +
    (-a*r2 + 2*a*r3 - a*r4)*a1s*a3s*b1s*b2s^2*b3s + (-a*r2 + a*r3)*b1s^3*b2s^2*b3s
    + (-a*r2 + a*r4)*a1s*a3s*b2s^3*b3s + (a*r2 - a*r3)*b1s^2*b2s^3*b3s + (-a*r2 +
    2*a*r3 - a*r4)*a1s*a3s*b1s^2*b3s^2 + (a*r3 - a*r4)*b1s^4*b3s^2 + (-a*r2 - a*r3
    + 2*a*r4)*a1s*a3s*b1s*b2s*b3s^2 + (-a*r2 + a*r4)*b1s^3*b2s*b3s^2 + (2*a*r2 -
    a*r3 - a*r4)*a1s*a3s*b2s^2*b3s^2 + (-a*r3 + a*r4)*b1s*b2s^3*b3s^2 + (a*r2 -
    a*r4)*b2s^4*b3s^2 + (a*r2 - a*r3)*a1s*a3s*b1s*b3s^3 + (a*r2 - 2*a*r3 +
    a*r4)*b1s^3*b3s^3 + (-a*r2 + a*r3)*a1s*a3s*b2s*b3s^3 + (a*r2 -
    a*r4)*b1s^2*b2s*b3s^3 + (a*r3 - a*r4)*b1s*b2s^2*b3s^3 + (-2*a*r2 + a*r3 +
    a*r4)*b2s^3*b3s^3 + (-a*r2 + a*r3)*b1s^2*b3s^4 + (a*r2 - a*r3)*b2s^2*b3s^4 +
    (-2*b*r3 + 2*b*r4)*a3s*b1s^3*b2s + (2*b*r2 + 2*b*r3 - 4*b*r4)*a3s*b1s^2*b2s^2
    + (-2*b*r2 + 2*b*r4)*a3s*b1s*b2s^3 + (2*b*r3 - 2*b*r4)*a3s*b1s^3*b3s +
    (-4*b*r2 + 2*b*r3 + 2*b*r4)*a3s*b1s^2*b2s*b3s + (2*b*r2 - 4*b*r3 +
    2*b*r4)*a3s*b1s*b2s^2*b3s + (2*b*r2 - 2*b*r4)*a3s*b2s^3*b3s + (2*b*r2 - 4*b*r3
    + 2*b*r4)*a3s*b1s^2*b3s^2 + (2*b*r2 + 2*b*r3 - 4*b*r4)*a3s*b1s*b2s*b3s^2 +
    (-4*b*r2 + 2*b*r3 + 2*b*r4)*a3s*b2s^2*b3s^2 + (-2*b*r2 + 2*b*r3)*a3s*b1s*b3s^3
    + (2*b*r2 - 2*b*r3)*a3s*b2s*b3s^3 + (2*a*b*r2 - 2*a*b*r3)*b1s^3*b2s^2 +
    (-2*a*b*r2 + 2*a*b*r3)*b1s^2*b2s^3 + (-4*a*b*r2 + 2*a*b*r3 +
    2*a*b*r4)*b1s^3*b2s*b3s + (2*a*b*r2 + 2*a*b*r3 - 4*a*b*r4)*b1s^2*b2s^2*b3s +
    (2*a*b*r2 - 4*a*b*r3 + 2*a*b*r4)*b1s*b2s^3*b3s + (2*a*b*r2 -
    2*a*b*r4)*b1s^3*b3s^2 + (2*a*b*r2 - 4*a*b*r3 + 2*a*b*r4)*b1s^2*b2s*b3s^2 +
    (-4*a*b*r2 + 2*a*b*r3 + 2*a*b*r4)*b1s*b2s^2*b3s^2 + (2*a*b*r3 -
    2*a*b*r4)*b2s^3*b3s^2 + (-2*a*b*r2 + 2*a*b*r4)*b1s^2*b3s^3 + (2*a*b*r2 +
    2*a*b*r3 - 4*a*b*r4)*b1s*b2s*b3s^3 + (-2*a*b*r3 + 2*a*b*r4)*b2s^2*b3s^3 +
    (2*b^2*r3 - 2*b^2*r4)*a1s*b1s^3*b2s + (-2*b^2*r2 - 2*b^2*r3 +
    4*b^2*r4)*a1s*b1s^2*b2s^2 + (2*b^2*r2 - 2*b^2*r4)*a1s*b1s*b2s^3 + (-2*b^2*r3 +
    2*b^2*r4)*a1s*b1s^3*b3s + (4*b^2*r2 - 2*b^2*r3 - 2*b^2*r4)*a1s*b1s^2*b2s*b3s +
    (-2*b^2*r2 + 4*b^2*r3 - 2*b^2*r4)*a1s*b1s*b2s^2*b3s + (-2*b^2*r2 +
    2*b^2*r4)*a1s*b2s^3*b3s + (-2*b^2*r2 + 4*b^2*r3 - 2*b^2*r4)*a1s*b1s^2*b3s^2 +
    (-2*b^2*r2 - 2*b^2*r3 + 4*b^2*r4)*a1s*b1s*b2s*b3s^2 + (4*b^2*r2 - 2*b^2*r3 -
    2*b^2*r4)*a1s*b2s^2*b3s^2 + (2*b^2*r2 - 2*b^2*r3)*a1s*b1s*b3s^3 + (-2*b^2*r2 +
    2*b^2*r3)*a1s*b2s*b3s^3)*y^3*z +
((r3 - r4)*a1s*a3s*b1s^3*b2s + (-r2 - r3 + 2*r4)*a1s*a3s*b1s^2*b2s^2 + (-r3 +
    r4)*b1s^4*b2s^2 + (r2 - r4)*a1s*a3s*b1s*b2s^3 + (r2 + r3 - 2*r4)*b1s^3*b2s^3 +
    (-r2 + r4)*b1s^2*b2s^4 + (-r3 + r4)*a1s*a3s*b1s^3*b3s + (2*r2 - r3 -
    r4)*a1s*a3s*b1s^2*b2s*b3s + (-r2 + 2*r3 - r4)*a1s*a3s*b1s*b2s^2*b3s + (-r2 +
    r3)*b1s^3*b2s^2*b3s + (-r2 + r4)*a1s*a3s*b2s^3*b3s + (r2 - r3)*b1s^2*b2s^3*b3s
    + (-r2 + 2*r3 - r4)*a1s*a3s*b1s^2*b3s^2 + (r3 - r4)*b1s^4*b3s^2 + (-r2 - r3 +
    2*r4)*a1s*a3s*b1s*b2s*b3s^2 + (-r2 + r4)*b1s^3*b2s*b3s^2 + (2*r2 - r3 -
    r4)*a1s*a3s*b2s^2*b3s^2 + (-r3 + r4)*b1s*b2s^3*b3s^2 + (r2 - r4)*b2s^4*b3s^2 +
    (r2 - r3)*a1s*a3s*b1s*b3s^3 + (r2 - 2*r3 + r4)*b1s^3*b3s^3 + (-r2 +
    r3)*a1s*a3s*b2s*b3s^3 + (r2 - r4)*b1s^2*b2s*b3s^3 + (r3 - r4)*b1s*b2s^2*b3s^3
    + (-2*r2 + r3 + r4)*b2s^3*b3s^3 + (-r2 + r3)*b1s^2*b3s^4 + (r2 -
    r3)*b2s^2*b3s^4 + (a*r3 - a*r4)*a3s*b1s^3*b2s + (-a*r2 - a*r3 +
    2*a*r4)*a3s*b1s^2*b2s^2 + (a*r2 - a*r4)*a3s*b1s*b2s^3 + (-a*r3 +
    a*r4)*a3s*b1s^3*b3s + (2*a*r2 - a*r3 - a*r4)*a3s*b1s^2*b2s*b3s + (-a*r2 +
    2*a*r3 - a*r4)*a3s*b1s*b2s^2*b3s + (-a*r2 + a*r4)*a3s*b2s^3*b3s + (-a*r2 +
    2*a*r3 - a*r4)*a3s*b1s^2*b3s^2 + (-a*r2 - a*r3 + 2*a*r4)*a3s*b1s*b2s*b3s^2 +
    (2*a*r2 - a*r3 - a*r4)*a3s*b2s^2*b3s^2 + (a*r2 - a*r3)*a3s*b1s*b3s^3 + (-a*r2
    + a*r3)*a3s*b2s*b3s^3 + (-2*b*r3 + 2*b*r4)*b1s^4*b2s + (a^2*r2 - a^2*r3 +
    4*b*r2 - 2*b*r3 - 2*b*r4)*b1s^3*b2s^2 + (-a^2*r2 + a^2*r3 - 2*b*r2 + 4*b*r3 -
    2*b*r4)*b1s^2*b2s^3 + (-2*b*r2 + 2*b*r4)*b1s*b2s^4 + (2*b*r3 -
    2*b*r4)*b1s^4*b3s + (-2*a^2*r2 + a^2*r3 + a^2*r4 - 8*b*r2 + 4*b*r3 +
    4*b*r4)*b1s^3*b2s*b3s + (a^2*r2 + a^2*r3 - 2*a^2*r4 + 2*b*r2 + 2*b*r3 -
    4*b*r4)*b1s^2*b2s^2*b3s + (a^2*r2 - 2*a^2*r3 + a^2*r4 + 4*b*r2 - 8*b*r3 +
    4*b*r4)*b1s*b2s^3*b3s + (2*b*r2 - 2*b*r4)*b2s^4*b3s + (a^2*r2 - a^2*r4 +
    4*b*r2 - 2*b*r3 - 2*b*r4)*b1s^3*b3s^2 + (a^2*r2 - 2*a^2*r3 + a^2*r4 + 2*b*r2 -
    4*b*r3 + 2*b*r4)*b1s^2*b2s*b3s^2 + (-2*a^2*r2 + a^2*r3 + a^2*r4 - 4*b*r2 +
    2*b*r3 + 2*b*r4)*b1s*b2s^2*b3s^2 + (a^2*r3 - a^2*r4 - 2*b*r2 + 4*b*r3 -
    2*b*r4)*b2s^3*b3s^2 + (-a^2*r2 + a^2*r4 - 2*b*r2 - 2*b*r3 +
    4*b*r4)*b1s^2*b3s^3 + (a^2*r2 + a^2*r3 - 2*a^2*r4 + 4*b*r2 + 4*b*r3 -
    8*b*r4)*b1s*b2s*b3s^3 + (-a^2*r3 + a^2*r4 - 2*b*r2 - 2*b*r3 +
    4*b*r4)*b2s^2*b3s^3 + (-2*b*r2 + 2*b*r3)*b1s*b3s^4 + (2*b*r2 -
    2*b*r3)*b2s*b3s^4 + (a*b*r3 - a*b*r4)*a1s*b1s^3*b2s + (-a*b*r2 - a*b*r3 +
    2*a*b*r4)*a1s*b1s^2*b2s^2 + (a*b*r2 - a*b*r4)*a1s*b1s*b2s^3 + (-a*b*r3 +
    a*b*r4)*a1s*b1s^3*b3s + (2*a*b*r2 - a*b*r3 - a*b*r4)*a1s*b1s^2*b2s*b3s +
    (-a*b*r2 + 2*a*b*r3 - a*b*r4)*a1s*b1s*b2s^2*b3s + (-a*b*r2 +
    a*b*r4)*a1s*b2s^3*b3s + (-a*b*r2 + 2*a*b*r3 - a*b*r4)*a1s*b1s^2*b3s^2 +
    (-a*b*r2 - a*b*r3 + 2*a*b*r4)*a1s*b1s*b2s*b3s^2 + (2*a*b*r2 - a*b*r3 -
    a*b*r4)*a1s*b2s^2*b3s^2 + (a*b*r2 - a*b*r3)*a1s*b1s*b3s^3 + (-a*b*r2 +
    a*b*r3)*a1s*b2s*b3s^3 + (4*b^2*r3 - 4*b^2*r4)*b1s^3*b2s + (-4*b^2*r2 -
    4*b^2*r3 + 8*b^2*r4)*b1s^2*b2s^2 + (4*b^2*r2 - 4*b^2*r4)*b1s*b2s^3 +
    (-4*b^2*r3 + 4*b^2*r4)*b1s^3*b3s + (8*b^2*r2 - 4*b^2*r3 -
    4*b^2*r4)*b1s^2*b2s*b3s + (-4*b^2*r2 + 8*b^2*r3 - 4*b^2*r4)*b1s*b2s^2*b3s +
    (-4*b^2*r2 + 4*b^2*r4)*b2s^3*b3s + (-4*b^2*r2 + 8*b^2*r3 -
    4*b^2*r4)*b1s^2*b3s^2 + (-4*b^2*r2 - 4*b^2*r3 + 8*b^2*r4)*b1s*b2s*b3s^2 +
    (8*b^2*r2 - 4*b^2*r3 - 4*b^2*r4)*b2s^2*b3s^2 + (4*b^2*r2 - 4*b^2*r3)*b1s*b3s^3
    + (-4*b^2*r2 + 4*b^2*r3)*b2s*b3s^3)*y^2*z^2 +
((2*r3 - 2*r4)*a3s*b1s^3*b2s + (-2*r2 - 2*r3 + 4*r4)*a3s*b1s^2*b2s^2 + (2*r2 -
    2*r4)*a3s*b1s*b2s^3 + (-2*r3 + 2*r4)*a3s*b1s^3*b3s + (4*r2 - 2*r3 -
    2*r4)*a3s*b1s^2*b2s*b3s + (-2*r2 + 4*r3 - 2*r4)*a3s*b1s*b2s^2*b3s + (-2*r2 +
    2*r4)*a3s*b2s^3*b3s + (-2*r2 + 4*r3 - 2*r4)*a3s*b1s^2*b3s^2 + (-2*r2 - 2*r3 +
    4*r4)*a3s*b1s*b2s*b3s^2 + (4*r2 - 2*r3 - 2*r4)*a3s*b2s^2*b3s^2 + (2*r2 -
    2*r3)*a3s*b1s*b3s^3 + (-2*r2 + 2*r3)*a3s*b2s*b3s^3 + (2*a*r2 -
    2*a*r3)*b1s^3*b2s^2 + (-2*a*r2 + 2*a*r3)*b1s^2*b2s^3 + (-4*a*r2 + 2*a*r3 +
    2*a*r4)*b1s^3*b2s*b3s + (2*a*r2 + 2*a*r3 - 4*a*r4)*b1s^2*b2s^2*b3s + (2*a*r2 -
    4*a*r3 + 2*a*r4)*b1s*b2s^3*b3s + (2*a*r2 - 2*a*r4)*b1s^3*b3s^2 + (2*a*r2 -
    4*a*r3 + 2*a*r4)*b1s^2*b2s*b3s^2 + (-4*a*r2 + 2*a*r3 + 2*a*r4)*b1s*b2s^2*b3s^2
    + (2*a*r3 - 2*a*r4)*b2s^3*b3s^2 + (-2*a*r2 + 2*a*r4)*b1s^2*b3s^3 + (2*a*r2 +
    2*a*r3 - 4*a*r4)*b1s*b2s*b3s^3 + (-2*a*r3 + 2*a*r4)*b2s^2*b3s^3 + (-2*b*r3 +
    2*b*r4)*a1s*b1s^3*b2s + (2*b*r2 + 2*b*r3 - 4*b*r4)*a1s*b1s^2*b2s^2 + (-2*b*r2
    + 2*b*r4)*a1s*b1s*b2s^3 + (2*b*r3 - 2*b*r4)*a1s*b1s^3*b3s + (-4*b*r2 + 2*b*r3
    + 2*b*r4)*a1s*b1s^2*b2s*b3s + (2*b*r2 - 4*b*r3 + 2*b*r4)*a1s*b1s*b2s^2*b3s +
    (2*b*r2 - 2*b*r4)*a1s*b2s^3*b3s + (2*b*r2 - 4*b*r3 + 2*b*r4)*a1s*b1s^2*b3s^2 +
    (2*b*r2 + 2*b*r3 - 4*b*r4)*a1s*b1s*b2s*b3s^2 + (-4*b*r2 + 2*b*r3 +
    2*b*r4)*a1s*b2s^2*b3s^2 + (-2*b*r2 + 2*b*r3)*a1s*b1s*b3s^3 + (2*b*r2 -
    2*b*r3)*a1s*b2s*b3s^3 + (4*a*b*r3 - 4*a*b*r4)*b1s^3*b2s + (-4*a*b*r2 -
    4*a*b*r3 + 8*a*b*r4)*b1s^2*b2s^2 + (4*a*b*r2 - 4*a*b*r4)*b1s*b2s^3 +
    (-4*a*b*r3 + 4*a*b*r4)*b1s^3*b3s + (8*a*b*r2 - 4*a*b*r3 -
    4*a*b*r4)*b1s^2*b2s*b3s + (-4*a*b*r2 + 8*a*b*r3 - 4*a*b*r4)*b1s*b2s^2*b3s +
    (-4*a*b*r2 + 4*a*b*r4)*b2s^3*b3s + (-4*a*b*r2 + 8*a*b*r3 -
    4*a*b*r4)*b1s^2*b3s^2 + (-4*a*b*r2 - 4*a*b*r3 + 8*a*b*r4)*b1s*b2s*b3s^2 +
    (8*a*b*r2 - 4*a*b*r3 - 4*a*b*r4)*b2s^2*b3s^2 + (4*a*b*r2 - 4*a*b*r3)*b1s*b3s^3
    + (-4*a*b*r2 + 4*a*b*r3)*b2s*b3s^3)*y*z^3 +
((r3 - r4)*b1s^4*b2s + (-r3 + r4)*b1s^3*b2s^2 + (-r2 + r4)*b1s^2*b2s^3 + (r2 -
    r4)*b1s*b2s^4 + (-r3 + r4)*b1s^4*b3s + (r2 + r3 - 2*r4)*b1s^2*b2s^2*b3s + (-r2
    + r4)*b2s^4*b3s + (r3 - r4)*b1s^3*b3s^2 + (r2 - 2*r3 + r4)*b1s^2*b2s*b3s^2 +
    (-2*r2 + r3 + r4)*b1s*b2s^2*b3s^2 + (r2 - r4)*b2s^3*b3s^2 + (-r2 +
    r3)*b1s^2*b3s^3 + (r2 - r3)*b2s^2*b3s^3 + (r2 - r3)*b1s*b3s^4 + (-r2 +
    r3)*b2s*b3s^4 + (-a*r3 + a*r4)*a1s*b1s^3*b2s + (a*r2 + a*r3 -
    2*a*r4)*a1s*b1s^2*b2s^2 + (-a*r2 + a*r4)*a1s*b1s*b2s^3 + (a*r3 -
    a*r4)*a1s*b1s^3*b3s + (-2*a*r2 + a*r3 + a*r4)*a1s*b1s^2*b2s*b3s + (a*r2 -
    2*a*r3 + a*r4)*a1s*b1s*b2s^2*b3s + (a*r2 - a*r4)*a1s*b2s^3*b3s + (a*r2 -
    2*a*r3 + a*r4)*a1s*b1s^2*b3s^2 + (a*r2 + a*r3 - 2*a*r4)*a1s*b1s*b2s*b3s^2 +
    (-2*a*r2 + a*r3 + a*r4)*a1s*b2s^2*b3s^2 + (-a*r2 + a*r3)*a1s*b1s*b3s^3 + (a*r2
    - a*r3)*a1s*b2s*b3s^3 + (a^2*r3 - a^2*r4)*b1s^3*b2s + (-a^2*r2 - a^2*r3 +
    2*a^2*r4)*b1s^2*b2s^2 + (a^2*r2 - a^2*r4)*b1s*b2s^3 + (-a^2*r3 +
    a^2*r4)*b1s^3*b3s + (2*a^2*r2 - a^2*r3 - a^2*r4)*b1s^2*b2s*b3s + (-a^2*r2 +
    2*a^2*r3 - a^2*r4)*b1s*b2s^2*b3s + (-a^2*r2 + a^2*r4)*b2s^3*b3s + (-a^2*r2 +
    2*a^2*r3 - a^2*r4)*b1s^2*b3s^2 + (-a^2*r2 - a^2*r3 + 2*a^2*r4)*b1s*b2s*b3s^2 +
    (2*a^2*r2 - a^2*r3 - a^2*r4)*b2s^2*b3s^2 + (a^2*r2 - a^2*r3)*b1s*b3s^3 +
    (-a^2*r2 + a^2*r3)*b2s*b3s^3)*z^4;

discs := b1s^2*b2s - b1s*b2s^2 - b1s^2*b3s + b2s^2*b3s + b1s*b3s^2 - b2s*b3s^2;
c1 := (-r3 + r4)*b1s + (r2 - r4)*b2s + (-r2 + r3)*b3s;
c2 := (-1/4*r3^2 + 1/2*r3*r4 - 1/4*r4^2)*a1s^3*a3s*b1s^2 + (1/2*r2*r3 - 1/2*r2*r4 -
    1/2*r3*r4 + 1/2*r4^2)*a1s^3*a3s*b1s*b2s + (-r2*r3 + r2*r4 + r3^2 -
    r3*r4)*a1s*a3s*b1s^2*b2s + (1/4*r3^2 - 1/2*r3*r4 + 1/4*r4^2)*a1s^2*b1s^3*b2s +
    (-1/4*r2^2 + 1/2*r2*r4 - 1/4*r4^2)*a1s^3*a3s*b2s^2 + (r2^2 - r2*r3 - r2*r4 +
    r3*r4)*a1s*a3s*b1s*b2s^2 + (-1/2*r2*r3 + 1/2*r2*r4 + 1/2*r3*r4 -
    1/2*r4^2)*a1s^2*b1s^2*b2s^2 + (r2*r3 - r2*r4 - r3^2 + r3*r4)*b1s^3*b2s^2 +
    (1/4*r2^2 - 1/2*r2*r4 + 1/4*r4^2)*a1s^2*b1s*b2s^3 + (-r2^2 + r2*r3 + r2*r4 -
    r3*r4)*b1s^2*b2s^3 + (-1/2*r2*r3 + 1/2*r2*r4 + 1/2*r3^2 -
    1/2*r3*r4)*a1s^3*a3s*b1s*b3s + (r2*r3 - r2*r4 - r3*r4 +
    r4^2)*a1s*a3s*b1s^2*b3s + (1/4*r3^2 - 1/2*r3*r4 + 1/4*r4^2)*a1s^2*b1s^3*b3s +
    (1/2*r2^2 - 1/2*r2*r3 - 1/2*r2*r4 + 1/2*r3*r4)*a1s^3*a3s*b2s*b3s + (-2*r2^2 +
    2*r2*r3 + 2*r2*r4 - 2*r3^2 + 2*r3*r4 - 2*r4^2)*a1s*a3s*b1s*b2s*b3s +
    (-1/4*r3^2 + 1/2*r3*r4 - 1/4*r4^2)*a1s^2*b1s^2*b2s*b3s + (r2*r3 - r2*r4 -
    r3*r4 + r4^2)*a1s*a3s*b2s^2*b3s + (-1/4*r2^2 + 1/2*r2*r4 -
    1/4*r4^2)*a1s^2*b1s*b2s^2*b3s + (r2^2 - 2*r2*r3 + r3^2)*b1s^2*b2s^2*b3s +
    (1/4*r2^2 - 1/2*r2*r4 + 1/4*r4^2)*a1s^2*b2s^3*b3s + (-1/4*r2^2 + 1/2*r2*r3 -
    1/4*r3^2)*a1s^3*a3s*b3s^2 + (r2^2 - r2*r3 - r2*r4 + r3*r4)*a1s*a3s*b1s*b3s^2 +
    (1/2*r2*r3 - 1/2*r2*r4 - 1/2*r3^2 + 1/2*r3*r4)*a1s^2*b1s^2*b3s^2 + (-r2*r3 +
    r2*r4 + r3*r4 - r4^2)*b1s^3*b3s^2 + (-r2*r3 + r2*r4 + r3^2 -
    r3*r4)*a1s*a3s*b2s*b3s^2 + (-1/4*r2^2 + 1/2*r2*r3 -
    1/4*r3^2)*a1s^2*b1s*b2s*b3s^2 + (r2^2 - 2*r2*r4 + r4^2)*b1s^2*b2s*b3s^2 +
    (-1/2*r2^2 + 1/2*r2*r3 + 1/2*r2*r4 - 1/2*r3*r4)*a1s^2*b2s^2*b3s^2 + (r3^2 -
    2*r3*r4 + r4^2)*b1s*b2s^2*b3s^2 + (-r2*r3 + r2*r4 + r3*r4 - r4^2)*b2s^3*b3s^2
    + (1/4*r2^2 - 1/2*r2*r3 + 1/4*r3^2)*a1s^2*b1s*b3s^3 + (-r2^2 + r2*r3 + r2*r4 -
    r3*r4)*b1s^2*b3s^3 + (1/4*r2^2 - 1/2*r2*r3 + 1/4*r3^2)*a1s^2*b2s*b3s^3 +
    (r2*r3 - r2*r4 - r3^2 + r3*r4)*b2s^2*b3s^3 + (a*r3^2 - 2*a*r3*r4 +
    a*r4^2)*a1s^2*a3s*b1s^2 + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3*r4 -
    2*a*r4^2)*a1s^2*a3s*b1s*b2s + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3^2 +
    2*a*r3*r4)*a3s*b1s^2*b2s + (-a*r3^2 + 2*a*r3*r4 - a*r4^2)*a1s*b1s^3*b2s +
    (a*r2^2 - 2*a*r2*r4 + a*r4^2)*a1s^2*a3s*b2s^2 + (-2*a*r2^2 + 2*a*r2*r3 +
    2*a*r2*r4 - 2*a*r3*r4)*a3s*b1s*b2s^2 + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3*r4 +
    2*a*r4^2)*a1s*b1s^2*b2s^2 + (-a*r2^2 + 2*a*r2*r4 - a*r4^2)*a1s*b1s*b2s^3 +
    (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3^2 + 2*a*r3*r4)*a1s^2*a3s*b1s*b3s + (-2*a*r2*r3
    + 2*a*r2*r4 + 2*a*r3*r4 - 2*a*r4^2)*a3s*b1s^2*b3s + (-a*r3^2 + 2*a*r3*r4 -
    a*r4^2)*a1s*b1s^3*b3s + (-2*a*r2^2 + 2*a*r2*r3 + 2*a*r2*r4 -
    2*a*r3*r4)*a1s^2*a3s*b2s*b3s + (4*a*r2^2 - 4*a*r2*r3 - 4*a*r2*r4 + 4*a*r3^2 -
    4*a*r3*r4 + 4*a*r4^2)*a3s*b1s*b2s*b3s + (a*r3^2 - 2*a*r3*r4 +
    a*r4^2)*a1s*b1s^2*b2s*b3s + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3*r4 -
    2*a*r4^2)*a3s*b2s^2*b3s + (a*r2^2 - 2*a*r2*r4 + a*r4^2)*a1s*b1s*b2s^2*b3s +
    (-a*r2^2 + 2*a*r2*r4 - a*r4^2)*a1s*b2s^3*b3s + (a*r2^2 - 2*a*r2*r3 +
    a*r3^2)*a1s^2*a3s*b3s^2 + (-2*a*r2^2 + 2*a*r2*r3 + 2*a*r2*r4 -
    2*a*r3*r4)*a3s*b1s*b3s^2 + (-2*a*r2*r3 + 2*a*r2*r4 + 2*a*r3^2 -
    2*a*r3*r4)*a1s*b1s^2*b3s^2 + (2*a*r2*r3 - 2*a*r2*r4 - 2*a*r3^2 +
    2*a*r3*r4)*a3s*b2s*b3s^2 + (a*r2^2 - 2*a*r2*r3 + a*r3^2)*a1s*b1s*b2s*b3s^2 +
    (2*a*r2^2 - 2*a*r2*r3 - 2*a*r2*r4 + 2*a*r3*r4)*a1s*b2s^2*b3s^2 + (-a*r2^2 +
    2*a*r2*r3 - a*r3^2)*a1s*b1s*b3s^3 + (-a*r2^2 + 2*a*r2*r3 -
    a*r3^2)*a1s*b2s*b3s^3 + (-a^2*r3^2 + 2*a^2*r3*r4 - a^2*r4^2 - 2*b*r3^2 +
    4*b*r3*r4 - 2*b*r4^2)*a1s*a3s*b1s^2 + (2*a^2*r2*r3 - 2*a^2*r2*r4 - 2*a^2*r3*r4
    + 2*a^2*r4^2 + 4*b*r2*r3 - 4*b*r2*r4 - 4*b*r3*r4 + 4*b*r4^2)*a1s*a3s*b1s*b2s +
    (a^2*r3^2 - 2*a^2*r3*r4 + a^2*r4^2 - 4*b*r2*r3 + 4*b*r2*r4 + 4*b*r3^2 -
    4*b*r3*r4)*b1s^3*b2s + (-a^2*r2^2 + 2*a^2*r2*r4 - a^2*r4^2 - 2*b*r2^2 +
    4*b*r2*r4 - 2*b*r4^2)*a1s*a3s*b2s^2 + (a^2*r2^2 - 4*a^2*r2*r3 + 2*a^2*r2*r4 +
    a^2*r3^2 + 2*a^2*r3*r4 - 2*a^2*r4^2)*b1s^2*b2s^2 + (a^2*r2^2 - 2*a^2*r2*r4 +
    a^2*r4^2 + 4*b*r2^2 - 4*b*r2*r3 - 4*b*r2*r4 + 4*b*r3*r4)*b1s*b2s^3 +
    (-2*a^2*r2*r3 + 2*a^2*r2*r4 + 2*a^2*r3^2 - 2*a^2*r3*r4 - 4*b*r2*r3 + 4*b*r2*r4
    + 4*b*r3^2 - 4*b*r3*r4)*a1s*a3s*b1s*b3s + (a^2*r3^2 - 2*a^2*r3*r4 + a^2*r4^2 +
    4*b*r2*r3 - 4*b*r2*r4 - 4*b*r3*r4 + 4*b*r4^2)*b1s^3*b3s + (2*a^2*r2^2 -
    2*a^2*r2*r3 - 2*a^2*r2*r4 + 2*a^2*r3*r4 + 4*b*r2^2 - 4*b*r2*r3 - 4*b*r2*r4 +
    4*b*r3*r4)*a1s*a3s*b2s*b3s + (-2*a^2*r2^2 + 2*a^2*r2*r3 + 2*a^2*r2*r4 -
    a^2*r3^2 - a^2*r4^2 - 4*b*r3^2 + 8*b*r3*r4 - 4*b*r4^2)*b1s^2*b2s*b3s +
    (-a^2*r2^2 + 2*a^2*r2*r3 - 2*a^2*r3^2 + 2*a^2*r3*r4 - a^2*r4^2 - 4*b*r2^2 +
    8*b*r2*r4 - 4*b*r4^2)*b1s*b2s^2*b3s + (a^2*r2^2 - 2*a^2*r2*r4 + a^2*r4^2 +
    4*b*r2*r3 - 4*b*r2*r4 - 4*b*r3*r4 + 4*b*r4^2)*b2s^3*b3s + (-a^2*r2^2 +
    2*a^2*r2*r3 - a^2*r3^2 - 2*b*r2^2 + 4*b*r2*r3 - 2*b*r3^2)*a1s*a3s*b3s^2 +
    (a^2*r2^2 + 2*a^2*r2*r3 - 4*a^2*r2*r4 - 2*a^2*r3^2 + 2*a^2*r3*r4 +
    a^2*r4^2)*b1s^2*b3s^2 + (-a^2*r2^2 + 2*a^2*r2*r4 - a^2*r3^2 + 2*a^2*r3*r4 -
    2*a^2*r4^2 - 4*b*r2^2 + 8*b*r2*r3 - 4*b*r3^2)*b1s*b2s*b3s^2 + (-2*a^2*r2^2 +
    2*a^2*r2*r3 + 2*a^2*r2*r4 + a^2*r3^2 - 4*a^2*r3*r4 + a^2*r4^2)*b2s^2*b3s^2 +
    (a^2*r2^2 - 2*a^2*r2*r3 + a^2*r3^2 + 4*b*r2^2 - 4*b*r2*r3 - 4*b*r2*r4 +
    4*b*r3*r4)*b1s*b3s^3 + (a^2*r2^2 - 2*a^2*r2*r3 + a^2*r3^2 - 4*b*r2*r3 +
    4*b*r2*r4 + 4*b*r3^2 - 4*b*r3*r4)*b2s*b3s^3 + (4*a*b*r3^2 - 8*a*b*r3*r4 +
    4*a*b*r4^2)*a3s*b1s^2 + (-8*a*b*r2*r3 + 8*a*b*r2*r4 + 8*a*b*r3*r4 -
    8*a*b*r4^2)*a3s*b1s*b2s + (2*a*b*r2*r3 - 2*a*b*r2*r4 - 2*a*b*r3^2 +
    2*a*b*r3*r4)*a1s*b1s^2*b2s + (4*a*b*r2^2 - 8*a*b*r2*r4 + 4*a*b*r4^2)*a3s*b2s^2
    + (-2*a*b*r2^2 + 2*a*b*r2*r3 + 2*a*b*r2*r4 - 2*a*b*r3*r4)*a1s*b1s*b2s^2 +
    (8*a*b*r2*r3 - 8*a*b*r2*r4 - 8*a*b*r3^2 + 8*a*b*r3*r4)*a3s*b1s*b3s +
    (-2*a*b*r2*r3 + 2*a*b*r2*r4 + 2*a*b*r3*r4 - 2*a*b*r4^2)*a1s*b1s^2*b3s +
    (-8*a*b*r2^2 + 8*a*b*r2*r3 + 8*a*b*r2*r4 - 8*a*b*r3*r4)*a3s*b2s*b3s +
    (4*a*b*r2^2 - 4*a*b*r2*r3 - 4*a*b*r2*r4 + 4*a*b*r3^2 - 4*a*b*r3*r4 +
    4*a*b*r4^2)*a1s*b1s*b2s*b3s + (-2*a*b*r2*r3 + 2*a*b*r2*r4 + 2*a*b*r3*r4 -
    2*a*b*r4^2)*a1s*b2s^2*b3s + (4*a*b*r2^2 - 8*a*b*r2*r3 + 4*a*b*r3^2)*a3s*b3s^2
    + (-2*a*b*r2^2 + 2*a*b*r2*r3 + 2*a*b*r2*r4 - 2*a*b*r3*r4)*a1s*b1s*b3s^2 +
    (2*a*b*r2*r3 - 2*a*b*r2*r4 - 2*a*b*r3^2 + 2*a*b*r3*r4)*a1s*b2s*b3s^2 +
    (b^2*r3^2 - 2*b^2*r3*r4 + b^2*r4^2)*a1s^2*b1s^2 + (-4*b^2*r3^2 + 8*b^2*r3*r4 -
    4*b^2*r4^2)*b1s^3 + (-2*b^2*r2*r3 + 2*b^2*r2*r4 + 2*b^2*r3*r4 -
    2*b^2*r4^2)*a1s^2*b1s*b2s + (4*b^2*r2*r3 - 4*b^2*r2*r4 - 4*b^2*r3*r4 +
    4*b^2*r4^2)*b1s^2*b2s + (b^2*r2^2 - 2*b^2*r2*r4 + b^2*r4^2)*a1s^2*b2s^2 +
    (4*b^2*r2*r3 - 4*b^2*r2*r4 - 4*b^2*r3*r4 + 4*b^2*r4^2)*b1s*b2s^2 +
    (-4*b^2*r2^2 + 8*b^2*r2*r4 - 4*b^2*r4^2)*b2s^3 + (2*b^2*r2*r3 - 2*b^2*r2*r4 -
    2*b^2*r3^2 + 2*b^2*r3*r4)*a1s^2*b1s*b3s + (-4*b^2*r2*r3 + 4*b^2*r2*r4 +
    4*b^2*r3^2 - 4*b^2*r3*r4)*b1s^2*b3s + (-2*b^2*r2^2 + 2*b^2*r2*r3 + 2*b^2*r2*r4
    - 2*b^2*r3*r4)*a1s^2*b2s*b3s + (4*b^2*r2^2 - 4*b^2*r2*r3 - 4*b^2*r2*r4 +
    4*b^2*r3*r4)*b2s^2*b3s + (b^2*r2^2 - 2*b^2*r2*r3 + b^2*r3^2)*a1s^2*b3s^2 +
    (-4*b^2*r2*r3 + 4*b^2*r2*r4 + 4*b^2*r3^2 - 4*b^2*r3*r4)*b1s*b3s^2 +
    (4*b^2*r2^2 - 4*b^2*r2*r3 - 4*b^2*r2*r4 + 4*b^2*r3*r4)*b2s*b3s^2 +
    (-4*b^2*r2^2 + 8*b^2*r2*r3 - 4*b^2*r3^2)*b3s^3;
c := discs*c1*c2;
c := -c;

F3 := Evaluate(F3, [x,z,y]);
return F3, c;

end function;


function GluingFormulaSs(invrs, ss, ab);

assert #invrs eq 5;
assert #ss eq 3;
assert #ab eq 2;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

a1r, a3r, b1r, b2r, b3r := Explode(invrs);
s2, s3, s4 := Explode(ss);
a, b := Explode(ab);

F3 := ((b1r^2*b2r - b1r^2*b3r - b1r*b2r^2 + b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*s2^2*s3 +
    (-b1r^2*b2r + b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 - b2r^2*b3r +
    b2r*b3r^2)*s2^2*s4 + (-b1r^2*b2r + b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 -
    b2r^2*b3r + b2r*b3r^2)*s2*s3^2 + (b1r^2*b2r - b1r^2*b3r - b1r*b2r^2 +
    b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*s2*s4^2 + (b1r^2*b2r - b1r^2*b3r -
    b1r*b2r^2 + b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2)*s3^2*s4 + (-b1r^2*b2r +
    b1r^2*b3r + b1r*b2r^2 - b1r*b3r^2 - b2r^2*b3r + b2r*b3r^2)*s3*s4^2)*x^4 +
-((b2r^2 - 2*b2r*b3r + b3r^2)*s2^4*s3^2 + (-2*b2r^2 + 4*b2r*b3r -
    2*b3r^2)*s2^4*s3*s4 + (b2r^2 - 2*b2r*b3r + b3r^2)*s2^4*s4^2 + (-2*b1r*b2r +
    2*b1r*b3r + 2*b2r*b3r - 2*b3r^2)*s2^3*s3^3 + (2*b1r*b2r - 2*b1r*b3r -
    2*b2r*b3r + 2*b3r^2)*s2^3*s3^2*s4 + (-a*b1r*b2r + a*b1r*b3r + a*b2r^2 -
    a*b2r*b3r)*s2^3*s3^2 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 -
    2*b2r*b3r)*s2^3*s3*s4^2 + (-a*b2r^2 + 2*a*b2r*b3r - a*b3r^2)*s2^3*s3*s4 +
    (-2*b*b1r*b2r + 2*b*b1r*b3r + b*b2r^2 - b*b3r^2)*s2^3*s3 + (2*b1r*b2r -
    2*b1r*b3r - 2*b2r^2 + 2*b2r*b3r)*s2^3*s4^3 + (a*b1r*b2r - a*b1r*b3r -
    a*b2r*b3r + a*b3r^2)*s2^3*s4^2 + (2*b*b1r*b2r - 2*b*b1r*b3r - b*b2r^2 +
    b*b3r^2)*s2^3*s4 + (b1r^2 - 2*b1r*b3r + b3r^2)*s2^2*s3^4 + (2*b1r*b2r -
    2*b1r*b3r - 2*b2r*b3r + 2*b3r^2)*s2^2*s3^3*s4 + (a*b1r^2 - a*b1r*b2r -
    a*b1r*b3r + a*b2r*b3r)*s2^2*s3^3 + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - 2*b2r^2
    + 2*b2r*b3r - 2*b3r^2)*s2^2*s3^2*s4^2 + (-a*b1r^2 + 4*a*b1r*b2r - 2*a*b1r*b3r
    - a*b2r^2 - 2*a*b2r*b3r + 2*a*b3r^2)*s2^2*s3^2*s4 + (2*b*b1r*b2r - 2*b*b1r*b3r
    - 2*b*b2r*b3r + 2*b*b3r^2)*s2^2*s3^2 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 -
    2*b2r*b3r)*s2^2*s3*s4^3 + (-a*b1r^2 - 2*a*b1r*b2r + 4*a*b1r*b3r + 2*a*b2r^2 -
    2*a*b2r*b3r - a*b3r^2)*s2^2*s3*s4^2 + (-b*b2r^2 + 2*b*b2r*b3r -
    b*b3r^2)*s2^2*s3*s4 + (b1r^2 - 2*b1r*b2r + b2r^2)*s2^2*s4^4 + (a*b1r^2 -
    a*b1r*b2r - a*b1r*b3r + a*b2r*b3r)*s2^2*s4^3 + (-2*b*b1r*b2r + 2*b*b1r*b3r +
    2*b*b2r^2 - 2*b*b2r*b3r)*s2^2*s4^2 + (-2*b1r^2 + 4*b1r*b3r -
    2*b3r^2)*s2*s3^4*s4 + (2*b1r^2 - 2*b1r*b2r - 2*b1r*b3r +
    2*b2r*b3r)*s2*s3^3*s4^2 + (-a*b1r^2 + 2*a*b1r*b3r - a*b3r^2)*s2*s3^3*s4 +
    (b*b1r^2 - 2*b*b1r*b2r + 2*b*b2r*b3r - b*b3r^2)*s2*s3^3 + (2*b1r^2 - 2*b1r*b2r
    - 2*b1r*b3r + 2*b2r*b3r)*s2*s3^2*s4^3 + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r
    - a*b2r^2 + 4*a*b2r*b3r - a*b3r^2)*s2*s3^2*s4^2 + (-b*b1r^2 + 2*b*b1r*b3r -
    b*b3r^2)*s2*s3^2*s4 + (-2*b1r^2 + 4*b1r*b2r - 2*b2r^2)*s2*s3*s4^4 + (-a*b1r^2
    + 2*a*b1r*b2r - a*b2r^2)*s2*s3*s4^3 + (-b*b1r^2 + 2*b*b1r*b2r -
    b*b2r^2)*s2*s3*s4^2 + (b*b1r^2 - 2*b*b1r*b3r - b*b2r^2 + 2*b*b2r*b3r)*s2*s4^3
    + (b1r^2 - 2*b1r*b3r + b3r^2)*s3^4*s4^2 + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r -
    2*b2r*b3r)*s3^3*s4^3 + (a*b1r*b2r - a*b1r*b3r - a*b2r*b3r + a*b3r^2)*s3^3*s4^2
    + (-b*b1r^2 + 2*b*b1r*b2r - 2*b*b2r*b3r + b*b3r^2)*s3^3*s4 + (b1r^2 -
    2*b1r*b2r + b2r^2)*s3^2*s4^4 + (-a*b1r*b2r + a*b1r*b3r + a*b2r^2 -
    a*b2r*b3r)*s3^2*s4^3 + (2*b*b1r^2 - 2*b*b1r*b2r - 2*b*b1r*b3r +
    2*b*b2r*b3r)*s3^2*s4^2 + (-b*b1r^2 + 2*b*b1r*b3r + b*b2r^2 -
    2*b*b2r*b3r)*s3*s4^3)*x^2*y^2 +
-((2*b1r*b2r - 2*b1r*b3r - 2*b2r^2 + 2*b2r*b3r)*s2^3*s3^2 + (2*b2r^2 - 4*b2r*b3r +
    2*b3r^2)*s2^3*s3*s4 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r*b3r - 2*b3r^2)*s2^3*s4^2
    + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - 2*b2r*b3r)*s2^2*s3^3 + (2*b1r^2 -
    8*b1r*b2r + 4*b1r*b3r + 2*b2r^2 + 4*b2r*b3r - 4*b3r^2)*s2^2*s3^2*s4 +
    (-2*a*b1r^2 + 4*a*b1r*b2r - 2*a*b2r^2)*s2^2*s3^2 + (2*b1r^2 + 4*b1r*b2r -
    8*b1r*b3r - 4*b2r^2 + 4*b2r*b3r + 2*b3r^2)*s2^2*s3*s4^2 + (4*a*b1r^2 -
    4*a*b1r*b2r - 4*a*b1r*b3r + 4*a*b2r*b3r)*s2^2*s3*s4 + (2*b*b1r*b2r -
    2*b*b1r*b3r - 2*b*b2r^2 + 2*b*b2r*b3r)*s2^2*s3 + (-2*b1r^2 + 2*b1r*b2r +
    2*b1r*b3r - 2*b2r*b3r)*s2^2*s4^3 + (-2*a*b1r^2 + 4*a*b1r*b3r -
    2*a*b3r^2)*s2^2*s4^2 + (-2*b*b1r*b2r + 2*b*b1r*b3r + 2*b*b2r*b3r -
    2*b*b3r^2)*s2^2*s4 + (2*b1r^2 - 4*b1r*b3r + 2*b3r^2)*s2*s3^3*s4 + (-4*b1r^2 +
    4*b1r*b2r + 4*b1r*b3r + 2*b2r^2 - 8*b2r*b3r + 2*b3r^2)*s2*s3^2*s4^2 +
    (-4*a*b1r*b2r + 4*a*b1r*b3r + 4*a*b2r^2 - 4*a*b2r*b3r)*s2*s3^2*s4 +
    (-2*b*b1r^2 + 2*b*b1r*b2r + 2*b*b1r*b3r - 2*b*b2r*b3r)*s2*s3^2 + (2*b1r^2 -
    4*b1r*b2r + 2*b2r^2)*s2*s3*s4^3 + (4*a*b1r*b2r - 4*a*b1r*b3r - 4*a*b2r*b3r +
    4*a*b3r^2)*s2*s3*s4^2 + (4*b*b1r^2 - 4*b*b1r*b2r - 4*b*b1r*b3r + 4*b*b2r^2 -
    4*b*b2r*b3r + 4*b*b3r^2)*s2*s3*s4 + (-2*b*b1r^2 + 2*b*b1r*b2r + 2*b*b1r*b3r -
    2*b*b2r*b3r)*s2*s4^2 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r*b3r -
    2*b3r^2)*s3^3*s4^2 + (2*b1r*b2r - 2*b1r*b3r - 2*b2r^2 + 2*b2r*b3r)*s3^2*s4^3 +
    (-2*a*b2r^2 + 4*a*b2r*b3r - 2*a*b3r^2)*s3^2*s4^2 + (-2*b*b1r*b2r + 2*b*b1r*b3r
    + 2*b*b2r*b3r - 2*b*b3r^2)*s3^2*s4 + (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r^2 +
    2*b*b2r*b3r)*s3*s4^2)*x^2*y*z +
-((-2*b1r*b2r + 2*b1r*b3r + b2r^2 - b3r^2)*s2^3*s3 + (2*b1r*b2r - 2*b1r*b3r - b2r^2
    + b3r^2)*s2^3*s4 + (2*b1r*b2r - 2*b1r*b3r - 2*b2r*b3r + 2*b3r^2)*s2^2*s3^2 +
    (-b2r^2 + 2*b2r*b3r - b3r^2)*s2^2*s3*s4 + (-a*b1r*b2r + a*b1r*b3r + a*b2r^2 -
    a*b2r*b3r)*s2^2*s3 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 - 2*b2r*b3r)*s2^2*s4^2
    + (a*b1r*b2r - a*b1r*b3r - a*b2r*b3r + a*b3r^2)*s2^2*s4 + (b*b2r^2 -
    2*b*b2r*b3r + b*b3r^2)*s2^2 + (b1r^2 - 2*b1r*b2r + 2*b2r*b3r - b3r^2)*s2*s3^3
    + (-b1r^2 + 2*b1r*b3r - b3r^2)*s2*s3^2*s4 + (a*b1r^2 - a*b1r*b2r - a*b1r*b3r +
    a*b2r*b3r)*s2*s3^2 + (-b1r^2 + 2*b1r*b2r - b2r^2)*s2*s3*s4^2 + (-2*a*b1r^2 +
    2*a*b1r*b2r + 2*a*b1r*b3r - 2*a*b2r^2 + 2*a*b2r*b3r - 2*a*b3r^2)*s2*s3*s4 +
    (-2*b*b1r*b2r + 2*b*b1r*b3r + 2*b*b2r*b3r - 2*b*b3r^2)*s2*s3 + (b1r^2 -
    2*b1r*b3r - b2r^2 + 2*b2r*b3r)*s2*s4^3 + (a*b1r^2 - a*b1r*b2r - a*b1r*b3r +
    a*b2r*b3r)*s2*s4^2 + (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r^2 +
    2*b*b2r*b3r)*s2*s4 + (-b1r^2 + 2*b1r*b2r - 2*b2r*b3r + b3r^2)*s3^3*s4 +
    (2*b1r^2 - 2*b1r*b2r - 2*b1r*b3r + 2*b2r*b3r)*s3^2*s4^2 + (a*b1r*b2r -
    a*b1r*b3r - a*b2r*b3r + a*b3r^2)*s3^2*s4 + (b*b1r^2 - 2*b*b1r*b3r +
    b*b3r^2)*s3^2 + (-b1r^2 + 2*b1r*b3r + b2r^2 - 2*b2r*b3r)*s3*s4^3 + (-a*b1r*b2r
    + a*b1r*b3r + a*b2r^2 - a*b2r*b3r)*s3*s4^2 + (-2*b*b1r^2 + 2*b*b1r*b2r +
    2*b*b1r*b3r - 2*b*b2r*b3r)*s3*s4 + (b*b1r^2 - 2*b*b1r*b2r + b*b2r^2)*s4^2)*x^2*z^2 +
((a^2*b2r - a^2*b3r)*s2^4*s3^2*s4 + (a*b*b2r - a*b*b3r)*s2^4*s3^2 + (-a^2*b2r +
    a^2*b3r)*s2^4*s3*s4^2 + (b^2*b2r - b^2*b3r)*s2^4*s3 + (-a*b*b2r +
    a*b*b3r)*s2^4*s4^2 + (-b^2*b2r + b^2*b3r)*s2^4*s4 + (-a^2*b1r - a^2*b2r +
    2*a^2*b3r)*s2^3*s3^3*s4 + (-a*b*b1r - a*b*b2r + 2*a*b*b3r)*s2^3*s3^3 +
    (2*a^2*b1r - a^2*b2r - a^2*b3r)*s2^3*s3^2*s4^2 + (a*b*b1r -
    a*b*b2r)*s2^3*s3^2*s4 + (-b^2*b2r + b^2*b3r)*s2^3*s3^2 + (-a^2*b1r + 2*a^2*b2r
    - a^2*b3r)*s2^3*s3*s4^3 + (a*b*b1r - a*b*b3r)*s2^3*s3*s4^2 + (-a*b*b1r +
    2*a*b*b2r - a*b*b3r)*s2^3*s4^3 + (b^2*b2r - b^2*b3r)*s2^3*s4^2 + (a^2*b1r -
    a^2*b3r)*s2^2*s3^4*s4 + (a*b*b1r - a*b*b3r)*s2^2*s3^4 + (-a^2*b1r + 2*a^2*b2r
    - a^2*b3r)*s2^2*s3^3*s4^2 + (-a*b*b1r + a*b*b2r)*s2^2*s3^3*s4 + (-b^2*b1r +
    b^2*b3r)*s2^2*s3^3 + (-a^2*b1r - a^2*b2r + 2*a^2*b3r)*s2^2*s3^2*s4^3 +
    (b^2*b1r + b^2*b2r - 2*b^2*b3r)*s2^2*s3^2*s4 + (a^2*b1r -
    a^2*b2r)*s2^2*s3*s4^4 + (-a*b*b1r + a*b*b3r)*s2^2*s3*s4^3 + (b^2*b1r -
    2*b^2*b2r + b^2*b3r)*s2^2*s3*s4^2 + (a*b*b1r - a*b*b2r)*s2^2*s4^4 + (-b^2*b1r
    + b^2*b2r)*s2^2*s4^3 + (-a^2*b1r + a^2*b3r)*s2*s3^4*s4^2 + (b^2*b1r -
    b^2*b3r)*s2*s3^4 + (2*a^2*b1r - a^2*b2r - a^2*b3r)*s2*s3^3*s4^3 + (a*b*b2r -
    a*b*b3r)*s2*s3^3*s4^2 + (-a^2*b1r + a^2*b2r)*s2*s3^2*s4^4 + (-a*b*b2r +
    a*b*b3r)*s2*s3^2*s4^3 + (-2*b^2*b1r + b^2*b2r + b^2*b3r)*s2*s3^2*s4^2 +
    (b^2*b1r - b^2*b2r)*s2*s4^4 + (-a*b*b1r + a*b*b3r)*s3^4*s4^2 + (-b^2*b1r +
    b^2*b3r)*s3^4*s4 + (2*a*b*b1r - a*b*b2r - a*b*b3r)*s3^3*s4^3 + (b^2*b1r -
    b^2*b3r)*s3^3*s4^2 + (-a*b*b1r + a*b*b2r)*s3^2*s4^4 + (b^2*b1r -
    b^2*b2r)*s3^2*s4^3 + (-b^2*b1r + b^2*b2r)*s3*s4^4)*y^4 +
((4*a*b2r - 4*a*b3r)*s2^4*s3^2*s4 + (2*b*b2r - 2*b*b3r)*s2^4*s3^2 + (-4*a*b2r +
    4*a*b3r)*s2^4*s3*s4^2 + (-2*b*b2r + 2*b*b3r)*s2^4*s4^2 + (-4*a*b1r - 4*a*b2r +
    8*a*b3r)*s2^3*s3^3*s4 + (-2*b*b1r - 2*b*b2r + 4*b*b3r)*s2^3*s3^3 + (8*a*b1r -
    4*a*b2r - 4*a*b3r)*s2^3*s3^2*s4^2 + (2*b*b1r - 2*b*b2r)*s2^3*s3^2*s4 +
    (2*a*b*b1r - 2*a*b*b2r)*s2^3*s3^2 + (-4*a*b1r + 8*a*b2r -
    4*a*b3r)*s2^3*s3*s4^3 + (2*b*b1r - 2*b*b3r)*s2^3*s3*s4^2 + (-4*a*b*b1r +
    2*a*b*b2r + 2*a*b*b3r)*s2^3*s3*s4 + (-2*b^2*b2r + 2*b^2*b3r)*s2^3*s3 +
    (-2*b*b1r + 4*b*b2r - 2*b*b3r)*s2^3*s4^3 + (2*a*b*b1r - 2*a*b*b3r)*s2^3*s4^2 +
    (2*b^2*b2r - 2*b^2*b3r)*s2^3*s4 + (4*a*b1r - 4*a*b3r)*s2^2*s3^4*s4 + (2*b*b1r
    - 2*b*b3r)*s2^2*s3^4 + (-4*a*b1r + 8*a*b2r - 4*a*b3r)*s2^2*s3^3*s4^2 +
    (-2*b*b1r + 2*b*b2r)*s2^2*s3^3*s4 + (-2*a*b*b1r + 2*a*b*b2r)*s2^2*s3^3 +
    (-4*a*b1r - 4*a*b2r + 8*a*b3r)*s2^2*s3^2*s4^3 + (2*a*b*b1r + 2*a*b*b2r -
    4*a*b*b3r)*s2^2*s3^2*s4 + (2*b^2*b1r + 2*b^2*b2r - 4*b^2*b3r)*s2^2*s3^2 +
    (4*a*b1r - 4*a*b2r)*s2^2*s3*s4^4 + (-2*b*b1r + 2*b*b3r)*s2^2*s3*s4^3 +
    (2*a*b*b1r - 4*a*b*b2r + 2*a*b*b3r)*s2^2*s3*s4^2 + (-4*b^2*b1r + 2*b^2*b2r +
    2*b^2*b3r)*s2^2*s3*s4 + (2*b*b1r - 2*b*b2r)*s2^2*s4^4 + (-2*a*b*b1r +
    2*a*b*b3r)*s2^2*s4^3 + (2*b^2*b1r - 4*b^2*b2r + 2*b^2*b3r)*s2^2*s4^2 +
    (-4*a*b1r + 4*a*b3r)*s2*s3^4*s4^2 + (8*a*b1r - 4*a*b2r - 4*a*b3r)*s2*s3^3*s4^3
    + (2*b*b2r - 2*b*b3r)*s2*s3^3*s4^2 + (2*a*b*b1r - 4*a*b*b2r +
    2*a*b*b3r)*s2*s3^3*s4 + (-2*b^2*b1r + 2*b^2*b3r)*s2*s3^3 + (-4*a*b1r +
    4*a*b2r)*s2*s3^2*s4^4 + (-2*b*b2r + 2*b*b3r)*s2*s3^2*s4^3 + (-4*a*b*b1r +
    2*a*b*b2r + 2*a*b*b3r)*s2*s3^2*s4^2 + (2*b^2*b1r - 4*b^2*b2r +
    2*b^2*b3r)*s2*s3^2*s4 + (2*a*b*b1r + 2*a*b*b2r - 4*a*b*b3r)*s2*s3*s4^3 +
    (2*b^2*b1r + 2*b^2*b2r - 4*b^2*b3r)*s2*s3*s4^2 + (-2*b^2*b1r +
    2*b^2*b2r)*s2*s4^3 + (-2*b*b1r + 2*b*b3r)*s3^4*s4^2 + (4*b*b1r - 2*b*b2r -
    2*b*b3r)*s3^3*s4^3 + (2*a*b*b2r - 2*a*b*b3r)*s3^3*s4^2 + (2*b^2*b1r -
    2*b^2*b3r)*s3^3*s4 + (-2*b*b1r + 2*b*b2r)*s3^2*s4^4 + (-2*a*b*b2r +
    2*a*b*b3r)*s3^2*s4^3 + (-4*b^2*b1r + 2*b^2*b2r + 2*b^2*b3r)*s3^2*s4^2 +
    (2*b^2*b1r - 2*b^2*b2r)*s3*s4^3)*y^3*z +
((4*b2r - 4*b3r)*s2^4*s3^2*s4 + (-a*b2r + a*b3r)*s2^4*s3^2 + (-4*b2r +
    4*b3r)*s2^4*s3*s4^2 + (-2*b*b2r + 2*b*b3r)*s2^4*s3 + (a*b2r - a*b3r)*s2^4*s4^2
    + (2*b*b2r - 2*b*b3r)*s2^4*s4 + (-4*b1r - 4*b2r + 8*b3r)*s2^3*s3^3*s4 + (a*b1r
    + a*b2r - 2*a*b3r)*s2^3*s3^3 + (8*b1r - 4*b2r - 4*b3r)*s2^3*s3^2*s4^2 +
    (-a*b1r + a*b2r)*s2^3*s3^2*s4 + (a^2*b1r - a^2*b2r + 4*b*b1r - 2*b*b2r -
    2*b*b3r)*s2^3*s3^2 + (-4*b1r + 8*b2r - 4*b3r)*s2^3*s3*s4^3 + (-a*b1r +
    a*b3r)*s2^3*s3*s4^2 + (-2*a^2*b1r + a^2*b2r + a^2*b3r - 8*b*b1r + 4*b*b2r +
    4*b*b3r)*s2^3*s3*s4 + (-a*b*b2r + a*b*b3r)*s2^3*s3 + (a*b1r - 2*a*b2r +
    a*b3r)*s2^3*s4^3 + (a^2*b1r - a^2*b3r + 4*b*b1r - 2*b*b2r - 2*b*b3r)*s2^3*s4^2
    + (a*b*b2r - a*b*b3r)*s2^3*s4 + (4*b1r - 4*b3r)*s2^2*s3^4*s4 + (-a*b1r +
    a*b3r)*s2^2*s3^4 + (-4*b1r + 8*b2r - 4*b3r)*s2^2*s3^3*s4^2 + (a*b1r -
    a*b2r)*s2^2*s3^3*s4 + (-a^2*b1r + a^2*b2r - 2*b*b1r + 4*b*b2r -
    2*b*b3r)*s2^2*s3^3 + (-4*b1r - 4*b2r + 8*b3r)*s2^2*s3^2*s4^3 + (a^2*b1r +
    a^2*b2r - 2*a^2*b3r + 2*b*b1r + 2*b*b2r - 4*b*b3r)*s2^2*s3^2*s4 + (a*b*b1r +
    a*b*b2r - 2*a*b*b3r)*s2^2*s3^2 + (4*b1r - 4*b2r)*s2^2*s3*s4^4 + (a*b1r -
    a*b3r)*s2^2*s3*s4^3 + (a^2*b1r - 2*a^2*b2r + a^2*b3r + 2*b*b1r - 4*b*b2r +
    2*b*b3r)*s2^2*s3*s4^2 + (-2*a*b*b1r + a*b*b2r + a*b*b3r)*s2^2*s3*s4 + (-a*b1r
    + a*b2r)*s2^2*s4^4 + (-a^2*b1r + a^2*b3r - 2*b*b1r - 2*b*b2r +
    4*b*b3r)*s2^2*s4^3 + (a*b*b1r - 2*a*b*b2r + a*b*b3r)*s2^2*s4^2 + (-4*b1r +
    4*b3r)*s2*s3^4*s4^2 + (-2*b*b1r + 2*b*b3r)*s2*s3^4 + (8*b1r - 4*b2r -
    4*b3r)*s2*s3^3*s4^3 + (-a*b2r + a*b3r)*s2*s3^3*s4^2 + (a^2*b1r - 2*a^2*b2r +
    a^2*b3r + 4*b*b1r - 8*b*b2r + 4*b*b3r)*s2*s3^3*s4 + (-a*b*b1r +
    a*b*b3r)*s2*s3^3 + (-4*b1r + 4*b2r)*s2*s3^2*s4^4 + (a*b2r -
    a*b3r)*s2*s3^2*s4^3 + (-2*a^2*b1r + a^2*b2r + a^2*b3r - 4*b*b1r + 2*b*b2r +
    2*b*b3r)*s2*s3^2*s4^2 + (a*b*b1r - 2*a*b*b2r + a*b*b3r)*s2*s3^2*s4 + (a^2*b1r
    + a^2*b2r - 2*a^2*b3r + 4*b*b1r + 4*b*b2r - 8*b*b3r)*s2*s3*s4^3 + (a*b*b1r +
    a*b*b2r - 2*a*b*b3r)*s2*s3*s4^2 + (-2*b*b1r + 2*b*b2r)*s2*s4^4 + (-a*b*b1r +
    a*b*b2r)*s2*s4^3 + (a*b1r - a*b3r)*s3^4*s4^2 + (2*b*b1r - 2*b*b3r)*s3^4*s4 +
    (-2*a*b1r + a*b2r + a*b3r)*s3^3*s4^3 + (a^2*b2r - a^2*b3r - 2*b*b1r + 4*b*b2r
    - 2*b*b3r)*s3^3*s4^2 + (a*b*b1r - a*b*b3r)*s3^3*s4 + (a*b1r - a*b2r)*s3^2*s4^4
    + (-a^2*b2r + a^2*b3r - 2*b*b1r - 2*b*b2r + 4*b*b3r)*s3^2*s4^3 + (-2*a*b*b1r +
    a*b*b2r + a*b*b3r)*s3^2*s4^2 + (2*b*b1r - 2*b*b2r)*s3*s4^4 + (a*b*b1r -
    a*b*b2r)*s3*s4^3)*y^2*z^2 +
((-2*b2r + 2*b3r)*s2^4*s3^2 + (2*b2r - 2*b3r)*s2^4*s4^2 + (2*b1r + 2*b2r -
    4*b3r)*s2^3*s3^3 + (-2*b1r + 2*b2r)*s2^3*s3^2*s4 + (2*a*b1r -
    2*a*b2r)*s2^3*s3^2 + (-2*b1r + 2*b3r)*s2^3*s3*s4^2 + (-4*a*b1r + 2*a*b2r +
    2*a*b3r)*s2^3*s3*s4 + (2*b*b2r - 2*b*b3r)*s2^3*s3 + (2*b1r - 4*b2r +
    2*b3r)*s2^3*s4^3 + (2*a*b1r - 2*a*b3r)*s2^3*s4^2 + (-2*b*b2r +
    2*b*b3r)*s2^3*s4 + (-2*b1r + 2*b3r)*s2^2*s3^4 + (2*b1r - 2*b2r)*s2^2*s3^3*s4 +
    (-2*a*b1r + 2*a*b2r)*s2^2*s3^3 + (2*a*b1r + 2*a*b2r - 4*a*b3r)*s2^2*s3^2*s4 +
    (-2*b*b1r - 2*b*b2r + 4*b*b3r)*s2^2*s3^2 + (2*b1r - 2*b3r)*s2^2*s3*s4^3 +
    (2*a*b1r - 4*a*b2r + 2*a*b3r)*s2^2*s3*s4^2 + (4*b*b1r - 2*b*b2r -
    2*b*b3r)*s2^2*s3*s4 + (-2*b1r + 2*b2r)*s2^2*s4^4 + (-2*a*b1r +
    2*a*b3r)*s2^2*s4^3 + (-2*b*b1r + 4*b*b2r - 2*b*b3r)*s2^2*s4^2 + (-2*b2r +
    2*b3r)*s2*s3^3*s4^2 + (2*a*b1r - 4*a*b2r + 2*a*b3r)*s2*s3^3*s4 + (2*b*b1r -
    2*b*b3r)*s2*s3^3 + (2*b2r - 2*b3r)*s2*s3^2*s4^3 + (-4*a*b1r + 2*a*b2r +
    2*a*b3r)*s2*s3^2*s4^2 + (-2*b*b1r + 4*b*b2r - 2*b*b3r)*s2*s3^2*s4 + (2*a*b1r +
    2*a*b2r - 4*a*b3r)*s2*s3*s4^3 + (-2*b*b1r - 2*b*b2r + 4*b*b3r)*s2*s3*s4^2 +
    (2*b*b1r - 2*b*b2r)*s2*s4^3 + (2*b1r - 2*b3r)*s3^4*s4^2 + (-4*b1r + 2*b2r +
    2*b3r)*s3^3*s4^3 + (2*a*b2r - 2*a*b3r)*s3^3*s4^2 + (-2*b*b1r +
    2*b*b3r)*s3^3*s4 + (2*b1r - 2*b2r)*s3^2*s4^4 + (-2*a*b2r + 2*a*b3r)*s3^2*s4^3
    + (4*b*b1r - 2*b*b2r - 2*b*b3r)*s3^2*s4^2 + (-2*b*b1r + 2*b*b2r)*s3*s4^3)*y*z^3 +
((b2r - b3r)*s2^4*s3 + (-b2r + b3r)*s2^4*s4 + (-b2r + b3r)*s2^3*s3^2 + (a*b2r -
    a*b3r)*s2^3*s3 + (b2r - b3r)*s2^3*s4^2 + (-a*b2r + a*b3r)*s2^3*s4 + (-b1r +
    b3r)*s2^2*s3^3 + (b1r + b2r - 2*b3r)*s2^2*s3^2*s4 + (-a*b1r - a*b2r +
    2*a*b3r)*s2^2*s3^2 + (b1r - 2*b2r + b3r)*s2^2*s3*s4^2 + (2*a*b1r - a*b2r -
    a*b3r)*s2^2*s3*s4 + (-b1r + b2r)*s2^2*s4^3 + (-a*b1r + 2*a*b2r -
    a*b3r)*s2^2*s4^2 + (b1r - b3r)*s2*s3^4 + (a*b1r - a*b3r)*s2*s3^3 + (-2*b1r +
    b2r + b3r)*s2*s3^2*s4^2 + (-a*b1r + 2*a*b2r - a*b3r)*s2*s3^2*s4 + (-a*b1r -
    a*b2r + 2*a*b3r)*s2*s3*s4^2 + (b1r - b2r)*s2*s4^4 + (a*b1r - a*b2r)*s2*s4^3 +
    (-b1r + b3r)*s3^4*s4 + (b1r - b3r)*s3^3*s4^2 + (-a*b1r + a*b3r)*s3^3*s4 + (b1r
    - b2r)*s3^2*s4^3 + (2*a*b1r - a*b2r - a*b3r)*s3^2*s4^2 + (-b1r + b2r)*s3*s4^4
    + (-a*b1r + a*b2r)*s3*s4^3)*z^4;

c := (-b2r^3 + 3*b2r^2*b3r - 3*b2r*b3r^2 + b3r^3)*s2^7*s3^3 + (3*b2r^3 - 9*b2r^2*b3r +
    9*b2r*b3r^2 - 3*b3r^3)*s2^7*s3^2*s4 + (-3*b2r^3 + 9*b2r^2*b3r - 9*b2r*b3r^2 +
    3*b3r^3)*s2^7*s3*s4^2 + (b2r^3 - 3*b2r^2*b3r + 3*b2r*b3r^2 - b3r^3)*s2^7*s4^3
    + (3*b1r*b2r^2 - 6*b1r*b2r*b3r + 3*b1r*b3r^2 + b2r^3 - 6*b2r^2*b3r +
    9*b2r*b3r^2 - 4*b3r^3)*s2^6*s3^4 + (-8*b1r*b2r^2 + 16*b1r*b2r*b3r -
    8*b1r*b3r^2 - b2r^3 + 11*b2r^2*b3r - 19*b2r*b3r^2 + 9*b3r^3)*s2^6*s3^3*s4 +
    (2*a*b1r*b2r^2 - 4*a*b1r*b2r*b3r + 2*a*b1r*b3r^2 - 2*a*b2r^3 + 4*a*b2r^2*b3r -
    2*a*b2r*b3r^2)*s2^6*s3^3 + (10*b1r*b2r^2 - 20*b1r*b2r*b3r + 10*b1r*b3r^2 -
    5*b2r^3 + 5*b2r^2*b3r + 5*b2r*b3r^2 - 5*b3r^3)*s2^6*s3^2*s4^2 +
    (-2*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r - 2*a*b1r*b3r^2 + 4*a*b2r^3 - 10*a*b2r^2*b3r
    + 8*a*b2r*b3r^2 - 2*a*b3r^3)*s2^6*s3^2*s4 + (4*b*b1r*b2r^2 - 8*b*b1r*b2r*b3r +
    4*b*b1r*b3r^2 - 2*b*b2r^3 + 2*b*b2r^2*b3r + 2*b*b2r*b3r^2 -
    2*b*b3r^3)*s2^6*s3^2 + (-8*b1r*b2r^2 + 16*b1r*b2r*b3r - 8*b1r*b3r^2 + 9*b2r^3
    - 19*b2r^2*b3r + 11*b2r*b3r^2 - b3r^3)*s2^6*s3*s4^3 + (-2*a*b1r*b2r^2 +
    4*a*b1r*b2r*b3r - 2*a*b1r*b3r^2 - 2*a*b2r^3 + 8*a*b2r^2*b3r - 10*a*b2r*b3r^2 +
    4*a*b3r^3)*s2^6*s3*s4^2 + (-8*b*b1r*b2r^2 + 16*b*b1r*b2r*b3r - 8*b*b1r*b3r^2 +
    4*b*b2r^3 - 4*b*b2r^2*b3r - 4*b*b2r*b3r^2 + 4*b*b3r^3)*s2^6*s3*s4 +
    (3*b1r*b2r^2 - 6*b1r*b2r*b3r + 3*b1r*b3r^2 - 4*b2r^3 + 9*b2r^2*b3r -
    6*b2r*b3r^2 + b3r^3)*s2^6*s4^4 + (2*a*b1r*b2r^2 - 4*a*b1r*b2r*b3r +
    2*a*b1r*b3r^2 - 2*a*b2r^2*b3r + 4*a*b2r*b3r^2 - 2*a*b3r^3)*s2^6*s4^3 +
    (4*b*b1r*b2r^2 - 8*b*b1r*b2r*b3r + 4*b*b1r*b3r^2 - 2*b*b2r^3 + 2*b*b2r^2*b3r +
    2*b*b2r*b3r^2 - 2*b*b3r^3)*s2^6*s4^2 + (-3*b1r^2*b2r + 3*b1r^2*b3r -
    3*b1r*b2r^2 + 12*b1r*b2r*b3r - 9*b1r*b3r^2 + 3*b2r^2*b3r - 9*b2r*b3r^2 +
    6*b3r^3)*s2^5*s3^5 + (7*b1r^2*b2r - 7*b1r^2*b3r + b1r*b2r^2 - 16*b1r*b2r*b3r +
    15*b1r*b3r^2 - 2*b2r^3 + 5*b2r^2*b3r + 3*b2r*b3r^2 - 6*b3r^3)*s2^5*s3^4*s4 +
    (-4*a*b1r^2*b2r + 4*a*b1r^2*b3r + 2*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r -
    6*a*b1r*b3r^2 + 2*a*b2r^3 - 8*a*b2r^2*b3r + 6*a*b2r*b3r^2)*s2^5*s3^4 +
    (-6*b1r^2*b2r + 6*b1r^2*b3r + 4*b1r*b2r^2 + 4*b1r*b2r*b3r - 8*b1r*b3r^2 +
    9*b2r^3 - 31*b2r^2*b3r + 29*b2r*b3r^2 - 7*b3r^3)*s2^5*s3^3*s4^2 +
    (8*a*b1r^2*b2r - 8*a*b1r^2*b3r - 18*a*b1r*b2r^2 + 20*a*b1r*b2r*b3r -
    2*a*b1r*b3r^2 + 2*a*b2r^3 + 12*a*b2r^2*b3r - 22*a*b2r*b3r^2 +
    8*a*b3r^3)*s2^5*s3^3*s4 + (-a^2*b1r^2*b2r + a^2*b1r^2*b3r + 2*a^2*b1r*b2r^2 -
    2*a^2*b1r*b2r*b3r - a^2*b2r^3 + a^2*b2r^2*b3r - 4*b*b1r^2*b2r + 4*b*b1r^2*b3r
    - 6*b*b1r*b2r^2 + 20*b*b1r*b2r*b3r - 14*b*b1r*b3r^2 + 2*b*b2r^3 -
    10*b*b2r*b3r^2 + 8*b*b3r^3)*s2^5*s3^3 + (6*b1r^2*b2r - 6*b1r^2*b3r -
    8*b1r*b2r^2 + 4*b1r*b2r*b3r + 4*b1r*b3r^2 - 7*b2r^3 + 29*b2r^2*b3r -
    31*b2r*b3r^2 + 9*b3r^3)*s2^5*s3^2*s4^3 + (24*a*b1r*b2r^2 - 48*a*b1r*b2r*b3r +
    24*a*b1r*b3r^2 - 12*a*b2r^3 + 12*a*b2r^2*b3r + 12*a*b2r*b3r^2 -
    12*a*b3r^3)*s2^5*s3^2*s4^2 + (3*a^2*b1r^2*b2r - 3*a^2*b1r^2*b3r -
    4*a^2*b1r*b2r^2 + 2*a^2*b1r*b2r*b3r + 2*a^2*b1r*b3r^2 + a^2*b2r^3 +
    a^2*b2r^2*b3r - 2*a^2*b2r*b3r^2 + 12*b*b1r^2*b2r - 12*b*b1r^2*b3r -
    2*b*b1r*b2r^2 - 20*b*b1r*b2r*b3r + 22*b*b1r*b3r^2 + 2*b*b2r^3 - 4*b*b2r^2*b3r
    + 14*b*b2r*b3r^2 - 12*b*b3r^3)*s2^5*s3^2*s4 + (2*a*b*b1r*b2r^2 -
    4*a*b*b1r*b2r*b3r + 2*a*b*b1r*b3r^2 - 2*a*b*b2r^3 + 4*a*b*b2r^2*b3r -
    2*a*b*b2r*b3r^2)*s2^5*s3^2 + (-7*b1r^2*b2r + 7*b1r^2*b3r + 15*b1r*b2r^2 -
    16*b1r*b2r*b3r + b1r*b3r^2 - 6*b2r^3 + 3*b2r^2*b3r + 5*b2r*b3r^2 -
    2*b3r^3)*s2^5*s3*s4^4 + (-8*a*b1r^2*b2r + 8*a*b1r^2*b3r - 2*a*b1r*b2r^2 +
    20*a*b1r*b2r*b3r - 18*a*b1r*b3r^2 + 8*a*b2r^3 - 22*a*b2r^2*b3r +
    12*a*b2r*b3r^2 + 2*a*b3r^3)*s2^5*s3*s4^3 + (-3*a^2*b1r^2*b2r + 3*a^2*b1r^2*b3r
    + 2*a^2*b1r*b2r^2 + 2*a^2*b1r*b2r*b3r - 4*a^2*b1r*b3r^2 - 2*a^2*b2r^2*b3r +
    a^2*b2r*b3r^2 + a^2*b3r^3 - 12*b*b1r^2*b2r + 12*b*b1r^2*b3r + 22*b*b1r*b2r^2 -
    20*b*b1r*b2r*b3r - 2*b*b1r*b3r^2 - 12*b*b2r^3 + 14*b*b2r^2*b3r - 4*b*b2r*b3r^2
    + 2*b*b3r^3)*s2^5*s3*s4^2 + (-4*a*b*b1r*b2r^2 + 8*a*b*b1r*b2r*b3r -
    4*a*b*b1r*b3r^2 + 2*a*b*b2r^3 - 2*a*b*b2r^2*b3r - 2*a*b*b2r*b3r^2 +
    2*a*b*b3r^3)*s2^5*s3*s4 + (-b^2*b2r^3 + 3*b^2*b2r^2*b3r - 3*b^2*b2r*b3r^2 +
    b^2*b3r^3)*s2^5*s3 + (3*b1r^2*b2r - 3*b1r^2*b3r - 9*b1r*b2r^2 + 12*b1r*b2r*b3r
    - 3*b1r*b3r^2 + 6*b2r^3 - 9*b2r^2*b3r + 3*b2r*b3r^2)*s2^5*s4^5 +
    (4*a*b1r^2*b2r - 4*a*b1r^2*b3r - 6*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r +
    2*a*b1r*b3r^2 + 6*a*b2r^2*b3r - 8*a*b2r*b3r^2 + 2*a*b3r^3)*s2^5*s4^4 +
    (a^2*b1r^2*b2r - a^2*b1r^2*b3r - 2*a^2*b1r*b2r*b3r + 2*a^2*b1r*b3r^2 +
    a^2*b2r*b3r^2 - a^2*b3r^3 + 4*b*b1r^2*b2r - 4*b*b1r^2*b3r - 14*b*b1r*b2r^2 +
    20*b*b1r*b2r*b3r - 6*b*b1r*b3r^2 + 8*b*b2r^3 - 10*b*b2r^2*b3r +
    2*b*b3r^3)*s2^5*s4^3 + (2*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r + 2*a*b*b1r*b3r^2
    - 2*a*b*b2r^2*b3r + 4*a*b*b2r*b3r^2 - 2*a*b*b3r^3)*s2^5*s4^2 + (b^2*b2r^3 -
    3*b^2*b2r^2*b3r + 3*b^2*b2r*b3r^2 - b^2*b3r^3)*s2^5*s4 + (b1r^3 + 3*b1r^2*b2r
    - 6*b1r^2*b3r - 6*b1r*b2r*b3r + 9*b1r*b3r^2 + 3*b2r*b3r^2 - 4*b3r^3)*s2^4*s3^6
    + (-2*b1r^3 + b1r^2*b2r + 5*b1r^2*b3r + 7*b1r*b2r^2 - 16*b1r*b2r*b3r +
    3*b1r*b3r^2 - 7*b2r^2*b3r + 15*b2r*b3r^2 - 6*b3r^3)*s2^4*s3^5*s4 + (2*a*b1r^3
    + 2*a*b1r^2*b2r - 8*a*b1r^2*b3r - 4*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r +
    6*a*b1r*b3r^2 + 4*a*b2r^2*b3r - 6*a*b2r*b3r^2)*s2^4*s3^5 + (-b1r^3 -
    8*b1r^2*b2r + 11*b1r^2*b3r - 8*b1r*b2r^2 + 32*b1r*b2r*b3r - 27*b1r*b3r^2 -
    b2r^3 + 11*b2r^2*b3r - 27*b2r*b3r^2 + 18*b3r^3)*s2^4*s3^4*s4^2 + (-6*a*b1r^3 +
    12*a*b1r^2*b2r + 6*a*b1r^2*b3r + 12*a*b1r*b2r^2 - 48*a*b1r*b2r*b3r +
    18*a*b1r*b3r^2 - 6*a*b2r^3 + 6*a*b2r^2*b3r + 18*a*b2r*b3r^2 -
    12*a*b3r^3)*s2^4*s3^4*s4 + (a^2*b1r^3 - a^2*b1r^2*b2r - 2*a^2*b1r^2*b3r -
    a^2*b1r*b2r^2 + 4*a^2*b1r*b2r*b3r + a^2*b2r^3 - 2*a^2*b2r^2*b3r +
    6*b*b1r^2*b2r - 6*b*b1r^2*b3r + 6*b*b1r*b2r^2 - 24*b*b1r*b2r*b3r +
    18*b*b1r*b3r^2 - 6*b*b2r^2*b3r + 18*b*b2r*b3r^2 - 12*b*b3r^3)*s2^4*s3^4 +
    (4*b1r^3 - 6*b1r^2*b2r - 6*b1r^2*b3r + 16*b1r*b2r^2 - 20*b1r*b2r*b3r +
    16*b1r*b3r^2 - 7*b2r^3 + 5*b2r^2*b3r + 5*b2r*b3r^2 - 7*b3r^3)*s2^4*s3^3*s4^3 +
    (4*a*b1r^3 - 40*a*b1r^2*b2r + 28*a*b1r^2*b3r + 18*a*b1r*b2r^2 +
    44*a*b1r*b2r*b3r - 50*a*b1r*b3r^2 + 10*a*b2r^3 - 48*a*b2r^2*b3r +
    26*a*b2r*b3r^2 + 8*a*b3r^3)*s2^4*s3^3*s4^2 + (-4*a^2*b1r^3 + 5*a^2*b1r^2*b2r +
    7*a^2*b1r^2*b3r - 4*a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r - 6*a^2*b1r*b3r^2 +
    3*a^2*b2r^3 - 5*a^2*b2r^2*b3r + 6*a^2*b2r*b3r^2 - 12*b*b1r^2*b2r +
    12*b*b1r^2*b3r + 10*b*b1r*b2r^2 + 4*b*b1r*b2r*b3r - 14*b*b1r*b3r^2 - 6*b*b2r^3
    + 8*b*b2r^2*b3r - 10*b*b2r*b3r^2 + 8*b*b3r^3)*s2^4*s3^3*s4 + (-4*a*b*b1r^2*b2r
    + 4*a*b*b1r^2*b3r + 2*a*b*b1r*b2r^2 + 4*a*b*b1r*b2r*b3r - 6*a*b*b1r*b3r^2 +
    2*a*b*b2r^3 - 8*a*b*b2r^2*b3r + 6*a*b*b2r*b3r^2)*s2^4*s3^3 + (-b1r^3 +
    11*b1r^2*b2r - 8*b1r^2*b3r - 27*b1r*b2r^2 + 32*b1r*b2r*b3r - 8*b1r*b3r^2 +
    18*b2r^3 - 27*b2r^2*b3r + 11*b2r*b3r^2 - b3r^3)*s2^4*s3^2*s4^4 + (4*a*b1r^3 +
    28*a*b1r^2*b2r - 40*a*b1r^2*b3r - 50*a*b1r*b2r^2 + 44*a*b1r*b2r*b3r +
    18*a*b1r*b3r^2 + 8*a*b2r^3 + 26*a*b2r^2*b3r - 48*a*b2r*b3r^2 +
    10*a*b3r^3)*s2^4*s3^2*s4^3 + (6*a^2*b1r^3 - 9*a^2*b1r^2*b2r - 9*a^2*b1r^2*b3r
    + 11*a^2*b1r*b2r^2 - 4*a^2*b1r*b2r*b3r + 11*a^2*b1r*b3r^2 - 4*a^2*b2r^3 +
    a^2*b2r^2*b3r + a^2*b2r*b3r^2 - 4*a^2*b3r^3 - 20*b*b1r*b2r^2 +
    40*b*b1r*b2r*b3r - 20*b*b1r*b3r^2 + 10*b*b2r^3 - 10*b*b2r^2*b3r -
    10*b*b2r*b3r^2 + 10*b*b3r^3)*s2^4*s3^2*s4^2 + (12*a*b*b1r^2*b2r -
    12*a*b*b1r^2*b3r - 10*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r + 14*a*b*b1r*b3r^2 +
    6*a*b*b2r^3 - 8*a*b*b2r^2*b3r + 10*a*b*b2r*b3r^2 - 8*a*b*b3r^3)*s2^4*s3^2*s4 +
    (3*b^2*b1r*b2r^2 - 6*b^2*b1r*b2r*b3r + 3*b^2*b1r*b3r^2 + b^2*b2r^3 -
    6*b^2*b2r^2*b3r + 9*b^2*b2r*b3r^2 - 4*b^2*b3r^3)*s2^4*s3^2 + (-2*b1r^3 +
    5*b1r^2*b2r + b1r^2*b3r + 3*b1r*b2r^2 - 16*b1r*b2r*b3r + 7*b1r*b3r^2 - 6*b2r^3
    + 15*b2r^2*b3r - 7*b2r*b3r^2)*s2^4*s3*s4^5 + (-6*a*b1r^3 + 6*a*b1r^2*b2r +
    12*a*b1r^2*b3r + 18*a*b1r*b2r^2 - 48*a*b1r*b2r*b3r + 12*a*b1r*b3r^2 -
    12*a*b2r^3 + 18*a*b2r^2*b3r + 6*a*b2r*b3r^2 - 6*a*b3r^3)*s2^4*s3*s4^4 +
    (-4*a^2*b1r^3 + 7*a^2*b1r^2*b2r + 5*a^2*b1r^2*b3r - 6*a^2*b1r*b2r^2 -
    2*a^2*b1r*b2r*b3r - 4*a^2*b1r*b3r^2 + 6*a^2*b2r^2*b3r - 5*a^2*b2r*b3r^2 +
    3*a^2*b3r^3 + 12*b*b1r^2*b2r - 12*b*b1r^2*b3r - 14*b*b1r*b2r^2 +
    4*b*b1r*b2r*b3r + 10*b*b1r*b3r^2 + 8*b*b2r^3 - 10*b*b2r^2*b3r + 8*b*b2r*b3r^2
    - 6*b*b3r^3)*s2^4*s3*s4^3 + (-12*a*b*b1r^2*b2r + 12*a*b*b1r^2*b3r +
    14*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r - 10*a*b*b1r*b3r^2 - 8*a*b*b2r^3 +
    10*a*b*b2r^2*b3r - 8*a*b*b2r*b3r^2 + 6*a*b*b3r^3)*s2^4*s3*s4^2 +
    (-6*b^2*b1r*b2r^2 + 12*b^2*b1r*b2r*b3r - 6*b^2*b1r*b3r^2 + 3*b^2*b2r^3 -
    3*b^2*b2r^2*b3r - 3*b^2*b2r*b3r^2 + 3*b^2*b3r^3)*s2^4*s3*s4 + (b1r^3 -
    6*b1r^2*b2r + 3*b1r^2*b3r + 9*b1r*b2r^2 - 6*b1r*b2r*b3r - 4*b2r^3 +
    3*b2r^2*b3r)*s2^4*s4^6 + (2*a*b1r^3 - 8*a*b1r^2*b2r + 2*a*b1r^2*b3r +
    6*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r - 4*a*b1r*b3r^2 - 6*a*b2r^2*b3r +
    4*a*b2r*b3r^2)*s2^4*s4^5 + (a^2*b1r^3 - 2*a^2*b1r^2*b2r - a^2*b1r^2*b3r +
    4*a^2*b1r*b2r*b3r - a^2*b1r*b3r^2 - 2*a^2*b2r*b3r^2 + a^2*b3r^3 -
    6*b*b1r^2*b2r + 6*b*b1r^2*b3r + 18*b*b1r*b2r^2 - 24*b*b1r*b2r*b3r +
    6*b*b1r*b3r^2 - 12*b*b2r^3 + 18*b*b2r^2*b3r - 6*b*b2r*b3r^2)*s2^4*s4^4 +
    (4*a*b*b1r^2*b2r - 4*a*b*b1r^2*b3r - 6*a*b*b1r*b2r^2 + 4*a*b*b1r*b2r*b3r +
    2*a*b*b1r*b3r^2 + 6*a*b*b2r^2*b3r - 8*a*b*b2r*b3r^2 + 2*a*b*b3r^3)*s2^4*s4^3 +
    (3*b^2*b1r*b2r^2 - 6*b^2*b1r*b2r*b3r + 3*b^2*b1r*b3r^2 - 4*b^2*b2r^3 +
    9*b^2*b2r^2*b3r - 6*b^2*b2r*b3r^2 + b^2*b3r^3)*s2^4*s4^2 + (-b1r^3 +
    3*b1r^2*b3r - 3*b1r*b3r^2 + b3r^3)*s2^3*s3^7 + (-b1r^3 - 8*b1r^2*b2r +
    11*b1r^2*b3r + 16*b1r*b2r*b3r - 19*b1r*b3r^2 - 8*b2r*b3r^2 +
    9*b3r^3)*s2^3*s3^6*s4 + (-2*a*b1r^3 + 2*a*b1r^2*b2r + 4*a*b1r^2*b3r -
    4*a*b1r*b2r*b3r - 2*a*b1r*b3r^2 + 2*a*b2r*b3r^2)*s2^3*s3^6 + (9*b1r^3 +
    4*b1r^2*b2r - 31*b1r^2*b3r - 6*b1r*b2r^2 + 4*b1r*b2r*b3r + 29*b1r*b3r^2 +
    6*b2r^2*b3r - 8*b2r*b3r^2 - 7*b3r^3)*s2^3*s3^5*s4^2 + (2*a*b1r^3 -
    18*a*b1r^2*b2r + 12*a*b1r^2*b3r + 8*a*b1r*b2r^2 + 20*a*b1r*b2r*b3r -
    22*a*b1r*b3r^2 - 8*a*b2r^2*b3r - 2*a*b2r*b3r^2 + 8*a*b3r^3)*s2^3*s3^5*s4 +
    (-a^2*b1r^3 + 2*a^2*b1r^2*b2r + a^2*b1r^2*b3r - a^2*b1r*b2r^2 -
    2*a^2*b1r*b2r*b3r + a^2*b2r^2*b3r + 2*b*b1r^3 - 6*b*b1r^2*b2r - 4*b*b1r*b2r^2
    + 20*b*b1r*b2r*b3r - 10*b*b1r*b3r^2 + 4*b*b2r^2*b3r - 14*b*b2r*b3r^2 +
    8*b*b3r^3)*s2^3*s3^5 + (-7*b1r^3 + 16*b1r^2*b2r + 5*b1r^2*b3r - 6*b1r*b2r^2 -
    20*b1r*b2r*b3r + 5*b1r*b3r^2 + 4*b2r^3 - 6*b2r^2*b3r + 16*b2r*b3r^2 -
    7*b3r^3)*s2^3*s3^4*s4^3 + (10*a*b1r^3 + 18*a*b1r^2*b2r - 48*a*b1r^2*b3r -
    40*a*b1r*b2r^2 + 44*a*b1r*b2r*b3r + 26*a*b1r*b3r^2 + 4*a*b2r^3 +
    28*a*b2r^2*b3r - 50*a*b2r*b3r^2 + 8*a*b3r^3)*s2^3*s3^4*s4^2 + (3*a^2*b1r^3 -
    4*a^2*b1r^2*b2r - 5*a^2*b1r^2*b3r + 5*a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r +
    6*a^2*b1r*b3r^2 - 4*a^2*b2r^3 + 7*a^2*b2r^2*b3r - 6*a^2*b2r*b3r^2 - 6*b*b1r^3
    + 10*b*b1r^2*b2r + 8*b*b1r^2*b3r - 12*b*b1r*b2r^2 + 4*b*b1r*b2r*b3r -
    10*b*b1r*b3r^2 + 12*b*b2r^2*b3r - 14*b*b2r*b3r^2 + 8*b*b3r^3)*s2^3*s3^4*s4 +
    (2*a*b*b1r^3 + 2*a*b*b1r^2*b2r - 8*a*b*b1r^2*b3r - 4*a*b*b1r*b2r^2 +
    4*a*b*b1r*b2r*b3r + 6*a*b*b1r*b3r^2 + 4*a*b*b2r^2*b3r -
    6*a*b*b2r*b3r^2)*s2^3*s3^4 + (-7*b1r^3 + 5*b1r^2*b2r + 16*b1r^2*b3r +
    5*b1r*b2r^2 - 20*b1r*b2r*b3r - 6*b1r*b3r^2 - 7*b2r^3 + 16*b2r^2*b3r -
    6*b2r*b3r^2 + 4*b3r^3)*s2^3*s3^3*s4^4 + (-20*a*b1r^3 + 30*a*b1r^2*b2r +
    30*a*b1r^2*b3r + 30*a*b1r*b2r^2 - 120*a*b1r*b2r*b3r + 30*a*b1r*b3r^2 -
    20*a*b2r^3 + 30*a*b2r^2*b3r + 30*a*b2r*b3r^2 - 20*a*b3r^3)*s2^3*s3^3*s4^3 +
    (-2*a^2*b1r^3 - a^2*b1r^2*b2r + 7*a^2*b1r^2*b3r - a^2*b1r*b2r^2 +
    4*a^2*b1r*b2r*b3r - 9*a^2*b1r*b3r^2 - 2*a^2*b2r^3 + 7*a^2*b2r^2*b3r -
    9*a^2*b2r*b3r^2 + 6*a^2*b3r^3 + 4*b*b1r^3 + 6*b*b1r^2*b2r - 18*b*b1r^2*b3r +
    6*b*b1r*b2r^2 - 24*b*b1r*b2r*b3r + 30*b*b1r*b3r^2 + 4*b*b2r^3 - 18*b*b2r^2*b3r
    + 30*b*b2r*b3r^2 - 20*b*b3r^3)*s2^3*s3^3*s4^2 + (-8*a*b*b1r^3 +
    2*a*b*b1r^2*b2r + 22*a*b*b1r^2*b3r + 2*a*b*b1r*b2r^2 - 8*a*b*b1r*b2r*b3r -
    18*a*b*b1r*b3r^2 - 8*a*b*b2r^3 + 22*a*b*b2r^2*b3r - 18*a*b*b2r*b3r^2 +
    12*a*b*b3r^3)*s2^3*s3^3*s4 + (-3*b^2*b1r^2*b2r + 3*b^2*b1r^2*b3r -
    3*b^2*b1r*b2r^2 + 12*b^2*b1r*b2r*b3r - 9*b^2*b1r*b3r^2 + 3*b^2*b2r^2*b3r -
    9*b^2*b2r*b3r^2 + 6*b^2*b3r^3)*s2^3*s3^3 + (9*b1r^3 - 31*b1r^2*b2r +
    4*b1r^2*b3r + 29*b1r*b2r^2 + 4*b1r*b2r*b3r - 6*b1r*b3r^2 - 7*b2r^3 -
    8*b2r^2*b3r + 6*b2r*b3r^2)*s2^3*s3^2*s4^5 + (10*a*b1r^3 - 48*a*b1r^2*b2r +
    18*a*b1r^2*b3r + 26*a*b1r*b2r^2 + 44*a*b1r*b2r*b3r - 40*a*b1r*b3r^2 +
    8*a*b2r^3 - 50*a*b2r^2*b3r + 28*a*b2r*b3r^2 + 4*a*b3r^3)*s2^3*s3^2*s4^4 +
    (-2*a^2*b1r^3 + 7*a^2*b1r^2*b2r - a^2*b1r^2*b3r - 9*a^2*b1r*b2r^2 +
    4*a^2*b1r*b2r*b3r - a^2*b1r*b3r^2 + 6*a^2*b2r^3 - 9*a^2*b2r^2*b3r +
    7*a^2*b2r*b3r^2 - 2*a^2*b3r^3 + 4*b*b1r^3 - 18*b*b1r^2*b2r + 6*b*b1r^2*b3r +
    30*b*b1r*b2r^2 - 24*b*b1r*b2r*b3r + 6*b*b1r*b3r^2 - 20*b*b2r^3 +
    30*b*b2r^2*b3r - 18*b*b2r*b3r^2 + 4*b*b3r^3)*s2^3*s3^2*s4^3 + (12*a*b*b1r^3 -
    18*a*b*b1r^2*b2r - 18*a*b*b1r^2*b3r + 14*a*b*b1r*b2r^2 + 8*a*b*b1r*b2r*b3r +
    14*a*b*b1r*b3r^2 - 4*a*b*b2r^3 - 2*a*b*b2r^2*b3r - 2*a*b*b2r*b3r^2 -
    4*a*b*b3r^3)*s2^3*s3^2*s4^2 + (9*b^2*b1r^2*b2r - 9*b^2*b1r^2*b3r -
    3*b^2*b1r*b2r^2 - 12*b^2*b1r*b2r*b3r + 15*b^2*b1r*b3r^2 - 4*b^2*b2r^3 +
    15*b^2*b2r^2*b3r - 9*b^2*b2r*b3r^2 - 2*b^2*b3r^3)*s2^3*s3^2*s4 + (-b1r^3 +
    11*b1r^2*b2r - 8*b1r^2*b3r - 19*b1r*b2r^2 + 16*b1r*b2r*b3r + 9*b2r^3 -
    8*b2r^2*b3r)*s2^3*s3*s4^6 + (2*a*b1r^3 + 12*a*b1r^2*b2r - 18*a*b1r^2*b3r -
    22*a*b1r*b2r^2 + 20*a*b1r*b2r*b3r + 8*a*b1r*b3r^2 + 8*a*b2r^3 - 2*a*b2r^2*b3r
    - 8*a*b2r*b3r^2)*s2^3*s3*s4^5 + (3*a^2*b1r^3 - 5*a^2*b1r^2*b2r -
    4*a^2*b1r^2*b3r + 6*a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r + 5*a^2*b1r*b3r^2 -
    6*a^2*b2r^2*b3r + 7*a^2*b2r*b3r^2 - 4*a^2*b3r^3 - 6*b*b1r^3 + 8*b*b1r^2*b2r +
    10*b*b1r^2*b3r - 10*b*b1r*b2r^2 + 4*b*b1r*b2r*b3r - 12*b*b1r*b3r^2 + 8*b*b2r^3
    - 14*b*b2r^2*b3r + 12*b*b2r*b3r^2)*s2^3*s3*s4^4 + (-8*a*b*b1r^3 +
    22*a*b*b1r^2*b2r + 2*a*b*b1r^2*b3r - 18*a*b*b1r*b2r^2 - 8*a*b*b1r*b2r*b3r +
    2*a*b*b1r*b3r^2 + 12*a*b*b2r^3 - 18*a*b*b2r^2*b3r + 22*a*b*b2r*b3r^2 -
    8*a*b*b3r^3)*s2^3*s3*s4^3 + (-9*b^2*b1r^2*b2r + 9*b^2*b1r^2*b3r +
    15*b^2*b1r*b2r^2 - 12*b^2*b1r*b2r*b3r - 3*b^2*b1r*b3r^2 - 2*b^2*b2r^3 -
    9*b^2*b2r^2*b3r + 15*b^2*b2r*b3r^2 - 4*b^2*b3r^3)*s2^3*s3*s4^2 + (-b1r^3 +
    3*b1r^2*b2r - 3*b1r*b2r^2 + b2r^3)*s2^3*s4^7 + (-2*a*b1r^3 + 4*a*b1r^2*b2r +
    2*a*b1r^2*b3r - 2*a*b1r*b2r^2 - 4*a*b1r*b2r*b3r + 2*a*b2r^2*b3r)*s2^3*s4^6 +
    (-a^2*b1r^3 + a^2*b1r^2*b2r + 2*a^2*b1r^2*b3r - 2*a^2*b1r*b2r*b3r -
    a^2*b1r*b3r^2 + a^2*b2r*b3r^2 + 2*b*b1r^3 - 6*b*b1r^2*b3r - 10*b*b1r*b2r^2 +
    20*b*b1r*b2r*b3r - 4*b*b1r*b3r^2 + 8*b*b2r^3 - 14*b*b2r^2*b3r +
    4*b*b2r*b3r^2)*s2^3*s4^5 + (2*a*b*b1r^3 - 8*a*b*b1r^2*b2r + 2*a*b*b1r^2*b3r +
    6*a*b*b1r*b2r^2 + 4*a*b*b1r*b2r*b3r - 4*a*b*b1r*b3r^2 - 6*a*b*b2r^2*b3r +
    4*a*b*b2r*b3r^2)*s2^3*s4^4 + (3*b^2*b1r^2*b2r - 3*b^2*b1r^2*b3r -
    9*b^2*b1r*b2r^2 + 12*b^2*b1r*b2r*b3r - 3*b^2*b1r*b3r^2 + 6*b^2*b2r^3 -
    9*b^2*b2r^2*b3r + 3*b^2*b2r*b3r^2)*s2^3*s4^3 + (3*b1r^3 - 9*b1r^2*b3r +
    9*b1r*b3r^2 - 3*b3r^3)*s2^2*s3^7*s4 + (-5*b1r^3 + 10*b1r^2*b2r + 5*b1r^2*b3r -
    20*b1r*b2r*b3r + 5*b1r*b3r^2 + 10*b2r*b3r^2 - 5*b3r^3)*s2^2*s3^6*s4^2 +
    (4*a*b1r^3 - 2*a*b1r^2*b2r - 10*a*b1r^2*b3r + 4*a*b1r*b2r*b3r + 8*a*b1r*b3r^2
    - 2*a*b2r*b3r^2 - 2*a*b3r^3)*s2^2*s3^6*s4 + (-2*b*b1r^3 + 4*b*b1r^2*b2r +
    2*b*b1r^2*b3r - 8*b*b1r*b2r*b3r + 2*b*b1r*b3r^2 + 4*b*b2r*b3r^2 -
    2*b*b3r^3)*s2^2*s3^6 + (-7*b1r^3 - 8*b1r^2*b2r + 29*b1r^2*b3r + 6*b1r*b2r^2 +
    4*b1r*b2r*b3r - 31*b1r*b3r^2 - 6*b2r^2*b3r + 4*b2r*b3r^2 +
    9*b3r^3)*s2^2*s3^5*s4^3 + (-12*a*b1r^3 + 24*a*b1r^2*b2r + 12*a*b1r^2*b3r -
    48*a*b1r*b2r*b3r + 12*a*b1r*b3r^2 + 24*a*b2r*b3r^2 -
    12*a*b3r^3)*s2^2*s3^5*s4^2 + (a^2*b1r^3 - 4*a^2*b1r^2*b2r + a^2*b1r^2*b3r +
    3*a^2*b1r*b2r^2 + 2*a^2*b1r*b2r*b3r - 2*a^2*b1r*b3r^2 - 3*a^2*b2r^2*b3r +
    2*a^2*b2r*b3r^2 + 2*b*b1r^3 - 2*b*b1r^2*b2r - 4*b*b1r^2*b3r + 12*b*b1r*b2r^2 -
    20*b*b1r*b2r*b3r + 14*b*b1r*b3r^2 - 12*b*b2r^2*b3r + 22*b*b2r*b3r^2 -
    12*b*b3r^3)*s2^2*s3^5*s4 + (-2*a*b*b1r^3 + 2*a*b*b1r^2*b2r + 4*a*b*b1r^2*b3r -
    4*a*b*b1r*b2r*b3r - 2*a*b*b1r*b3r^2 + 2*a*b*b2r*b3r^2)*s2^2*s3^5 + (18*b1r^3 -
    27*b1r^2*b2r - 27*b1r^2*b3r + 11*b1r*b2r^2 + 32*b1r*b2r*b3r + 11*b1r*b3r^2 -
    b2r^3 - 8*b2r^2*b3r - 8*b2r*b3r^2 - b3r^3)*s2^2*s3^4*s4^4 + (8*a*b1r^3 -
    50*a*b1r^2*b2r + 26*a*b1r^2*b3r + 28*a*b1r*b2r^2 + 44*a*b1r*b2r*b3r -
    48*a*b1r*b3r^2 + 4*a*b2r^3 - 40*a*b2r^2*b3r + 18*a*b2r*b3r^2 +
    10*a*b3r^3)*s2^2*s3^4*s4^3 + (-4*a^2*b1r^3 + 11*a^2*b1r^2*b2r + a^2*b1r^2*b3r
    - 9*a^2*b1r*b2r^2 - 4*a^2*b1r*b2r*b3r + a^2*b1r*b3r^2 + 6*a^2*b2r^3 -
    9*a^2*b2r^2*b3r + 11*a^2*b2r*b3r^2 - 4*a^2*b3r^3 + 10*b*b1r^3 - 20*b*b1r^2*b2r
    - 10*b*b1r^2*b3r + 40*b*b1r*b2r*b3r - 10*b*b1r*b3r^2 - 20*b*b2r*b3r^2 +
    10*b*b3r^3)*s2^2*s3^4*s4^2 + (6*a*b*b1r^3 - 10*a*b*b1r^2*b2r - 8*a*b*b1r^2*b3r
    + 12*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r + 10*a*b*b1r*b3r^2 - 12*a*b*b2r^2*b3r +
    14*a*b*b2r*b3r^2 - 8*a*b*b3r^3)*s2^2*s3^4*s4 + (b^2*b1r^3 + 3*b^2*b1r^2*b2r -
    6*b^2*b1r^2*b3r - 6*b^2*b1r*b2r*b3r + 9*b^2*b1r*b3r^2 + 3*b^2*b2r*b3r^2 -
    4*b^2*b3r^3)*s2^2*s3^4 + (-7*b1r^3 + 29*b1r^2*b2r - 8*b1r^2*b3r - 31*b1r*b2r^2
    + 4*b1r*b2r*b3r + 6*b1r*b3r^2 + 9*b2r^3 + 4*b2r^2*b3r -
    6*b2r*b3r^2)*s2^2*s3^3*s4^5 + (8*a*b1r^3 + 26*a*b1r^2*b2r - 50*a*b1r^2*b3r -
    48*a*b1r*b2r^2 + 44*a*b1r*b2r*b3r + 28*a*b1r*b3r^2 + 10*a*b2r^3 +
    18*a*b2r^2*b3r - 40*a*b2r*b3r^2 + 4*a*b3r^3)*s2^2*s3^3*s4^4 + (6*a^2*b1r^3 -
    9*a^2*b1r^2*b2r - 9*a^2*b1r^2*b3r + 7*a^2*b1r*b2r^2 + 4*a^2*b1r*b2r*b3r +
    7*a^2*b1r*b3r^2 - 2*a^2*b2r^3 - a^2*b2r^2*b3r - a^2*b2r*b3r^2 - 2*a^2*b3r^3 -
    20*b*b1r^3 + 30*b*b1r^2*b2r + 30*b*b1r^2*b3r - 18*b*b1r*b2r^2 -
    24*b*b1r*b2r*b3r - 18*b*b1r*b3r^2 + 4*b*b2r^3 + 6*b*b2r^2*b3r + 6*b*b2r*b3r^2
    + 4*b*b3r^3)*s2^2*s3^3*s4^3 + (-4*a*b*b1r^3 + 14*a*b*b1r^2*b2r -
    2*a*b*b1r^2*b3r - 18*a*b*b1r*b2r^2 + 8*a*b*b1r*b2r*b3r - 2*a*b*b1r*b3r^2 +
    12*a*b*b2r^3 - 18*a*b*b2r^2*b3r + 14*a*b*b2r*b3r^2 -
    4*a*b*b3r^3)*s2^2*s3^3*s4^2 + (-4*b^2*b1r^3 - 3*b^2*b1r^2*b2r +
    15*b^2*b1r^2*b3r + 9*b^2*b1r*b2r^2 - 12*b^2*b1r*b2r*b3r - 9*b^2*b1r*b3r^2 -
    9*b^2*b2r^2*b3r + 15*b^2*b2r*b3r^2 - 2*b^2*b3r^3)*s2^2*s3^3*s4 + (-5*b1r^3 +
    5*b1r^2*b2r + 10*b1r^2*b3r + 5*b1r*b2r^2 - 20*b1r*b2r*b3r - 5*b2r^3 +
    10*b2r^2*b3r)*s2^2*s3^2*s4^6 + (-12*a*b1r^3 + 12*a*b1r^2*b2r + 24*a*b1r^2*b3r
    + 12*a*b1r*b2r^2 - 48*a*b1r*b2r*b3r - 12*a*b2r^3 +
    24*a*b2r^2*b3r)*s2^2*s3^2*s4^5 + (-4*a^2*b1r^3 + a^2*b1r^2*b2r +
    11*a^2*b1r^2*b3r + a^2*b1r*b2r^2 - 4*a^2*b1r*b2r*b3r - 9*a^2*b1r*b3r^2 -
    4*a^2*b2r^3 + 11*a^2*b2r^2*b3r - 9*a^2*b2r*b3r^2 + 6*a^2*b3r^3 + 10*b*b1r^3 -
    10*b*b1r^2*b2r - 20*b*b1r^2*b3r - 10*b*b1r*b2r^2 + 40*b*b1r*b2r*b3r +
    10*b*b2r^3 - 20*b*b2r^2*b3r)*s2^2*s3^2*s4^4 + (-4*a*b*b1r^3 - 2*a*b*b1r^2*b2r
    + 14*a*b*b1r^2*b3r - 2*a*b*b1r*b2r^2 + 8*a*b*b1r*b2r*b3r - 18*a*b*b1r*b3r^2 -
    4*a*b*b2r^3 + 14*a*b*b2r^2*b3r - 18*a*b*b2r*b3r^2 +
    12*a*b*b3r^3)*s2^2*s3^2*s4^3 + (6*b^2*b1r^3 - 9*b^2*b1r^2*b2r -
    9*b^2*b1r^2*b3r - 9*b^2*b1r*b2r^2 + 36*b^2*b1r*b2r*b3r - 9*b^2*b1r*b3r^2 +
    6*b^2*b2r^3 - 9*b^2*b2r^2*b3r - 9*b^2*b2r*b3r^2 + 6*b^2*b3r^3)*s2^2*s3^2*s4^2
    + (3*b1r^3 - 9*b1r^2*b2r + 9*b1r*b2r^2 - 3*b2r^3)*s2^2*s3*s4^7 + (4*a*b1r^3 -
    10*a*b1r^2*b2r - 2*a*b1r^2*b3r + 8*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r - 2*a*b2r^3 -
    2*a*b2r^2*b3r)*s2^2*s3*s4^6 + (a^2*b1r^3 + a^2*b1r^2*b2r - 4*a^2*b1r^2*b3r -
    2*a^2*b1r*b2r^2 + 2*a^2*b1r*b2r*b3r + 3*a^2*b1r*b3r^2 + 2*a^2*b2r^2*b3r -
    3*a^2*b2r*b3r^2 + 2*b*b1r^3 - 4*b*b1r^2*b2r - 2*b*b1r^2*b3r + 14*b*b1r*b2r^2 -
    20*b*b1r*b2r*b3r + 12*b*b1r*b3r^2 - 12*b*b2r^3 + 22*b*b2r^2*b3r -
    12*b*b2r*b3r^2)*s2^2*s3*s4^5 + (6*a*b*b1r^3 - 8*a*b*b1r^2*b2r -
    10*a*b*b1r^2*b3r + 10*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r + 12*a*b*b1r*b3r^2 -
    8*a*b*b2r^3 + 14*a*b*b2r^2*b3r - 12*a*b*b2r*b3r^2)*s2^2*s3*s4^4 +
    (-4*b^2*b1r^3 + 15*b^2*b1r^2*b2r - 3*b^2*b1r^2*b3r - 9*b^2*b1r*b2r^2 -
    12*b^2*b1r*b2r*b3r + 9*b^2*b1r*b3r^2 - 2*b^2*b2r^3 + 15*b^2*b2r^2*b3r -
    9*b^2*b2r*b3r^2)*s2^2*s3*s4^3 + (-2*b*b1r^3 + 2*b*b1r^2*b2r + 4*b*b1r^2*b3r +
    2*b*b1r*b2r^2 - 8*b*b1r*b2r*b3r - 2*b*b2r^3 + 4*b*b2r^2*b3r)*s2^2*s4^6 +
    (-2*a*b*b1r^3 + 4*a*b*b1r^2*b2r + 2*a*b*b1r^2*b3r - 2*a*b*b1r*b2r^2 -
    4*a*b*b1r*b2r*b3r + 2*a*b*b2r^2*b3r)*s2^2*s4^5 + (b^2*b1r^3 - 6*b^2*b1r^2*b2r
    + 3*b^2*b1r^2*b3r + 9*b^2*b1r*b2r^2 - 6*b^2*b1r*b2r*b3r - 4*b^2*b2r^3 +
    3*b^2*b2r^2*b3r)*s2^2*s4^4 + (-3*b1r^3 + 9*b1r^2*b3r - 9*b1r*b3r^2 +
    3*b3r^3)*s2*s3^7*s4^2 + (9*b1r^3 - 8*b1r^2*b2r - 19*b1r^2*b3r + 16*b1r*b2r*b3r
    + 11*b1r*b3r^2 - 8*b2r*b3r^2 - b3r^3)*s2*s3^6*s4^3 + (-2*a*b1r^3 -
    2*a*b1r^2*b2r + 8*a*b1r^2*b3r + 4*a*b1r*b2r*b3r - 10*a*b1r*b3r^2 -
    2*a*b2r*b3r^2 + 4*a*b3r^3)*s2*s3^6*s4^2 + (4*b*b1r^3 - 8*b*b1r^2*b2r -
    4*b*b1r^2*b3r + 16*b*b1r*b2r*b3r - 4*b*b1r*b3r^2 - 8*b*b2r*b3r^2 +
    4*b*b3r^3)*s2*s3^6*s4 + (-6*b1r^3 + 15*b1r^2*b2r + 3*b1r^2*b3r - 7*b1r*b2r^2 -
    16*b1r*b2r*b3r + 5*b1r*b3r^2 + 7*b2r^2*b3r + b2r*b3r^2 - 2*b3r^3)*s2*s3^5*s4^4
    + (8*a*b1r^3 - 2*a*b1r^2*b2r - 22*a*b1r^2*b3r - 8*a*b1r*b2r^2 +
    20*a*b1r*b2r*b3r + 12*a*b1r*b3r^2 + 8*a*b2r^2*b3r - 18*a*b2r*b3r^2 +
    2*a*b3r^3)*s2*s3^5*s4^3 + (2*a^2*b1r^2*b2r - 2*a^2*b1r^2*b3r - 3*a^2*b1r*b2r^2
    + 2*a^2*b1r*b2r*b3r + a^2*b1r*b3r^2 + 3*a^2*b2r^2*b3r - 4*a^2*b2r*b3r^2 +
    a^2*b3r^3 - 12*b*b1r^3 + 22*b*b1r^2*b2r + 14*b*b1r^2*b3r - 12*b*b1r*b2r^2 -
    20*b*b1r*b2r*b3r - 4*b*b1r*b3r^2 + 12*b*b2r^2*b3r - 2*b*b2r*b3r^2 +
    2*b*b3r^3)*s2*s3^5*s4^2 + (2*a*b*b1r^3 - 4*a*b*b1r^2*b2r - 2*a*b*b1r^2*b3r +
    8*a*b*b1r*b2r*b3r - 2*a*b*b1r*b3r^2 - 4*a*b*b2r*b3r^2 +
    2*a*b*b3r^3)*s2*s3^5*s4 + (-b^2*b1r^3 + 3*b^2*b1r^2*b3r - 3*b^2*b1r*b3r^2 +
    b^2*b3r^3)*s2*s3^5 + (-6*b1r^3 + 3*b1r^2*b2r + 15*b1r^2*b3r + 5*b1r*b2r^2 -
    16*b1r*b2r*b3r - 7*b1r*b3r^2 - 2*b2r^3 + b2r^2*b3r + 7*b2r*b3r^2)*s2*s3^4*s4^5
    + (-12*a*b1r^3 + 18*a*b1r^2*b2r + 18*a*b1r^2*b3r + 6*a*b1r*b2r^2 -
    48*a*b1r*b2r*b3r + 6*a*b1r*b3r^2 - 6*a*b2r^3 + 12*a*b2r^2*b3r + 12*a*b2r*b3r^2
    - 6*a*b3r^3)*s2*s3^4*s4^4 + (-6*a^2*b1r^2*b2r + 6*a^2*b1r^2*b3r +
    7*a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r - 5*a^2*b1r*b3r^2 - 4*a^2*b2r^3 +
    5*a^2*b2r^2*b3r - 4*a^2*b2r*b3r^2 + 3*a^2*b3r^3 + 8*b*b1r^3 - 14*b*b1r^2*b2r -
    10*b*b1r^2*b3r + 12*b*b1r*b2r^2 + 4*b*b1r*b2r*b3r + 8*b*b1r*b3r^2 -
    12*b*b2r^2*b3r + 10*b*b2r*b3r^2 - 6*b*b3r^3)*s2*s3^4*s4^3 + (-8*a*b*b1r^3 +
    14*a*b*b1r^2*b2r + 10*a*b*b1r^2*b3r - 12*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r -
    8*a*b*b1r*b3r^2 + 12*a*b*b2r^2*b3r - 10*a*b*b2r*b3r^2 +
    6*a*b*b3r^3)*s2*s3^4*s4^2 + (3*b^2*b1r^3 - 6*b^2*b1r^2*b2r - 3*b^2*b1r^2*b3r +
    12*b^2*b1r*b2r*b3r - 3*b^2*b1r*b3r^2 - 6*b^2*b2r*b3r^2 +
    3*b^2*b3r^3)*s2*s3^4*s4 + (9*b1r^3 - 19*b1r^2*b2r - 8*b1r^2*b3r + 11*b1r*b2r^2
    + 16*b1r*b2r*b3r - b2r^3 - 8*b2r^2*b3r)*s2*s3^3*s4^6 + (8*a*b1r^3 -
    22*a*b1r^2*b2r - 2*a*b1r^2*b3r + 12*a*b1r*b2r^2 + 20*a*b1r*b2r*b3r -
    8*a*b1r*b3r^2 + 2*a*b2r^3 - 18*a*b2r^2*b3r + 8*a*b2r*b3r^2)*s2*s3^3*s4^5 +
    (6*a^2*b1r^2*b2r - 6*a^2*b1r^2*b3r - 5*a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r +
    7*a^2*b1r*b3r^2 + 3*a^2*b2r^3 - 4*a^2*b2r^2*b3r + 5*a^2*b2r*b3r^2 -
    4*a^2*b3r^3 + 8*b*b1r^3 - 10*b*b1r^2*b2r - 14*b*b1r^2*b3r + 8*b*b1r*b2r^2 +
    4*b*b1r*b2r*b3r + 12*b*b1r*b3r^2 - 6*b*b2r^3 + 10*b*b2r^2*b3r -
    12*b*b2r*b3r^2)*s2*s3^3*s4^4 + (12*a*b*b1r^3 - 18*a*b*b1r^2*b2r -
    18*a*b*b1r^2*b3r + 22*a*b*b1r*b2r^2 - 8*a*b*b1r*b2r*b3r + 22*a*b*b1r*b3r^2 -
    8*a*b*b2r^3 + 2*a*b*b2r^2*b3r + 2*a*b*b2r*b3r^2 - 8*a*b*b3r^3)*s2*s3^3*s4^3 +
    (-2*b^2*b1r^3 + 15*b^2*b1r^2*b2r - 9*b^2*b1r^2*b3r - 9*b^2*b1r*b2r^2 -
    12*b^2*b1r*b2r*b3r + 15*b^2*b1r*b3r^2 + 9*b^2*b2r^2*b3r - 3*b^2*b2r*b3r^2 -
    4*b^2*b3r^3)*s2*s3^3*s4^2 + (-3*b1r^3 + 9*b1r^2*b2r - 9*b1r*b2r^2 +
    3*b2r^3)*s2*s3^2*s4^7 + (-2*a*b1r^3 + 8*a*b1r^2*b2r - 2*a*b1r^2*b3r -
    10*a*b1r*b2r^2 + 4*a*b1r*b2r*b3r + 4*a*b2r^3 - 2*a*b2r^2*b3r)*s2*s3^2*s4^6 +
    (-2*a^2*b1r^2*b2r + 2*a^2*b1r^2*b3r + a^2*b1r*b2r^2 + 2*a^2*b1r*b2r*b3r -
    3*a^2*b1r*b3r^2 + a^2*b2r^3 - 4*a^2*b2r^2*b3r + 3*a^2*b2r*b3r^2 - 12*b*b1r^3 +
    14*b*b1r^2*b2r + 22*b*b1r^2*b3r - 4*b*b1r*b2r^2 - 20*b*b1r*b2r*b3r -
    12*b*b1r*b3r^2 + 2*b*b2r^3 - 2*b*b2r^2*b3r + 12*b*b2r*b3r^2)*s2*s3^2*s4^5 +
    (-8*a*b*b1r^3 + 10*a*b*b1r^2*b2r + 14*a*b*b1r^2*b3r - 8*a*b*b1r*b2r^2 -
    4*a*b*b1r*b2r*b3r - 12*a*b*b1r*b3r^2 + 6*a*b*b2r^3 - 10*a*b*b2r^2*b3r +
    12*a*b*b2r*b3r^2)*s2*s3^2*s4^4 + (-2*b^2*b1r^3 - 9*b^2*b1r^2*b2r +
    15*b^2*b1r^2*b3r + 15*b^2*b1r*b2r^2 - 12*b^2*b1r*b2r*b3r - 9*b^2*b1r*b3r^2 -
    4*b^2*b2r^3 - 3*b^2*b2r^2*b3r + 9*b^2*b2r*b3r^2)*s2*s3^2*s4^3 + (4*b*b1r^3 -
    4*b*b1r^2*b2r - 8*b*b1r^2*b3r - 4*b*b1r*b2r^2 + 16*b*b1r*b2r*b3r + 4*b*b2r^3 -
    8*b*b2r^2*b3r)*s2*s3*s4^6 + (2*a*b*b1r^3 - 2*a*b*b1r^2*b2r - 4*a*b*b1r^2*b3r -
    2*a*b*b1r*b2r^2 + 8*a*b*b1r*b2r*b3r + 2*a*b*b2r^3 -
    4*a*b*b2r^2*b3r)*s2*s3*s4^5 + (3*b^2*b1r^3 - 3*b^2*b1r^2*b2r - 6*b^2*b1r^2*b3r
    - 3*b^2*b1r*b2r^2 + 12*b^2*b1r*b2r*b3r + 3*b^2*b2r^3 -
    6*b^2*b2r^2*b3r)*s2*s3*s4^4 + (-b^2*b1r^3 + 3*b^2*b1r^2*b2r - 3*b^2*b1r*b2r^2
    + b^2*b2r^3)*s2*s4^5 + (b1r^3 - 3*b1r^2*b3r + 3*b1r*b3r^2 - b3r^3)*s3^7*s4^3 +
    (-4*b1r^3 + 3*b1r^2*b2r + 9*b1r^2*b3r - 6*b1r*b2r*b3r - 6*b1r*b3r^2 +
    3*b2r*b3r^2 + b3r^3)*s3^6*s4^4 + (2*a*b1r^2*b2r - 2*a*b1r^2*b3r -
    4*a*b1r*b2r*b3r + 4*a*b1r*b3r^2 + 2*a*b2r*b3r^2 - 2*a*b3r^3)*s3^6*s4^3 +
    (-2*b*b1r^3 + 4*b*b1r^2*b2r + 2*b*b1r^2*b3r - 8*b*b1r*b2r*b3r + 2*b*b1r*b3r^2
    + 4*b*b2r*b3r^2 - 2*b*b3r^3)*s3^6*s4^2 + (6*b1r^3 - 9*b1r^2*b2r - 9*b1r^2*b3r
    + 3*b1r*b2r^2 + 12*b1r*b2r*b3r + 3*b1r*b3r^2 - 3*b2r^2*b3r -
    3*b2r*b3r^2)*s3^5*s4^5 + (-6*a*b1r^2*b2r + 6*a*b1r^2*b3r + 4*a*b1r*b2r^2 +
    4*a*b1r*b2r*b3r - 8*a*b1r*b3r^2 - 4*a*b2r^2*b3r + 2*a*b2r*b3r^2 +
    2*a*b3r^3)*s3^5*s4^4 + (a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r + a^2*b1r*b3r^2 -
    a^2*b2r^2*b3r + 2*a^2*b2r*b3r^2 - a^2*b3r^3 + 8*b*b1r^3 - 14*b*b1r^2*b2r -
    10*b*b1r^2*b3r + 4*b*b1r*b2r^2 + 20*b*b1r*b2r*b3r - 4*b*b2r^2*b3r -
    6*b*b2r*b3r^2 + 2*b*b3r^3)*s3^5*s4^3 + (2*a*b*b1r^2*b2r - 2*a*b*b1r^2*b3r -
    4*a*b*b1r*b2r*b3r + 4*a*b*b1r*b3r^2 + 2*a*b*b2r*b3r^2 - 2*a*b*b3r^3)*s3^5*s4^2
    + (b^2*b1r^3 - 3*b^2*b1r^2*b3r + 3*b^2*b1r*b3r^2 - b^2*b3r^3)*s3^5*s4 +
    (-4*b1r^3 + 9*b1r^2*b2r + 3*b1r^2*b3r - 6*b1r*b2r^2 - 6*b1r*b2r*b3r + b2r^3 +
    3*b2r^2*b3r)*s3^4*s4^6 + (6*a*b1r^2*b2r - 6*a*b1r^2*b3r - 8*a*b1r*b2r^2 +
    4*a*b1r*b2r*b3r + 4*a*b1r*b3r^2 + 2*a*b2r^3 + 2*a*b2r^2*b3r -
    4*a*b2r*b3r^2)*s3^4*s4^5 + (-2*a^2*b1r*b2r^2 + 4*a^2*b1r*b2r*b3r -
    2*a^2*b1r*b3r^2 + a^2*b2r^3 - a^2*b2r^2*b3r - a^2*b2r*b3r^2 + a^2*b3r^3 -
    12*b*b1r^3 + 18*b*b1r^2*b2r + 18*b*b1r^2*b3r - 6*b*b1r*b2r^2 -
    24*b*b1r*b2r*b3r - 6*b*b1r*b3r^2 + 6*b*b2r^2*b3r + 6*b*b2r*b3r^2)*s3^4*s4^4 +
    (-6*a*b*b1r^2*b2r + 6*a*b*b1r^2*b3r + 4*a*b*b1r*b2r^2 + 4*a*b*b1r*b2r*b3r -
    8*a*b*b1r*b3r^2 - 4*a*b*b2r^2*b3r + 2*a*b*b2r*b3r^2 + 2*a*b*b3r^3)*s3^4*s4^3 +
    (-4*b^2*b1r^3 + 3*b^2*b1r^2*b2r + 9*b^2*b1r^2*b3r - 6*b^2*b1r*b2r*b3r -
    6*b^2*b1r*b3r^2 + 3*b^2*b2r*b3r^2 + b^2*b3r^3)*s3^4*s4^2 + (b1r^3 -
    3*b1r^2*b2r + 3*b1r*b2r^2 - b2r^3)*s3^3*s4^7 + (-2*a*b1r^2*b2r + 2*a*b1r^2*b3r
    + 4*a*b1r*b2r^2 - 4*a*b1r*b2r*b3r - 2*a*b2r^3 + 2*a*b2r^2*b3r)*s3^3*s4^6 +
    (a^2*b1r*b2r^2 - 2*a^2*b1r*b2r*b3r + a^2*b1r*b3r^2 - a^2*b2r^3 +
    2*a^2*b2r^2*b3r - a^2*b2r*b3r^2 + 8*b*b1r^3 - 10*b*b1r^2*b2r - 14*b*b1r^2*b3r
    + 20*b*b1r*b2r*b3r + 4*b*b1r*b3r^2 + 2*b*b2r^3 - 6*b*b2r^2*b3r -
    4*b*b2r*b3r^2)*s3^3*s4^5 + (6*a*b*b1r^2*b2r - 6*a*b*b1r^2*b3r -
    8*a*b*b1r*b2r^2 + 4*a*b*b1r*b2r*b3r + 4*a*b*b1r*b3r^2 + 2*a*b*b2r^3 +
    2*a*b*b2r^2*b3r - 4*a*b*b2r*b3r^2)*s3^3*s4^4 + (6*b^2*b1r^3 - 9*b^2*b1r^2*b2r
    - 9*b^2*b1r^2*b3r + 3*b^2*b1r*b2r^2 + 12*b^2*b1r*b2r*b3r + 3*b^2*b1r*b3r^2 -
    3*b^2*b2r^2*b3r - 3*b^2*b2r*b3r^2)*s3^3*s4^3 + (-2*b*b1r^3 + 2*b*b1r^2*b2r +
    4*b*b1r^2*b3r + 2*b*b1r*b2r^2 - 8*b*b1r*b2r*b3r - 2*b*b2r^3 +
    4*b*b2r^2*b3r)*s3^2*s4^6 + (-2*a*b*b1r^2*b2r + 2*a*b*b1r^2*b3r +
    4*a*b*b1r*b2r^2 - 4*a*b*b1r*b2r*b3r - 2*a*b*b2r^3 + 2*a*b*b2r^2*b3r)*s3^2*s4^5
    + (-4*b^2*b1r^3 + 9*b^2*b1r^2*b2r + 3*b^2*b1r^2*b3r - 6*b^2*b1r*b2r^2 -
    6*b^2*b1r*b2r*b3r + b^2*b2r^3 + 3*b^2*b2r^2*b3r)*s3^2*s4^4 + (b^2*b1r^3 -
    3*b^2*b1r^2*b2r + 3*b^2*b1r*b2r^2 - b^2*b2r^3)*s3*s4^5;

F3 := Evaluate(F3, [x,z,y]);
return F3, c;

end function;


function GluingFormula(invrs, invss, ab);
/*
Let X1 be the curve given by u^2 = (t - r1) (t - r2) (t - r3) (t - r4), and
let X2 be the curve given by u^2 = (t - s1) (t - s2) (t - s3) (t - s4) (t^2 + a t + b).

Consider the quotient of (Jac (X1) x Jac (X2)) / G by the isotropic subgroup generated by the divisors ([(r2, 0)] - [(r1, 0)], [(s2, 0)] - [(s1, 0)]), ([(r3, 0)] - [(r1, 0)], [(s3, 0)] - [(s1, 0)]), ([(r4, 0)] - [(r1, 0)], [(s4, 0)] - [(s1, 0)]). If this quotient is a twist of a Jacobian of a non-hyperelliptic curve X3, as is generically the case, then this function returns an ternary polynomial F3 defining X3 and a scalar c specifying what quadratic twist to take.

The function respects the base field, so that in particular compatible Galois structures on the differences { r2 - r1, r3 - r1, r4 - r1 } and { s2 - s1, s3 - s1, s4 - s1 } will yield a curve over the base field. It works in every characteristic except 2.

Twists of the input curves can be dealt with by adding a quadratic twist or a twist in the plane variable x.

Invariants were taken in advance.
*/

assert #invrs eq 5;
assert #invss eq 5;
assert #ab eq 2;

L := Parent(ab[1]);
S<x,y,z> := PolynomialRing(L, 3);

a1r, a3r, b1r, b2r, b3r := Explode(invrs);
a1s, a3s, b1s, b2s, b3s := Explode(invss);
a, b := Explode(ab);

discr := b1r^2*b2r - b1r^2*b3r - b1r*b2r^2 + b1r*b3r^2 + b2r^2*b3r - b2r*b3r^2;
discs := b1s^2*b2s - b1s*b2s^2 - b1s^2*b3s + b2s^2*b3s + b1s*b3s^2 - b2s*b3s^2;

f400 := discr*discs;

f220 := (-1/4*b2r^2 + 1/2*b2r*b3r - 1/4*b3r^2)*a1s^3*a3s*b1s^2 + (1/2*b1r*b2r -
    1/2*b1r*b3r - 1/2*b2r*b3r + 1/2*b3r^2)*a1s^3*a3s*b1s*b2s + (-b1r*b2r + b1r*b3r
    + b2r^2 - b2r*b3r)*a1s*a3s*b1s^2*b2s + (1/4*b2r^2 - 1/2*b2r*b3r +
    1/4*b3r^2)*a1s^2*b1s^3*b2s + (-1/4*b1r^2 + 1/2*b1r*b3r -
    1/4*b3r^2)*a1s^3*a3s*b2s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s*a3s*b1s*b2s^2 + (-1/2*b1r*b2r + 1/2*b1r*b3r + 1/2*b2r*b3r -
    1/2*b3r^2)*a1s^2*b1s^2*b2s^2 + (b1r*b2r - b1r*b3r - b2r^2 +
    b2r*b3r)*b1s^3*b2s^2 + (1/4*b1r^2 - 1/2*b1r*b3r + 1/4*b3r^2)*a1s^2*b1s*b2s^3 +
    (-b1r^2 + b1r*b2r + b1r*b3r - b2r*b3r)*b1s^2*b2s^3 + (-1/2*b1r*b2r +
    1/2*b1r*b3r + 1/2*b2r^2 - 1/2*b2r*b3r)*a1s^3*a3s*b1s*b3s + (b1r*b2r - b1r*b3r
    - b2r*b3r + b3r^2)*a1s*a3s*b1s^2*b3s + (1/4*b2r^2 - 1/2*b2r*b3r +
    1/4*b3r^2)*a1s^2*b1s^3*b3s + (1/2*b1r^2 - 1/2*b1r*b2r - 1/2*b1r*b3r +
    1/2*b2r*b3r)*a1s^3*a3s*b2s*b3s + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - 2*b2r^2 +
    2*b2r*b3r - 2*b3r^2)*a1s*a3s*b1s*b2s*b3s + (-1/4*b2r^2 + 1/2*b2r*b3r -
    1/4*b3r^2)*a1s^2*b1s^2*b2s*b3s + (b1r*b2r - b1r*b3r - b2r*b3r +
    b3r^2)*a1s*a3s*b2s^2*b3s + (-1/4*b1r^2 + 1/2*b1r*b3r -
    1/4*b3r^2)*a1s^2*b1s*b2s^2*b3s + (b1r^2 - 2*b1r*b2r + b2r^2)*b1s^2*b2s^2*b3s +
    (1/4*b1r^2 - 1/2*b1r*b3r + 1/4*b3r^2)*a1s^2*b2s^3*b3s + (-1/4*b1r^2 +
    1/2*b1r*b2r - 1/4*b2r^2)*a1s^3*a3s*b3s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s*a3s*b1s*b3s^2 + (1/2*b1r*b2r - 1/2*b1r*b3r - 1/2*b2r^2 +
    1/2*b2r*b3r)*a1s^2*b1s^2*b3s^2 + (-b1r*b2r + b1r*b3r + b2r*b3r -
    b3r^2)*b1s^3*b3s^2 + (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a1s*a3s*b2s*b3s^2
    + (-1/4*b1r^2 + 1/2*b1r*b2r - 1/4*b2r^2)*a1s^2*b1s*b2s*b3s^2 + (b1r^2 -
    2*b1r*b3r + b3r^2)*b1s^2*b2s*b3s^2 + (-1/2*b1r^2 + 1/2*b1r*b2r + 1/2*b1r*b3r -
    1/2*b2r*b3r)*a1s^2*b2s^2*b3s^2 + (b2r^2 - 2*b2r*b3r + b3r^2)*b1s*b2s^2*b3s^2 +
    (-b1r*b2r + b1r*b3r + b2r*b3r - b3r^2)*b2s^3*b3s^2 + (1/4*b1r^2 - 1/2*b1r*b2r
    + 1/4*b2r^2)*a1s^2*b1s*b3s^3 + (-b1r^2 + b1r*b2r + b1r*b3r -
    b2r*b3r)*b1s^2*b3s^3 + (1/4*b1r^2 - 1/2*b1r*b2r + 1/4*b2r^2)*a1s^2*b2s*b3s^3 +
    (b1r*b2r - b1r*b3r - b2r^2 + b2r*b3r)*b2s^2*b3s^3 + (1/2*a*b2r^2 - a*b2r*b3r +
    1/2*a*b3r^2)*a1s^2*a3s*b1s^2 + (-a*b1r*b2r + a*b1r*b3r + a*b2r*b3r -
    a*b3r^2)*a1s^2*a3s*b1s*b2s + (a*b1r*b2r - a*b1r*b3r - a*b2r^2 +
    a*b2r*b3r)*a3s*b1s^2*b2s + (-1/2*a*b2r^2 + a*b2r*b3r -
    1/2*a*b3r^2)*a1s*b1s^3*b2s + (1/2*a*b1r^2 - a*b1r*b3r +
    1/2*a*b3r^2)*a1s^2*a3s*b2s^2 + (-a*b1r^2 + a*b1r*b2r + a*b1r*b3r -
    a*b2r*b3r)*a3s*b1s*b2s^2 + (a*b1r*b2r - a*b1r*b3r - a*b2r*b3r +
    a*b3r^2)*a1s*b1s^2*b2s^2 + (-1/2*a*b1r^2 + a*b1r*b3r -
    1/2*a*b3r^2)*a1s*b1s*b2s^3 + (a*b1r*b2r - a*b1r*b3r - a*b2r^2 +
    a*b2r*b3r)*a1s^2*a3s*b1s*b3s + (-a*b1r*b2r + a*b1r*b3r + a*b2r*b3r -
    a*b3r^2)*a3s*b1s^2*b3s + (-1/2*a*b2r^2 + a*b2r*b3r -
    1/2*a*b3r^2)*a1s*b1s^3*b3s + (-a*b1r^2 + a*b1r*b2r + a*b1r*b3r -
    a*b2r*b3r)*a1s^2*a3s*b2s*b3s + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r +
    2*a*b2r^2 - 2*a*b2r*b3r + 2*a*b3r^2)*a3s*b1s*b2s*b3s + (1/2*a*b2r^2 -
    a*b2r*b3r + 1/2*a*b3r^2)*a1s*b1s^2*b2s*b3s + (-a*b1r*b2r + a*b1r*b3r +
    a*b2r*b3r - a*b3r^2)*a3s*b2s^2*b3s + (1/2*a*b1r^2 - a*b1r*b3r +
    1/2*a*b3r^2)*a1s*b1s*b2s^2*b3s + (-1/2*a*b1r^2 + a*b1r*b3r -
    1/2*a*b3r^2)*a1s*b2s^3*b3s + (1/2*a*b1r^2 - a*b1r*b2r +
    1/2*a*b2r^2)*a1s^2*a3s*b3s^2 + (-a*b1r^2 + a*b1r*b2r + a*b1r*b3r -
    a*b2r*b3r)*a3s*b1s*b3s^2 + (-a*b1r*b2r + a*b1r*b3r + a*b2r^2 -
    a*b2r*b3r)*a1s*b1s^2*b3s^2 + (a*b1r*b2r - a*b1r*b3r - a*b2r^2 +
    a*b2r*b3r)*a3s*b2s*b3s^2 + (1/2*a*b1r^2 - a*b1r*b2r +
    1/2*a*b2r^2)*a1s*b1s*b2s*b3s^2 + (a*b1r^2 - a*b1r*b2r - a*b1r*b3r +
    a*b2r*b3r)*a1s*b2s^2*b3s^2 + (-1/2*a*b1r^2 + a*b1r*b2r -
    1/2*a*b2r^2)*a1s*b1s*b3s^3 + (-1/2*a*b1r^2 + a*b1r*b2r -
    1/2*a*b2r^2)*a1s*b2s*b3s^3 + (-b*b2r^2 + 2*b*b2r*b3r - b*b3r^2)*a1s*a3s*b1s^2
    + (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r*b3r + 2*b*b3r^2)*a1s*a3s*b1s*b2s +
    (-2*b*b1r*b2r + 2*b*b1r*b3r + 2*b*b2r^2 - 2*b*b2r*b3r)*b1s^3*b2s + (-b*b1r^2 +
    2*b*b1r*b3r - b*b3r^2)*a1s*a3s*b2s^2 + (2*b*b1r^2 - 2*b*b1r*b2r - 2*b*b1r*b3r
    + 2*b*b2r*b3r)*b1s*b2s^3 + (-2*b*b1r*b2r + 2*b*b1r*b3r + 2*b*b2r^2 -
    2*b*b2r*b3r)*a1s*a3s*b1s*b3s + (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r*b3r +
    2*b*b3r^2)*b1s^3*b3s + (2*b*b1r^2 - 2*b*b1r*b2r - 2*b*b1r*b3r +
    2*b*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*b*b2r^2 + 4*b*b2r*b3r -
    2*b*b3r^2)*b1s^2*b2s*b3s + (-2*b*b1r^2 + 4*b*b1r*b3r -
    2*b*b3r^2)*b1s*b2s^2*b3s + (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r*b3r +
    2*b*b3r^2)*b2s^3*b3s + (-b*b1r^2 + 2*b*b1r*b2r - b*b2r^2)*a1s*a3s*b3s^2 +
    (-2*b*b1r^2 + 4*b*b1r*b2r - 2*b*b2r^2)*b1s*b2s*b3s^2 + (2*b*b1r^2 -
    2*b*b1r*b2r - 2*b*b1r*b3r + 2*b*b2r*b3r)*b1s*b3s^3 + (-2*b*b1r*b2r +
    2*b*b1r*b3r + 2*b*b2r^2 - 2*b*b2r*b3r)*b2s*b3s^3;

g211 := (1/2*b2r^2 - b2r*b3r + 1/2*b3r^2)*a1s^2*a3s*b1s^2 + (-b1r*b2r + b1r*b3r + b2r*b3r
    - b3r^2)*a1s^2*a3s*b1s*b2s + (b1r*b2r - b1r*b3r - b2r^2 +
    b2r*b3r)*a3s*b1s^2*b2s + (-1/2*b2r^2 + b2r*b3r - 1/2*b3r^2)*a1s*b1s^3*b2s +
    (1/2*b1r^2 - b1r*b3r + 1/2*b3r^2)*a1s^2*a3s*b2s^2 + (-b1r^2 + b1r*b2r +
    b1r*b3r - b2r*b3r)*a3s*b1s*b2s^2 + (b1r*b2r - b1r*b3r - b2r*b3r +
    b3r^2)*a1s*b1s^2*b2s^2 + (-1/2*b1r^2 + b1r*b3r - 1/2*b3r^2)*a1s*b1s*b2s^3 +
    (b1r*b2r - b1r*b3r - b2r^2 + b2r*b3r)*a1s^2*a3s*b1s*b3s + (-b1r*b2r + b1r*b3r
    + b2r*b3r - b3r^2)*a3s*b1s^2*b3s + (-1/2*b2r^2 + b2r*b3r -
    1/2*b3r^2)*a1s*b1s^3*b3s + (-b1r^2 + b1r*b2r + b1r*b3r -
    b2r*b3r)*a1s^2*a3s*b2s*b3s + (2*b1r^2 - 2*b1r*b2r - 2*b1r*b3r + 2*b2r^2 -
    2*b2r*b3r + 2*b3r^2)*a3s*b1s*b2s*b3s + (1/2*b2r^2 - b2r*b3r +
    1/2*b3r^2)*a1s*b1s^2*b2s*b3s + (-b1r*b2r + b1r*b3r + b2r*b3r -
    b3r^2)*a3s*b2s^2*b3s + (1/2*b1r^2 - b1r*b3r + 1/2*b3r^2)*a1s*b1s*b2s^2*b3s +
    (-1/2*b1r^2 + b1r*b3r - 1/2*b3r^2)*a1s*b2s^3*b3s + (1/2*b1r^2 - b1r*b2r +
    1/2*b2r^2)*a1s^2*a3s*b3s^2 + (-b1r^2 + b1r*b2r + b1r*b3r -
    b2r*b3r)*a3s*b1s*b3s^2 + (-b1r*b2r + b1r*b3r + b2r^2 -
    b2r*b3r)*a1s*b1s^2*b3s^2 + (b1r*b2r - b1r*b3r - b2r^2 + b2r*b3r)*a3s*b2s*b3s^2
    + (1/2*b1r^2 - b1r*b2r + 1/2*b2r^2)*a1s*b1s*b2s*b3s^2 + (b1r^2 - b1r*b2r -
    b1r*b3r + b2r*b3r)*a1s*b2s^2*b3s^2 + (-1/2*b1r^2 + b1r*b2r -
    1/2*b2r^2)*a1s*b1s*b3s^3 + (-1/2*b1r^2 + b1r*b2r - 1/2*b2r^2)*a1s*b2s*b3s^3 +
    (-a*b2r^2 + 2*a*b2r*b3r - a*b3r^2)*a1s*a3s*b1s^2 + (2*a*b1r*b2r - 2*a*b1r*b3r
    - 2*a*b2r*b3r + 2*a*b3r^2)*a1s*a3s*b1s*b2s + (a*b2r^2 - 2*a*b2r*b3r +
    a*b3r^2)*b1s^3*b2s + (-a*b1r^2 + 2*a*b1r*b3r - a*b3r^2)*a1s*a3s*b2s^2 +
    (a*b1r^2 - 4*a*b1r*b2r + 2*a*b1r*b3r + a*b2r^2 + 2*a*b2r*b3r -
    2*a*b3r^2)*b1s^2*b2s^2 + (a*b1r^2 - 2*a*b1r*b3r + a*b3r^2)*b1s*b2s^3 +
    (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 - 2*a*b2r*b3r)*a1s*a3s*b1s*b3s +
    (a*b2r^2 - 2*a*b2r*b3r + a*b3r^2)*b1s^3*b3s + (2*a*b1r^2 - 2*a*b1r*b2r -
    2*a*b1r*b3r + 2*a*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*a*b1r^2 + 2*a*b1r*b2r +
    2*a*b1r*b3r - a*b2r^2 - a*b3r^2)*b1s^2*b2s*b3s + (-a*b1r^2 + 2*a*b1r*b2r -
    2*a*b2r^2 + 2*a*b2r*b3r - a*b3r^2)*b1s*b2s^2*b3s + (a*b1r^2 - 2*a*b1r*b3r +
    a*b3r^2)*b2s^3*b3s + (-a*b1r^2 + 2*a*b1r*b2r - a*b2r^2)*a1s*a3s*b3s^2 +
    (a*b1r^2 + 2*a*b1r*b2r - 4*a*b1r*b3r - 2*a*b2r^2 + 2*a*b2r*b3r +
    a*b3r^2)*b1s^2*b3s^2 + (-a*b1r^2 + 2*a*b1r*b3r - a*b2r^2 + 2*a*b2r*b3r -
    2*a*b3r^2)*b1s*b2s*b3s^2 + (-2*a*b1r^2 + 2*a*b1r*b2r + 2*a*b1r*b3r + a*b2r^2 -
    4*a*b2r*b3r + a*b3r^2)*b2s^2*b3s^2 + (a*b1r^2 - 2*a*b1r*b2r +
    a*b2r^2)*b1s*b3s^3 + (a*b1r^2 - 2*a*b1r*b2r + a*b2r^2)*b2s*b3s^3 + (2*b*b2r^2
    - 4*b*b2r*b3r + 2*b*b3r^2)*a3s*b1s^2 + (-4*b*b1r*b2r + 4*b*b1r*b3r +
    4*b*b2r*b3r - 4*b*b3r^2)*a3s*b1s*b2s + (b*b1r*b2r - b*b1r*b3r - b*b2r^2 +
    b*b2r*b3r)*a1s*b1s^2*b2s + (2*b*b1r^2 - 4*b*b1r*b3r + 2*b*b3r^2)*a3s*b2s^2 +
    (-b*b1r^2 + b*b1r*b2r + b*b1r*b3r - b*b2r*b3r)*a1s*b1s*b2s^2 + (4*b*b1r*b2r -
    4*b*b1r*b3r - 4*b*b2r^2 + 4*b*b2r*b3r)*a3s*b1s*b3s + (-b*b1r*b2r + b*b1r*b3r +
    b*b2r*b3r - b*b3r^2)*a1s*b1s^2*b3s + (-4*b*b1r^2 + 4*b*b1r*b2r + 4*b*b1r*b3r -
    4*b*b2r*b3r)*a3s*b2s*b3s + (2*b*b1r^2 - 2*b*b1r*b2r - 2*b*b1r*b3r + 2*b*b2r^2
    - 2*b*b2r*b3r + 2*b*b3r^2)*a1s*b1s*b2s*b3s + (-b*b1r*b2r + b*b1r*b3r +
    b*b2r*b3r - b*b3r^2)*a1s*b2s^2*b3s + (2*b*b1r^2 - 4*b*b1r*b2r +
    2*b*b2r^2)*a3s*b3s^2 + (-b*b1r^2 + b*b1r*b2r + b*b1r*b3r -
    b*b2r*b3r)*a1s*b1s*b3s^2 + (b*b1r*b2r - b*b1r*b3r - b*b2r^2 +
    b*b2r*b3r)*a1s*b2s*b3s^2;
f211 := -2*g211;

f202 := (-b2r^2 + 2*b2r*b3r - b3r^2)*a1s*a3s*b1s^2 + (2*b1r*b2r - 2*b1r*b3r - 2*b2r*b3r +
    2*b3r^2)*a1s*a3s*b1s*b2s + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 -
    2*b2r*b3r)*b1s^3*b2s + (-b1r^2 + 2*b1r*b3r - b3r^2)*a1s*a3s*b2s^2 + (2*b1r^2 -
    2*b1r*b2r - 2*b1r*b3r + 2*b2r*b3r)*b1s*b2s^3 + (-2*b1r*b2r + 2*b1r*b3r +
    2*b2r^2 - 2*b2r*b3r)*a1s*a3s*b1s*b3s + (2*b1r*b2r - 2*b1r*b3r - 2*b2r*b3r +
    2*b3r^2)*b1s^3*b3s + (2*b1r^2 - 2*b1r*b2r - 2*b1r*b3r +
    2*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*b2r^2 + 4*b2r*b3r - 2*b3r^2)*b1s^2*b2s*b3s +
    (-2*b1r^2 + 4*b1r*b3r - 2*b3r^2)*b1s*b2s^2*b3s + (2*b1r*b2r - 2*b1r*b3r -
    2*b2r*b3r + 2*b3r^2)*b2s^3*b3s + (-b1r^2 + 2*b1r*b2r - b2r^2)*a1s*a3s*b3s^2 +
    (-2*b1r^2 + 4*b1r*b2r - 2*b2r^2)*b1s*b2s*b3s^2 + (2*b1r^2 - 2*b1r*b2r -
    2*b1r*b3r + 2*b2r*b3r)*b1s*b3s^3 + (-2*b1r*b2r + 2*b1r*b3r + 2*b2r^2 -
    2*b2r*b3r)*b2s*b3s^3 + (2*a*b2r^2 - 4*a*b2r*b3r + 2*a*b3r^2)*a3s*b1s^2 +
    (-4*a*b1r*b2r + 4*a*b1r*b3r + 4*a*b2r*b3r - 4*a*b3r^2)*a3s*b1s*b2s +
    (a*b1r*b2r - a*b1r*b3r - a*b2r^2 + a*b2r*b3r)*a1s*b1s^2*b2s + (2*a*b1r^2 -
    4*a*b1r*b3r + 2*a*b3r^2)*a3s*b2s^2 + (-a*b1r^2 + a*b1r*b2r + a*b1r*b3r -
    a*b2r*b3r)*a1s*b1s*b2s^2 + (4*a*b1r*b2r - 4*a*b1r*b3r - 4*a*b2r^2 +
    4*a*b2r*b3r)*a3s*b1s*b3s + (-a*b1r*b2r + a*b1r*b3r + a*b2r*b3r -
    a*b3r^2)*a1s*b1s^2*b3s + (-4*a*b1r^2 + 4*a*b1r*b2r + 4*a*b1r*b3r -
    4*a*b2r*b3r)*a3s*b2s*b3s + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r + 2*a*b2r^2
    - 2*a*b2r*b3r + 2*a*b3r^2)*a1s*b1s*b2s*b3s + (-a*b1r*b2r + a*b1r*b3r +
    a*b2r*b3r - a*b3r^2)*a1s*b2s^2*b3s + (2*a*b1r^2 - 4*a*b1r*b2r +
    2*a*b2r^2)*a3s*b3s^2 + (-a*b1r^2 + a*b1r*b2r + a*b1r*b3r -
    a*b2r*b3r)*a1s*b1s*b3s^2 + (a*b1r*b2r - a*b1r*b3r - a*b2r^2 +
    a*b2r*b3r)*a1s*b2s*b3s^2 + (b*b2r^2 - 2*b*b2r*b3r + b*b3r^2)*a1s^2*b1s^2 +
    (-4*b*b2r^2 + 8*b*b2r*b3r - 4*b*b3r^2)*b1s^3 + (-2*b*b1r*b2r + 2*b*b1r*b3r +
    2*b*b2r*b3r - 2*b*b3r^2)*a1s^2*b1s*b2s + (4*b*b1r*b2r - 4*b*b1r*b3r -
    4*b*b2r*b3r + 4*b*b3r^2)*b1s^2*b2s + (b*b1r^2 - 2*b*b1r*b3r +
    b*b3r^2)*a1s^2*b2s^2 + (4*b*b1r*b2r - 4*b*b1r*b3r - 4*b*b2r*b3r +
    4*b*b3r^2)*b1s*b2s^2 + (-4*b*b1r^2 + 8*b*b1r*b3r - 4*b*b3r^2)*b2s^3 +
    (2*b*b1r*b2r - 2*b*b1r*b3r - 2*b*b2r^2 + 2*b*b2r*b3r)*a1s^2*b1s*b3s +
    (-4*b*b1r*b2r + 4*b*b1r*b3r + 4*b*b2r^2 - 4*b*b2r*b3r)*b1s^2*b3s + (-2*b*b1r^2
    + 2*b*b1r*b2r + 2*b*b1r*b3r - 2*b*b2r*b3r)*a1s^2*b2s*b3s + (4*b*b1r^2 -
    4*b*b1r*b2r - 4*b*b1r*b3r + 4*b*b2r*b3r)*b2s^2*b3s + (b*b1r^2 - 2*b*b1r*b2r +
    b*b2r^2)*a1s^2*b3s^2 + (-4*b*b1r*b2r + 4*b*b1r*b3r + 4*b*b2r^2 -
    4*b*b2r*b3r)*b1s*b3s^2 + (4*b*b1r^2 - 4*b*b1r*b2r - 4*b*b1r*b3r +
    4*b*b2r*b3r)*b2s*b3s^2 + (-4*b*b1r^2 + 8*b*b1r*b2r - 4*b*b2r^2)*b3s^3;

g040 := (1/4*a^2*b2r - 1/4*a^2*b3r)*a1s*a3s*b1s + (-1/4*a^2*b1r + 1/4*a^2*b3r)*a1s*a3s*b2s
    + (-1/4*a^2*b2r + 1/4*a^2*b3r)*b1s^2*b2s + (1/4*a^2*b1r -
    1/4*a^2*b3r)*b1s*b2s^2 + (1/4*a^2*b1r - 1/4*a^2*b2r)*a1s*a3s*b3s +
    (-1/4*a^2*b2r + 1/4*a^2*b3r)*b1s^2*b3s + (1/4*a^2*b1r - 1/4*a^2*b3r)*b2s^2*b3s
    + (-1/4*a^2*b1r + 1/4*a^2*b2r)*b1s*b3s^2 + (-1/4*a^2*b1r +
    1/4*a^2*b2r)*b2s*b3s^2 + (-a*b*b2r + a*b*b3r)*a3s*b1s + (a*b*b1r -
    a*b*b3r)*a3s*b2s + (-a*b*b1r + a*b*b2r)*a3s*b3s + (b^2*b2r - b^2*b3r)*b1s^2 +
    (-b^2*b1r + b^2*b3r)*b2s^2 + (b^2*b1r - b^2*b2r)*b3s^2;
f040 := discs*g040;

g031 := (1/2*a*b2r - 1/2*a*b3r)*a1s*a3s*b1s + (-1/2*a*b1r + 1/2*a*b3r)*a1s*a3s*b2s +
    (-1/2*a*b2r + 1/2*a*b3r)*b1s^2*b2s + (1/2*a*b1r - 1/2*a*b3r)*b1s*b2s^2 +
    (1/2*a*b1r - 1/2*a*b2r)*a1s*a3s*b3s + (-1/2*a*b2r + 1/2*a*b3r)*b1s^2*b3s +
    (1/2*a*b1r - 1/2*a*b3r)*b2s^2*b3s + (-1/2*a*b1r + 1/2*a*b2r)*b1s*b3s^2 +
    (-1/2*a*b1r + 1/2*a*b2r)*b2s*b3s^2 + (-b*b2r + b*b3r)*a3s*b1s + (b*b1r -
    b*b3r)*a3s*b2s + (-b*b1r + b*b2r)*a3s*b3s + (a*b*b1r - a*b*b2r)*b1s*b2s +
    (-a*b*b1r + a*b*b3r)*b1s*b3s + (a*b*b2r - a*b*b3r)*b2s*b3s + (b^2*b2r -
    b^2*b3r)*a1s*b1s + (-b^2*b1r + b^2*b3r)*a1s*b2s + (b^2*b1r - b^2*b2r)*a1s*b3s;
f031 := 2*discs*g031;

g022 := (b2r - b3r)*a1s*a3s*b1s + (-b1r + b3r)*a1s*a3s*b2s + (-b2r + b3r)*b1s^2*b2s + (b1r
    - b3r)*b1s*b2s^2 + (b1r - b2r)*a1s*a3s*b3s + (-b2r + b3r)*b1s^2*b3s + (b1r -
    b3r)*b2s^2*b3s + (-b1r + b2r)*b1s*b3s^2 + (-b1r + b2r)*b2s*b3s^2 + (a*b2r -
    a*b3r)*a3s*b1s + (-a*b1r + a*b3r)*a3s*b2s + (a*b1r - a*b2r)*a3s*b3s +
    (-2*b*b2r + 2*b*b3r)*b1s^2 + (a^2*b1r - a^2*b2r + 4*b*b1r - 4*b*b2r)*b1s*b2s +
    (2*b*b1r - 2*b*b3r)*b2s^2 + (-a^2*b1r + a^2*b3r - 4*b*b1r + 4*b*b3r)*b1s*b3s +
    (a^2*b2r - a^2*b3r + 4*b*b2r - 4*b*b3r)*b2s*b3s + (-2*b*b1r + 2*b*b2r)*b3s^2 +
    (a*b*b2r - a*b*b3r)*a1s*b1s + (-a*b*b1r + a*b*b3r)*a1s*b2s + (a*b*b1r -
    a*b*b2r)*a1s*b3s + (4*b^2*b2r - 4*b^2*b3r)*b1s + (-4*b^2*b1r + 4*b^2*b3r)*b2s
    + (4*b^2*b1r - 4*b^2*b2r)*b3s;
f022 := discs*g022;

g013 := (b2r - b3r)*a3s*b1s + (-b1r + b3r)*a3s*b2s + (b1r - b2r)*a3s*b3s + (a*b1r -
    a*b2r)*b1s*b2s + (-a*b1r + a*b3r)*b1s*b3s + (a*b2r - a*b3r)*b2s*b3s + (-b*b2r
    + b*b3r)*a1s*b1s + (b*b1r - b*b3r)*a1s*b2s + (-b*b1r + b*b2r)*a1s*b3s +
    (2*a*b*b2r - 2*a*b*b3r)*b1s + (-2*a*b*b1r + 2*a*b*b3r)*b2s + (2*a*b*b1r -
    2*a*b*b2r)*b3s;
f013 := 2*discs*g013;

g004 := (b2r - b3r)*b1s^2 + (-b1r + b3r)*b2s^2 + (b1r - b2r)*b3s^2 + (-a*b2r +
    a*b3r)*a1s*b1s + (a*b1r - a*b3r)*a1s*b2s + (-a*b1r + a*b2r)*a1s*b3s + (a^2*b2r
    - a^2*b3r)*b1s + (-a^2*b1r + a^2*b3r)*b2s + (a^2*b1r - a^2*b2r)*b3s;
f004 := discs*g004;

F3 := f400*x^4 + f220*x^2*y^2 + f211*x^2*y*z + f202*x^2*z^2 + f040*y^4 +
    f031*y^3*z + f022*y^2*z^2 + f013*y*z^3 + f004*z^4;

c1 := (-b2r + b3r)*b1s + (b1r - b3r)*b2s + (-b1r + b2r)*b3s;
c2 := (-1/4*b2r^2 + 1/2*b2r*b3r - 1/4*b3r^2)*a1s^3*a3s*b1s^2 + (1/2*b1r*b2r -
    1/2*b1r*b3r - 1/2*b2r*b3r + 1/2*b3r^2)*a1s^3*a3s*b1s*b2s + (-b1r*b2r + b1r*b3r
    + b2r^2 - b2r*b3r)*a1s*a3s*b1s^2*b2s + (1/4*b2r^2 - 1/2*b2r*b3r +
    1/4*b3r^2)*a1s^2*b1s^3*b2s + (-1/4*b1r^2 + 1/2*b1r*b3r -
    1/4*b3r^2)*a1s^3*a3s*b2s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s*a3s*b1s*b2s^2 + (-1/2*b1r*b2r + 1/2*b1r*b3r + 1/2*b2r*b3r -
    1/2*b3r^2)*a1s^2*b1s^2*b2s^2 + (b1r*b2r - b1r*b3r - b2r^2 +
    b2r*b3r)*b1s^3*b2s^2 + (1/4*b1r^2 - 1/2*b1r*b3r + 1/4*b3r^2)*a1s^2*b1s*b2s^3 +
    (-b1r^2 + b1r*b2r + b1r*b3r - b2r*b3r)*b1s^2*b2s^3 + (-1/2*b1r*b2r +
    1/2*b1r*b3r + 1/2*b2r^2 - 1/2*b2r*b3r)*a1s^3*a3s*b1s*b3s + (b1r*b2r - b1r*b3r
    - b2r*b3r + b3r^2)*a1s*a3s*b1s^2*b3s + (1/4*b2r^2 - 1/2*b2r*b3r +
    1/4*b3r^2)*a1s^2*b1s^3*b3s + (1/2*b1r^2 - 1/2*b1r*b2r - 1/2*b1r*b3r +
    1/2*b2r*b3r)*a1s^3*a3s*b2s*b3s + (-2*b1r^2 + 2*b1r*b2r + 2*b1r*b3r - 2*b2r^2 +
    2*b2r*b3r - 2*b3r^2)*a1s*a3s*b1s*b2s*b3s + (-1/4*b2r^2 + 1/2*b2r*b3r -
    1/4*b3r^2)*a1s^2*b1s^2*b2s*b3s + (b1r*b2r - b1r*b3r - b2r*b3r +
    b3r^2)*a1s*a3s*b2s^2*b3s + (-1/4*b1r^2 + 1/2*b1r*b3r -
    1/4*b3r^2)*a1s^2*b1s*b2s^2*b3s + (b1r^2 - 2*b1r*b2r + b2r^2)*b1s^2*b2s^2*b3s +
    (1/4*b1r^2 - 1/2*b1r*b3r + 1/4*b3r^2)*a1s^2*b2s^3*b3s + (-1/4*b1r^2 +
    1/2*b1r*b2r - 1/4*b2r^2)*a1s^3*a3s*b3s^2 + (b1r^2 - b1r*b2r - b1r*b3r +
    b2r*b3r)*a1s*a3s*b1s*b3s^2 + (1/2*b1r*b2r - 1/2*b1r*b3r - 1/2*b2r^2 +
    1/2*b2r*b3r)*a1s^2*b1s^2*b3s^2 + (-b1r*b2r + b1r*b3r + b2r*b3r -
    b3r^2)*b1s^3*b3s^2 + (-b1r*b2r + b1r*b3r + b2r^2 - b2r*b3r)*a1s*a3s*b2s*b3s^2
    + (-1/4*b1r^2 + 1/2*b1r*b2r - 1/4*b2r^2)*a1s^2*b1s*b2s*b3s^2 + (b1r^2 -
    2*b1r*b3r + b3r^2)*b1s^2*b2s*b3s^2 + (-1/2*b1r^2 + 1/2*b1r*b2r + 1/2*b1r*b3r -
    1/2*b2r*b3r)*a1s^2*b2s^2*b3s^2 + (b2r^2 - 2*b2r*b3r + b3r^2)*b1s*b2s^2*b3s^2 +
    (-b1r*b2r + b1r*b3r + b2r*b3r - b3r^2)*b2s^3*b3s^2 + (1/4*b1r^2 - 1/2*b1r*b2r
    + 1/4*b2r^2)*a1s^2*b1s*b3s^3 + (-b1r^2 + b1r*b2r + b1r*b3r -
    b2r*b3r)*b1s^2*b3s^3 + (1/4*b1r^2 - 1/2*b1r*b2r + 1/4*b2r^2)*a1s^2*b2s*b3s^3 +
    (b1r*b2r - b1r*b3r - b2r^2 + b2r*b3r)*b2s^2*b3s^3 + (a*b2r^2 - 2*a*b2r*b3r +
    a*b3r^2)*a1s^2*a3s*b1s^2 + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r*b3r -
    2*a*b3r^2)*a1s^2*a3s*b1s*b2s + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r^2 +
    2*a*b2r*b3r)*a3s*b1s^2*b2s + (-a*b2r^2 + 2*a*b2r*b3r - a*b3r^2)*a1s*b1s^3*b2s
    + (a*b1r^2 - 2*a*b1r*b3r + a*b3r^2)*a1s^2*a3s*b2s^2 + (-2*a*b1r^2 +
    2*a*b1r*b2r + 2*a*b1r*b3r - 2*a*b2r*b3r)*a3s*b1s*b2s^2 + (2*a*b1r*b2r -
    2*a*b1r*b3r - 2*a*b2r*b3r + 2*a*b3r^2)*a1s*b1s^2*b2s^2 + (-a*b1r^2 +
    2*a*b1r*b3r - a*b3r^2)*a1s*b1s*b2s^3 + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r^2
    + 2*a*b2r*b3r)*a1s^2*a3s*b1s*b3s + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r*b3r -
    2*a*b3r^2)*a3s*b1s^2*b3s + (-a*b2r^2 + 2*a*b2r*b3r - a*b3r^2)*a1s*b1s^3*b3s +
    (-2*a*b1r^2 + 2*a*b1r*b2r + 2*a*b1r*b3r - 2*a*b2r*b3r)*a1s^2*a3s*b2s*b3s +
    (4*a*b1r^2 - 4*a*b1r*b2r - 4*a*b1r*b3r + 4*a*b2r^2 - 4*a*b2r*b3r +
    4*a*b3r^2)*a3s*b1s*b2s*b3s + (a*b2r^2 - 2*a*b2r*b3r +
    a*b3r^2)*a1s*b1s^2*b2s*b3s + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r*b3r -
    2*a*b3r^2)*a3s*b2s^2*b3s + (a*b1r^2 - 2*a*b1r*b3r + a*b3r^2)*a1s*b1s*b2s^2*b3s
    + (-a*b1r^2 + 2*a*b1r*b3r - a*b3r^2)*a1s*b2s^3*b3s + (a*b1r^2 - 2*a*b1r*b2r +
    a*b2r^2)*a1s^2*a3s*b3s^2 + (-2*a*b1r^2 + 2*a*b1r*b2r + 2*a*b1r*b3r -
    2*a*b2r*b3r)*a3s*b1s*b3s^2 + (-2*a*b1r*b2r + 2*a*b1r*b3r + 2*a*b2r^2 -
    2*a*b2r*b3r)*a1s*b1s^2*b3s^2 + (2*a*b1r*b2r - 2*a*b1r*b3r - 2*a*b2r^2 +
    2*a*b2r*b3r)*a3s*b2s*b3s^2 + (a*b1r^2 - 2*a*b1r*b2r +
    a*b2r^2)*a1s*b1s*b2s*b3s^2 + (2*a*b1r^2 - 2*a*b1r*b2r - 2*a*b1r*b3r +
    2*a*b2r*b3r)*a1s*b2s^2*b3s^2 + (-a*b1r^2 + 2*a*b1r*b2r -
    a*b2r^2)*a1s*b1s*b3s^3 + (-a*b1r^2 + 2*a*b1r*b2r - a*b2r^2)*a1s*b2s*b3s^3 +
    (-a^2*b2r^2 + 2*a^2*b2r*b3r - a^2*b3r^2 - 2*b*b2r^2 + 4*b*b2r*b3r -
    2*b*b3r^2)*a1s*a3s*b1s^2 + (2*a^2*b1r*b2r - 2*a^2*b1r*b3r - 2*a^2*b2r*b3r +
    2*a^2*b3r^2 + 4*b*b1r*b2r - 4*b*b1r*b3r - 4*b*b2r*b3r +
    4*b*b3r^2)*a1s*a3s*b1s*b2s + (a^2*b2r^2 - 2*a^2*b2r*b3r + a^2*b3r^2 -
    4*b*b1r*b2r + 4*b*b1r*b3r + 4*b*b2r^2 - 4*b*b2r*b3r)*b1s^3*b2s + (-a^2*b1r^2 +
    2*a^2*b1r*b3r - a^2*b3r^2 - 2*b*b1r^2 + 4*b*b1r*b3r - 2*b*b3r^2)*a1s*a3s*b2s^2
    + (a^2*b1r^2 - 4*a^2*b1r*b2r + 2*a^2*b1r*b3r + a^2*b2r^2 + 2*a^2*b2r*b3r -
    2*a^2*b3r^2)*b1s^2*b2s^2 + (a^2*b1r^2 - 2*a^2*b1r*b3r + a^2*b3r^2 + 4*b*b1r^2
    - 4*b*b1r*b2r - 4*b*b1r*b3r + 4*b*b2r*b3r)*b1s*b2s^3 + (-2*a^2*b1r*b2r +
    2*a^2*b1r*b3r + 2*a^2*b2r^2 - 2*a^2*b2r*b3r - 4*b*b1r*b2r + 4*b*b1r*b3r +
    4*b*b2r^2 - 4*b*b2r*b3r)*a1s*a3s*b1s*b3s + (a^2*b2r^2 - 2*a^2*b2r*b3r +
    a^2*b3r^2 + 4*b*b1r*b2r - 4*b*b1r*b3r - 4*b*b2r*b3r + 4*b*b3r^2)*b1s^3*b3s +
    (2*a^2*b1r^2 - 2*a^2*b1r*b2r - 2*a^2*b1r*b3r + 2*a^2*b2r*b3r + 4*b*b1r^2 -
    4*b*b1r*b2r - 4*b*b1r*b3r + 4*b*b2r*b3r)*a1s*a3s*b2s*b3s + (-2*a^2*b1r^2 +
    2*a^2*b1r*b2r + 2*a^2*b1r*b3r - a^2*b2r^2 - a^2*b3r^2 - 4*b*b2r^2 +
    8*b*b2r*b3r - 4*b*b3r^2)*b1s^2*b2s*b3s + (-a^2*b1r^2 + 2*a^2*b1r*b2r -
    2*a^2*b2r^2 + 2*a^2*b2r*b3r - a^2*b3r^2 - 4*b*b1r^2 + 8*b*b1r*b3r -
    4*b*b3r^2)*b1s*b2s^2*b3s + (a^2*b1r^2 - 2*a^2*b1r*b3r + a^2*b3r^2 +
    4*b*b1r*b2r - 4*b*b1r*b3r - 4*b*b2r*b3r + 4*b*b3r^2)*b2s^3*b3s + (-a^2*b1r^2 +
    2*a^2*b1r*b2r - a^2*b2r^2 - 2*b*b1r^2 + 4*b*b1r*b2r - 2*b*b2r^2)*a1s*a3s*b3s^2
    + (a^2*b1r^2 + 2*a^2*b1r*b2r - 4*a^2*b1r*b3r - 2*a^2*b2r^2 + 2*a^2*b2r*b3r +
    a^2*b3r^2)*b1s^2*b3s^2 + (-a^2*b1r^2 + 2*a^2*b1r*b3r - a^2*b2r^2 +
    2*a^2*b2r*b3r - 2*a^2*b3r^2 - 4*b*b1r^2 + 8*b*b1r*b2r -
    4*b*b2r^2)*b1s*b2s*b3s^2 + (-2*a^2*b1r^2 + 2*a^2*b1r*b2r + 2*a^2*b1r*b3r +
    a^2*b2r^2 - 4*a^2*b2r*b3r + a^2*b3r^2)*b2s^2*b3s^2 + (a^2*b1r^2 -
    2*a^2*b1r*b2r + a^2*b2r^2 + 4*b*b1r^2 - 4*b*b1r*b2r - 4*b*b1r*b3r +
    4*b*b2r*b3r)*b1s*b3s^3 + (a^2*b1r^2 - 2*a^2*b1r*b2r + a^2*b2r^2 - 4*b*b1r*b2r
    + 4*b*b1r*b3r + 4*b*b2r^2 - 4*b*b2r*b3r)*b2s*b3s^3 + (4*a*b*b2r^2 -
    8*a*b*b2r*b3r + 4*a*b*b3r^2)*a3s*b1s^2 + (-8*a*b*b1r*b2r + 8*a*b*b1r*b3r +
    8*a*b*b2r*b3r - 8*a*b*b3r^2)*a3s*b1s*b2s + (2*a*b*b1r*b2r - 2*a*b*b1r*b3r -
    2*a*b*b2r^2 + 2*a*b*b2r*b3r)*a1s*b1s^2*b2s + (4*a*b*b1r^2 - 8*a*b*b1r*b3r +
    4*a*b*b3r^2)*a3s*b2s^2 + (-2*a*b*b1r^2 + 2*a*b*b1r*b2r + 2*a*b*b1r*b3r -
    2*a*b*b2r*b3r)*a1s*b1s*b2s^2 + (8*a*b*b1r*b2r - 8*a*b*b1r*b3r - 8*a*b*b2r^2 +
    8*a*b*b2r*b3r)*a3s*b1s*b3s + (-2*a*b*b1r*b2r + 2*a*b*b1r*b3r + 2*a*b*b2r*b3r -
    2*a*b*b3r^2)*a1s*b1s^2*b3s + (-8*a*b*b1r^2 + 8*a*b*b1r*b2r + 8*a*b*b1r*b3r -
    8*a*b*b2r*b3r)*a3s*b2s*b3s + (4*a*b*b1r^2 - 4*a*b*b1r*b2r - 4*a*b*b1r*b3r +
    4*a*b*b2r^2 - 4*a*b*b2r*b3r + 4*a*b*b3r^2)*a1s*b1s*b2s*b3s + (-2*a*b*b1r*b2r +
    2*a*b*b1r*b3r + 2*a*b*b2r*b3r - 2*a*b*b3r^2)*a1s*b2s^2*b3s + (4*a*b*b1r^2 -
    8*a*b*b1r*b2r + 4*a*b*b2r^2)*a3s*b3s^2 + (-2*a*b*b1r^2 + 2*a*b*b1r*b2r +
    2*a*b*b1r*b3r - 2*a*b*b2r*b3r)*a1s*b1s*b3s^2 + (2*a*b*b1r*b2r - 2*a*b*b1r*b3r
    - 2*a*b*b2r^2 + 2*a*b*b2r*b3r)*a1s*b2s*b3s^2 + (b^2*b2r^2 - 2*b^2*b2r*b3r +
    b^2*b3r^2)*a1s^2*b1s^2 + (-4*b^2*b2r^2 + 8*b^2*b2r*b3r - 4*b^2*b3r^2)*b1s^3 +
    (-2*b^2*b1r*b2r + 2*b^2*b1r*b3r + 2*b^2*b2r*b3r - 2*b^2*b3r^2)*a1s^2*b1s*b2s +
    (4*b^2*b1r*b2r - 4*b^2*b1r*b3r - 4*b^2*b2r*b3r + 4*b^2*b3r^2)*b1s^2*b2s +
    (b^2*b1r^2 - 2*b^2*b1r*b3r + b^2*b3r^2)*a1s^2*b2s^2 + (4*b^2*b1r*b2r -
    4*b^2*b1r*b3r - 4*b^2*b2r*b3r + 4*b^2*b3r^2)*b1s*b2s^2 + (-4*b^2*b1r^2 +
    8*b^2*b1r*b3r - 4*b^2*b3r^2)*b2s^3 + (2*b^2*b1r*b2r - 2*b^2*b1r*b3r -
    2*b^2*b2r^2 + 2*b^2*b2r*b3r)*a1s^2*b1s*b3s + (-4*b^2*b1r*b2r + 4*b^2*b1r*b3r +
    4*b^2*b2r^2 - 4*b^2*b2r*b3r)*b1s^2*b3s + (-2*b^2*b1r^2 + 2*b^2*b1r*b2r +
    2*b^2*b1r*b3r - 2*b^2*b2r*b3r)*a1s^2*b2s*b3s + (4*b^2*b1r^2 - 4*b^2*b1r*b2r -
    4*b^2*b1r*b3r + 4*b^2*b2r*b3r)*b2s^2*b3s + (b^2*b1r^2 - 2*b^2*b1r*b2r +
    b^2*b2r^2)*a1s^2*b3s^2 + (-4*b^2*b1r*b2r + 4*b^2*b1r*b3r + 4*b^2*b2r^2 -
    4*b^2*b2r*b3r)*b1s*b3s^2 + (4*b^2*b1r^2 - 4*b^2*b1r*b2r - 4*b^2*b1r*b3r +
    4*b^2*b2r*b3r)*b2s*b3s^2 + (-4*b^2*b1r^2 + 8*b^2*b1r*b2r - 4*b^2*b2r^2)*b3s^3;
c := discs*c1*c2;

F3 := Evaluate(F3, [x,z,y]);
// If d = leading coeff, then maps on differentials, dividing by partials
// everywhere, are scalar multiples of c / d^2.
// This is difficult to see in Magma, since it normalizes curve equations, thus
// messing up these factors in front.
return F3, c;

end function;
