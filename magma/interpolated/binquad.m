/***
 *  Invariants of binary quartic forms
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */

intrinsic BinaryQuarticInvariants(bq::RngUPolElt) -> .
{The first invariant is j, the second is the pair [I, J] for which y^2 = x^3 - 27 I x - 27 J defines the Jacobian, the third is the discriminant.}

c4 := Coefficient(bq, 4);
c3 := Coefficient(bq, 3);
c2 := Coefficient(bq, 2);
c1 := Coefficient(bq, 1);
c0 := Coefficient(bq, 0);

I := 12*c4*c0 - 3*c3*c1 + c2^2;
J := 72*c4*c2*c0 + 9*c3*c2*c1 - 27*c4*c1^2 - 27*c0*c3^2 - 2*c2^3;
Delta := 4*I^3 - J^2;
if Delta eq 0 then
    j := Infinity();
else
    j := 6912*I^3/Delta;
end if;
return j, [I,J], Delta;

end intrinsic;
