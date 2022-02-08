/***
 *  Divisors to characteristics
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


function DivDif(div1, div2)
/* Addition law on differences of pairs of points in genus 2 */

/* Trivial case */
S6 := Parent(div1);
if div1 eq div2 then
    return S6 ! 1;
end if;

U := { 1, 2, 3, 4, 5, 6 };
S1 := { n : n in [1..6] | n^div1 ne n };
S2 := { n : n in [1..6] | n^div2 ne n };
/* Symmetric difference */
S := S1 sdiff S2;
assert #S in [2, 4];
/* Take complement if needed */
if #S eq 4 then
    S := U diff S;
end if;

/* Convert to permutation */
L := [ n : n in S ];
divi := [ 1, 2, 3, 4, 5, 6 ];
divi[L[1]] := L[2];
divi[L[2]] := L[1];
return S6 ! divi;

end function;


function DivToChar(SE, bps)
/* Maps from divisors (pairs of points) to characteristics (elements of an
 * FF2-vector space) */
/* For great boilerplate justice */

if #bps eq 3 then
    S4 := SymmetricGroup(4);
    FF := FiniteField(2);
    V1 := VectorSpace(FF, 2);

    /* The four divisors in genus 1, with 1 corresponding to infty, and the
     * corresponding characteristics */
    divs := [ S4 ! 1, S4 ! (1, 2), S4 ! (1, 3), S4 ! (1, 4) ];
    inf := SE ! [ 1 ] ;
    P2 := SE ! [ bps[1], 0 ];
    char12 := AbelJacobi(P2, inf : Reduction := "Real");
    P3 := SE ! [ bps[2], 0 ];
    char13 := AbelJacobi(P3, inf : Reduction := "Real");
    P4 := SE ! [ bps[3], 0 ];
    char14 := AbelJacobi(P4, inf : Reduction := "Real");

    /* Conversion to elements of FF2 and creation of map */
    chars := [ V1 ! 0 ] cat [ V1 ! [ Round(2*c) : c in Eltseq(char) ] : char in [ char12, char13, char14 ] ];
    ss := [ Eltseq(char) : char in chars ]; chars := [ V1 ! (s[((#s div 2) + 1)..(#s)] cat s[1..(#s div 2)]) : s in ss ];
    tupsh := [ < divs[i], chars[i] > : i in [1..4] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..4] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 4 then
    S4 := SymmetricGroup(4);
    FF := FiniteField(2);
    V1 := VectorSpace(FF, 2);

    /* The four divisors in genus 1 and the corresponding characteristics */
    divs := [ S4 ! 1, S4 ! (1, 2), S4 ! (1, 3), S4 ! (1, 4) ];
    P1 := SE ! [ bps[1], 0 ];
    P2 := SE ! [ bps[2], 0 ];
    char12 := AbelJacobi(P2, P1 : Reduction := "Real");
    P3 := SE ! [ bps[3], 0 ];
    char13 := AbelJacobi(P3, P1 : Reduction := "Real");
    P4 := SE ! [ bps[4], 0 ];
    char14 := AbelJacobi(P4, P1 : Reduction := "Real");

    /* Conversion to elements of FF2 and creation of map */
    chars := [ V1 ! 0 ] cat [ V1 ! [ Round(2*c) : c in Eltseq(char) ] : char in [ char12, char13, char14 ] ];
    ss := [ Eltseq(char) : char in chars ]; chars := [ V1 ! (s[((#s div 2) + 1)..(#s)] cat s[1..(#s div 2)]) : s in ss ];
    tupsh := [ < divs[i], chars[i] > : i in [1..4] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..4] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 5 then
    S6 := SymmetricGroup(6);
    FF := FiniteField(2);
    V2 := VectorSpace(FF, 4);

    /* The six fundamental divisors in genus 2, with 1 corresponding to infty,
     * and the corresponding characteristics */
    gendivs := [ S6 ! (1, 2), S6 ! (1, 3), S6 ! (1, 4), S6 ! (1, 5), S6 ! (1, 6) ];
    inf := SE ! [1];
    P2 := SE ! [ bps[1], 0 ];
    genchar12 := AbelJacobi(P2, inf : Reduction := "Real");
    P3 := SE ! [ bps[2], 0 ];
    genchar13 := AbelJacobi(P3, inf : Reduction := "Real");
    P4 := SE ! [ bps[3], 0 ];
    genchar14 := AbelJacobi(P4, inf : Reduction := "Real");
    P5 := SE ! [ bps[4], 0 ];
    genchar15 := AbelJacobi(P5, inf : Reduction := "Real");
    P6 := SE ! [ bps[5], 0 ];
    genchar16 := AbelJacobi(P6, inf : Reduction := "Real");
    genchars := [ genchar12, genchar13, genchar14, genchar15, genchar16 ];
    genchars := [ V2 ! [ Round(2*c) : c in Eltseq(char) ] : char in genchars ];

    /* Extension to other elements */
    divs := [ S6 ! 1 ];
    chars := [ V2 ! 0 ];
    for i in [1..#gendivs] do
        Append(~divs, gendivs[i]);
        Append(~chars, genchars[i]);
    end for;
    for i in [1..#gendivs] do
        for j in [(i + 1)..#gendivs] do
            divi := DivDif(gendivs[i], gendivs[j]);
            char := genchars[i] - genchars[j];
            Append(~divs, divi);
            Append(~chars, char);
        end for;
    end for;
    ss := [ Eltseq(char) : char in chars ]; chars := [ V2 ! (s[((#s div 2) + 1)..(#s)] cat s[1..(#s div 2)]) : s in ss ];

    /* Conversion to elements of FF2 and creation of map */
    tupsh := [ < divs[i], chars[i] > : i in [1..16] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..16] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 6 then
    S6 := SymmetricGroup(6);
    FF := FiniteField(2);
    V2 := VectorSpace(FF, 4);

    /* The six fundamental divisors in genus 2 and the corresponding characteristics */
    gendivs := [ S6 ! (1, 2), S6 ! (1, 3), S6 ! (1, 4), S6 ! (1, 5), S6 ! (1, 6) ];
    P1 := [ bps[1], 0 ];
    P2 := [ bps[2], 0 ];
    genchar12 := AbelJacobi(P2, P1 : Reduction := "Real");
    P3 := [ bps[3], 0 ];
    genchar13 := AbelJacobi(P3, P1 : Reduction := "Real");
    P4 := [ bps[4], 0 ];
    genchar14 := AbelJacobi(P4, P1 : Reduction := "Real");
    P5 := [ bps[5], 0 ];
    genchar15 := AbelJacobi(P5, P1 : Reduction := "Real");
    P6 := [ bps[6], 0 ];
    genchar16 := AbelJacobi(P6, P1 : Reduction := "Real");
    genchars := [ genchar12, genchar13, genchar14, genchar15, genchar16 ];
    genchars := [ V2 ! [ Round(2*c) : c in Eltseq(char) ] : char in genchars ];

    /* Extension to other elements */
    divs := [ S6 ! 1 ];
    chars := [ V2 ! 0 ];
    for i in [1..#gendivs] do
        Append(~divs, gendivs[i]);
        Append(~chars, genchars[i]);
    end for;
    for i in [1..#gendivs] do
        for j in [(i + 1)..#gendivs] do
            divi := DivDif(gendivs[i], gendivs[j]);
            char := genchars[i] - genchars[j];
            Append(~divs, divi);
            Append(~chars, char);
        end for;
    end for;
    ss := [ Eltseq(char) : char in chars ]; chars := [ V2 ! (s[((#s div 2) + 1)..(#s)] cat s[1..(#s div 2)]) : s in ss ];

    /* Conversion to elements of FF2 and creation of map */
    tupsh := [ < divs[i], chars[i] > : i in [1..16] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..16] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

end if;

end function;
