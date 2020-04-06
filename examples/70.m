/* Compute Galois action (very naive, and in general one should use DivToChar) */

SetSeed(1);
import "../magma/analytic/divtochar.m": DivDif, DivToChar;

f1 := 4*x^3 + 5*x^2 - 98*x + 157;
f2 := x^6 + 2*x^3 - 4*x^2 + 1;
L := Polredabs(SplittingField(f1*f2));

R<x> := PolynomialRing(RationalsExtra());
L := NumberFieldExtra(R ! DefiningPolynomial(L));
Gp, _, Gphi := AutomorphismGroupPari(L);
gens := [ Gp.2, Gp.4 ];
gens := [ Gphi(gen) : gen in gens ];

FF2 := FiniteField(2);
alphas := RootsPari(f1, L);
/* Use next lines to obtain matrices below:
 * alpha[1] to (1, 0) and alpha[2] to (0, 1) */
assert gens[1](alphas[1]) eq alphas[3];
assert gens[1](alphas[2]) eq alphas[1];
assert gens[2](alphas[1]) eq alphas[3];
assert gens[2](alphas[2]) eq alphas[2];

/* Right multiplication */
M1 := Matrix(FF2, [[1,1],[1,0]]);
M2 := Matrix(FF2, [[1,1],[0,1]]);

betas := RootsPari(f2, L);
betas := [ betas[1], betas[5], betas[2], betas[6], betas[3], betas[4] ];
assert Degree(MinimalPolynomial(betas[1])) eq 1;
assert Degree(MinimalPolynomial(betas[2])) eq 3;
assert Degree(MinimalPolynomial(betas[3])) eq 3;
assert Degree(MinimalPolynomial(betas[4])) eq 3;
assert Degree(MinimalPolynomial(betas[5])) eq 2;
assert Degree(MinimalPolynomial(betas[6])) eq 2;

/* Use next lines to obtain matrices below:
 * beta2 - beta1 to (1, 0, 0, 0), beta3 - beta1 to (0, 1, 0, 0),
   beta5 - beta6 to (0, 0, 1, 0), beta5 - beta1 to (0, 0, 0, 1) */
assert { gens[1](betas[1]), gens[1](betas[2]) } eq { betas[1], betas[4] };
assert { gens[1](betas[1]), gens[1](betas[3]) } eq { betas[1], betas[2] };
assert { gens[1](betas[5]), gens[1](betas[6]) } eq { betas[5], betas[6] };
assert { gens[1](betas[5]), gens[1](betas[1]) } eq { betas[6], betas[1] };
assert { gens[2](betas[1]), gens[2](betas[2]) } eq { betas[1], betas[4] };
assert { gens[2](betas[1]), gens[2](betas[3]) } eq { betas[1], betas[3] };
assert { gens[2](betas[5]), gens[2](betas[6]) } eq { betas[5], betas[6] };
assert { gens[2](betas[5]), gens[2](betas[1]) } eq { betas[5], betas[1] };

N1 := Matrix(FF2, [[1,1,1,0],[1,0,0,0],[0,0,1,0],[0,0,1,1]]);
N2 := Matrix(FF2, [[1,1,1,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]);

A1 := DiagonalJoin(M1, N1);
A2 := DiagonalJoin(M2, N2);
V := VectorSpace(FF2, 6);

/* Generators for subgroup G */
u1 := V ! [1, 0, 1, 0, 0, 0];
u2 := V ! [0, 1, 0, 1, 0, 0];
u3 := V ! [0, 0, 0, 0, 1, 0];
U := sub< V | [u1, u2, u3] >;
assert &and[ u*A1 in U : u in [u1, u2, u3] ];
assert &and[ u*A2 in U : u in [u1, u2, u3] ];

W, q := quo< V | U >;
M1 := Matrix(FF2, [ Eltseq(q((W.i @@ q)*A1)) : i in [1..3] ]);
M2 := Matrix(FF2, [ Eltseq(q((W.i @@ q)*A2)) : i in [1..3] ]);

print "";
print "Common eigenspace:";
print Eigenspace(M1, 1) meet Eigenspace(M2, 1);

print "";
print "Preimage:";
print (W ! [0,0,1]) @@ q;

print "";
print "Action on torsion:";
print A1, A2;

print "";
print "Action on quotient:";
print M1, M2;
