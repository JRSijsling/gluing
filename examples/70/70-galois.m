/***
 *  Determining Galois-stable 2-torsion subgroups
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


/* TODO: Too much boilerplate! */
import "Vs.m": AllVs2For12, AllVs2For111;
import "some.m": SomeCharToDivFor12, SomeCharToDivFor111, SomeDivToCharFor12;
import "divtochar.m": DivToChar;


intrinsic FactoredGaloisGroup(fs::SeqEnum) -> .
{Finds Galois generators respecting decomposition.}

R<x> := Parent(fs[1]);
gs := [ fs[1] ];
for f in fs[2..#fs] do
    g := f;
    while not GCD(g, &*gs) eq 1 do
        g := Evaluate(g, x - 1);
    end while;
    Append(~gs, g);
end for;

G, rts, galdata := GaloisGroup(&*gs);
d := Degree(G); S := SymmetricGroup(d);

repeat
    prec := 20;
    done := true;
    s := [ ];

    for g in gs do
        counter := 0;
        for i in [1..#rts] do
            rt := GaloisRoot(i, galdata : Prec := prec, Scaled := false);
            if IsZero(Evaluate(g, rt)) then
                counter +:= 1;
                Append(~s, i);
            end if;
        end for;

        if not counter eq Degree(g) then
            done := false;
        end if;
    end for;

    prec +:= 5;
until done;

s := S ! s;
G := sub< S | [ s*g*s^(-1) : g in Generators(G) ] >;
return G;

end intrinsic;


function ActionG1(sigma, g)

S4 := Parent(sigma);
if Order(sigma) eq 1 then
    return sigma;
end if;

sigmag := sigma^g;
/* If we already have a 2-cycle with 1 in it, stop */
if 1^sigmag ne 1 then
    return sigmag;
end if;
/* (3, 4) to (1, 2) */
if 2^sigmag eq 2 then
    return S4 ! (1,2);
end if;
/* (2, 4) to (1, 3) */
if 3^sigmag eq 3 then
    return S4 ! (1,3);
end if;
/* (2, 3) to (1, 4) */
if 4^sigmag eq 4 then
    return S4 ! (1,4);
end if;

end function;


function IsGaloisStableStructureFor12(isosubgp, H, projs)

proj1, proj2 := Explode(projs);
for h in H do
    for tup in isosubgp do
        tupnew := [* ActionG1(tup[1], proj1(h)), tup[2]^(proj2(h)) *];
        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function IsGaloisStableStructureFor111(isosubgp, H, projs)

proj1, proj2, proj3 := Explode(projs);
for h in H do
    for tup in isosubgp do
        tupnew := [* ActionG1(tup[1], proj1(h)), ActionG1(tup[2], proj2(h)), ActionG1(tup[3], proj3(h)) *];
        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function IsGaloisStableExistsFor12(isosubgp, G)

S4 := SymmetricGroup(4);
S6 := SymmetricGroup(6);
for g in Generators(G) do
    for tup in isosubgp do
        tup1 := tup[1]; tup2 := tup[2];
        sigma1 := S4 ! Eltseq(g)[1..4];
        sigma2 := S6 ! [ n - 4 : n in Eltseq(g)[5..10] ];
        tupnew := [* ActionG1(tup1, sigma1), tup[2]^sigma2 *];
        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function IsGaloisStableExistsFor111(isosubgp, G)

S4 := SymmetricGroup(4);
for g in Generators(G) do
    for tup in isosubgp do
        tup1 := tup[1]; tup2 := tup[2]; tup3 := tup[3];
        sigma1 := S4 ! Eltseq(g)[1..4];
        sigma2 := S4 ! [ n - 4 : n in Eltseq(g)[5..8] ];
        sigma3 := S4 ! [ n - 8 : n in Eltseq(g)[9..12] ];
        tupnew := [* ActionG1(tup1, sigma1), ActionG1(tup2, sigma2), ActionG1(tup3, sigma3) *];

        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function MakeEven(f)

if IsEven(Degree(f)) then
    return f;
end if;
R<x> := Parent(f);
rt := 0;
while true do
    if not Evaluate(f, rt) eq 0 then
        return (x - rt)*f;
    end if;
    rt +:= 1;
end while;

end function;


intrinsic ExistsGaloisStableSubgroup(f1::RngUPolElt, f2::RngUPolElt) -> .
{Indicates if arithmetic gluing is possible.}

R<x> := Parent(f1); f2 := R ! f2;
f1 := MakeEven(f1); f2 := MakeEven(f2);

G := FactoredGaloisGroup([ f1, f2 ]);
Vs := AllVs2For12();
isosubgps := [ [ SomeCharToDivFor12(v) : v in V ] : V in Vs ];
counter := 0;
for isosubgp in isosubgps do
    if IsGaloisStableExistsFor12(isosubgp, G) then
        W := VectorSpace(FiniteField(2), 6);
        print Generators(G);
        B := [ SomeDivToCharFor12(h) : h in isosubgp ];
        print SomeCharToDivFor12(W.1);
        print SomeCharToDivFor12(W.2);
        print SomeCharToDivFor12(W.3);
        print SomeCharToDivFor12(W.4);
        print SomeCharToDivFor12(W.5);
        print SomeCharToDivFor12(W.6);
        M1 := Matrix(FiniteField(2), [[1,0,0,0,0,0],[1,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[0,0,0,1,0,1]]);
        M2 := Matrix(FiniteField(2), [[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,1,0,1,0],[0,0,0,0,0,1]]);
        M3 := Matrix(FiniteField(2), [[0,1,0,0,0,0],[1,1,0,0,0,0],[0,0,1,0,0,0],[0,0,1,0,0,1],[0,0,1,1,1,1],[0,0,0,1,0,1]]);
        Q, piQ := quo< W | sub< W | B > >;
        print #Q;
        num := 0;
        for w in W do
            if &and[ piQ(w) eq piQ(w*M) : M in [ M1, M2, M3 ] ] then
                num +:= 1;
            end if;
        end for;
        print num;
        counter +:= 1;
    end if;
end for;
return counter ne 0, counter;

end intrinsic;


intrinsic ExistsGaloisStableSubgroup(f1::RngUPolElt, f2::RngUPolElt, f3::RngUPolElt) -> .
{Indicates if arithmetic gluing is possible.}

R<x> := Parent(f1); f2 := R ! f2; f3 := R ! f3;
f1 := MakeEven(f1); f2 := MakeEven(f2); f3 := MakeEven(f3);

G := FactoredGaloisGroup([ f1, f2, f3 ]);
Vs := AllVs2For111();
isosubgps := [ [ SomeCharToDivFor111(v) : v in V ] : V in Vs ];
counter := 0;
for isosubgp in isosubgps do
    if IsGaloisStableExistsFor111(isosubgp, G) then
        counter +:= 1;
    end if;
end for;
return counter ne 0, counter;

end intrinsic;


function MakeSEven(g)

d := Degree(Parent(g));
if IsEven(d) then
    return g;
end if;
S := SymmetricGroup(d + 1);
return S ! ([ 1 ] cat [ n + 1 : n in Eltseq(g) ]);

end function;


function GeneratorsFor12(Gp, Gphi, rts1, rts2)

S1 := SymmetricGroup(#rts1);
S2 := SymmetricGroup(#rts2);
gens := [ ];
for g in Generators(Gp) do
    aut := Gphi(g);
    gen1 := [ ];
    gen2 := [ ];

    for i in [1..#rts1] do
        rt1 := rts1[i];
        rt1new := aut(rt1);
        for j in [1..#rts1] do
            if rts1[j] eq rt1new then
                Append(~gen1, j);
            end if;
        end for;
    end for;

    for i in [1..#rts2] do
        rt2 := rts2[i];
        rt2new := aut(rt2);
        for j in [1..#rts2] do
            if rts2[j] eq rt2new then
                Append(~gen2, j);
            end if;
        end for;
    end for;

    gen1 := MakeSEven(S1 ! gen1);
    gen2 := MakeSEven(S2 ! gen2);
    Append(~gens, [* gen1, gen2 *]);
end for;
return gens;

end function;


function GeneratorsFor111(Gp, Gphi, rts1, rts2, rts3)

S1 := SymmetricGroup(#rts1);
S2 := SymmetricGroup(#rts2);
S3 := SymmetricGroup(#rts3);
gens := [ ];
for g in Generators(Gp) do
    aut := Gphi(g);
    gen1 := [ ];
    gen2 := [ ];
    gen3 := [ ];

    for i in [1..#rts1] do
        rt1 := rts1[i];
        rt1new := aut(rt1);
        for j in [1..#rts1] do
            if rts1[j] eq rt1new then
                Append(~gen1, j);
            end if;
        end for;
    end for;

    for i in [1..#rts2] do
        rt2 := rts2[i];
        rt2new := aut(rt2);
        for j in [1..#rts2] do
            if rts2[j] eq rt2new then
                Append(~gen2, j);
            end if;
        end for;
    end for;

    for i in [1..#rts3] do
        rt3 := rts3[i];
        rt3new := aut(rt3);
        for j in [1..#rts3] do
            if rts3[j] eq rt3new then
                Append(~gen3, j);
            end if;
        end for;
    end for;

    gen1 := MakeSEven(S1 ! gen1);
    gen2 := MakeSEven(S2 ! gen2);
    gen3 := MakeSEven(S3 ! gen3);
    Append(~gens, [* gen1, gen2, gen3 *]);
end for;
return gens;

end function;


function SubgroupFor12(V, hinv1, hinv2)

FF := FiniteField(2);
V1 := VectorSpace(FF, 2);
V2 := VectorSpace(FF, 4);

isosubgp := [ ];
for v in V do
    s := Eltseq(v);
    v1 := V1 ! [ s[1], s[2] ];
    v2 := V2 ! [ s[3], s[4], s[5], s[6] ];

    fp := hinv1(v1);
    sp := hinv2(v2);
    Append(~isosubgp, [* fp, sp *]);
end for;
return isosubgp;

end function;


function SubgroupFor111(V, hinv1, hinv2, hinv3)

FF := FiniteField(2);
V1 := VectorSpace(FF, 2);

isosubgp := [ ];
for v in V do
    s := Eltseq(v);
    v1 := V1 ! [ s[1], s[2] ];
    v2 := V1 ! [ s[3], s[4] ];
    v3 := V1 ! [ s[5], s[6] ];

    fp := hinv1(v1);
    sp := hinv2(v2);
    tp := hinv3(v3);
    Append(~isosubgp, [* fp, sp, tp *]);
end for;
return isosubgp;

end function;


function IsGaloisStableLabeledFor12(isosubgp, gens)

S4 := SymmetricGroup(4);
S6 := SymmetricGroup(6);
for gen in gens do
    for tup in isosubgp do
        tup1 := tup[1]; tup2 := tup[2];
        gen1 := gen[1]; gen2 := gen[2];
        tupnew := [* ActionG1(tup1, gen1), tup[2]^gen2 *];

        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function IsGaloisStableLabeledFor111(isosubgp, gens)

S4 := SymmetricGroup(4);
for gen in gens do
    for tup in isosubgp do
        tup1 := tup[1]; tup2 := tup[2]; tup3 := tup[3];
        gen1 := gen[1]; gen2 := gen[2]; gen3 := gen[3];
        tupnew := [* ActionG1(tup1, gen1), ActionG1(tup2, gen2), ActionG1(tup3, gen3) *];

        if not tupnew in isosubgp then
            return false;
        end if;
    end for;
end for;
return true;

end function;


function RelabelRoots(rtsCC, bp)

CC := Parent(rtsCC[1]);
relab := [ ];
for i in [1..#bp] do
    for j in [1..#rtsCC] do
        if Abs(rtsCC[j] - bp[i]) lt CC`epscomp then
            Append(~relab, j);
            break;
        end if;
    end for;
end for;
return relab;

end function;


intrinsic GaloisStableSubgroups(X1::Crv, X2::Crv) -> .
{Determines Galois-stable maximal isotropic subgroups of 2-torsion.}

assert Genus(X1) eq 1;
assert Genus(X2) eq 2;

P1 := PeriodMatrix(X1);
P2 := PeriodMatrix(X2);

f1, h1 := HyperellipticPolynomials(X1);
f2, h2 := HyperellipticPolynomials(X2);
g1 := (4*f1 + h1^2) / 4;
g2 := (4*f2 + h2^2) / 4;

SE1 := X1`riesrf;
SE2 := X2`riesrf;
bps1 := SE1`BranchPoints;
bps2 := SE2`BranchPoints;

F := BaseRing(X1); R := PolynomialRing(F);
L := SplittingFieldPari(g1*g2);
L := NumberFieldExtra(R ! DefiningPolynomial(L));

/* Make order of roots coincide with those of branch points */
rts1 := RootsPari(g1, L);
rts2 := RootsPari(g2, L);
rts1CC := [ EmbedExtra(rt1) : rt1 in rts1 ];
rts2CC := [ EmbedExtra(rt2) : rt2 in rts2 ];
relab1 := RelabelRoots(rts1CC, bps1);
relab2 := RelabelRoots(rts2CC, bps2);
rts1 := [ rts1[i] : i in relab1 ];
rts2 := [ rts2[i] : i in relab2 ];

/* Sanity check
rts1CC := [ EmbedExtra(rt1) : rt1 in rts1 ];
rts2CC := [ EmbedExtra(rt2) : rt2 in rts2 ];
relab1 := RelabelRoots(rts1CC, bps1);
relab2 := RelabelRoots(rts2CC, bps2);
print relab1;
print relab2;
*/

h1, hinv1 := DivToChar(SE1, bps1);
h2, hinv2 := DivToChar(SE2, bps2);

Gp, _, Gphi := AutomorphismGroupPari(L);
gens := GeneratorsFor12(Gp, Gphi, rts1, rts2);

Vs := AllVs2For12();
Vs0 := [ ];
for V in Vs do
    isosubgp := SubgroupFor12(V, hinv1, hinv2);
    if IsGaloisStableLabeledFor12(isosubgp, gens) then
        Append(~Vs0, V);
    end if;
end for;
return Vs0;

end intrinsic;


intrinsic GaloisStableSubgroups(X1::Crv, X2::Crv, X3::Crv) -> .
{Determines Galois-stable maximal isotropic subgroups of 2-torsion.}

assert Genus(X1) eq 1;
assert Genus(X2) eq 1;
assert Genus(X3) eq 1;

P1 := PeriodMatrix(X1);
P2 := PeriodMatrix(X2);
P3 := PeriodMatrix(X3);

f1, h1 := HyperellipticPolynomials(X1);
f2, h2 := HyperellipticPolynomials(X2);
f3, h3 := HyperellipticPolynomials(X3);
g1 := (4*f1 + h1^2) / 4;
g2 := (4*f2 + h2^2) / 4;
g3 := (4*f3 + h3^3) / 4;

SE1 := X1`riesrf;
SE2 := X2`riesrf;
SE3 := X3`riesrf;
bps1 := SE1`BranchPoints;
bps2 := SE2`BranchPoints;
bps3 := SE3`BranchPoints;

F := BaseRing(X1); R := PolynomialRing(F);
L := SplittingFieldPari(g1*g2*g3);
L := NumberFieldExtra(R ! DefiningPolynomial(L));

/* Make order of roots coincide with those of branch points */
rts1 := RootsPari(g1, L);
rts2 := RootsPari(g2, L);
rts3 := RootsPari(g3, L);
rts1CC := [ EmbedExtra(rt1) : rt1 in rts1 ];
rts2CC := [ EmbedExtra(rt2) : rt2 in rts2 ];
rts3CC := [ EmbedExtra(rt3) : rt3 in rts3 ];
relab1 := RelabelRoots(rts1CC, bps1);
relab2 := RelabelRoots(rts2CC, bps2);
relab3 := RelabelRoots(rts3CC, bps3);
rts1 := [ rts1[i] : i in relab1 ];
rts2 := [ rts2[i] : i in relab2 ];
rts3 := [ rts3[i] : i in relab3 ];

/* Sanity check
rts1CC := [ EmbedExtra(rt1) : rt1 in rts1 ];
rts2CC := [ EmbedExtra(rt2) : rt2 in rts2 ];
rts3CC := [ EmbedExtra(rt3) : rt3 in rts3 ];
relab1 := RelabelRoots(rts1CC, bps1);
relab2 := RelabelRoots(rts2CC, bps2);
relab3 := RelabelRoots(rts3CC, bps3);
print relab1;
print relab2;
print relab3;
*/

h1, hinv1 := DivToChar(SE1, bps1);
h2, hinv2 := DivToChar(SE2, bps2);
h3, hinv3 := DivToChar(SE3, bps3);

Gp, _, Gphi := AutomorphismGroupPari(L);
gens := GeneratorsFor111(Gp, Gphi, rts1, rts2, rts3);

Vs := AllVs2For111();
Vs0 := [ ];
for V in Vs do
    isosubgp := SubgroupFor111(V, hinv1, hinv2, hinv3);
    if IsGaloisStableLabeledFor111(isosubgp, gens) then
        Append(~Vs0, V);
    end if;
end for;
return Vs0;

end intrinsic;
