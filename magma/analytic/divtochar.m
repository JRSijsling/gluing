/***
 *  Divisors to characteristics
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


function DivDif(div1, div2)

S6 := Parent(div1);
if div1 eq div2 then
    return S6 ! 1;
end if;

U := { 1, 2, 3, 4, 5, 6 };
S1 := { n : n in [1..6] | n^div1 ne n };
S2 := { n : n in [1..6] | n^div2 ne n };
S := S1 sdiff S2;
assert #S in [2, 4];
if #S eq 4 then
    S := U diff S;
end if;
L := [ n : n in S ];
divi := [ 1, 2, 3, 4, 5, 6 ];
divi[L[1]] := L[2];
divi[L[2]] := L[1];
return S6 ! divi;

end function;


function DivToChar(SE, bps)

if #bps eq 3 then
    S4 := SymmetricGroup(4);
    FF := FiniteField(2);
    V1 := VectorSpace(FF, 2);

    divs := [ S4 ! 1, S4 ! (1, 2), S4 ! (1, 3), S4 ! (1, 4) ];
    P2 := [ bps[1], 0 ];
    char12 := SE_AbelJacobi(P2, [ 1 ], SE);
    P3 := [ bps[2], 0 ];
    char13 := SE_AbelJacobi(P3, [ 1 ], SE);
    P4 := [ bps[3], 0 ];
    char14 := SE_AbelJacobi(P4, [ 1 ], SE);

    chars := [ V1 ! 0 ] cat [ V1 ! [ Round(2*c) : c in Eltseq(char) ] : char in [ char12, char13, char14 ] ];
    tupsh := [ < divs[i], chars[i] > : i in [1..4] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..4] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 4 then
    S4 := SymmetricGroup(4);
    FF := FiniteField(2);
    V1 := VectorSpace(FF, 2);

    divs := [ S4 ! 1, S4 ! (1, 2), S4 ! (1, 3), S4 ! (1, 4) ];
    P1 := [ bps[1], 0 ];
    P2 := [ bps[2], 0 ];
    char12 := SE_AbelJacobi(P2, P1, SE);
    P3 := [ bps[3], 0 ];
    char13 := SE_AbelJacobi(P3, P1, SE);
    P4 := [ bps[4], 0 ];
    char14 := SE_AbelJacobi(P4, P1, SE);

    chars := [ V1 ! 0 ] cat [ V1 ! [ Round(2*c) : c in Eltseq(char) ] : char in [ char12, char13, char14 ] ];
    tupsh := [ < divs[i], chars[i] > : i in [1..4] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..4] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 5 then
    S6 := SymmetricGroup(6);
    FF := FiniteField(2);
    V2 := VectorSpace(FF, 4);

    gendivs := [ S6 ! (1, 2), S6 ! (1, 3), S6 ! (1, 4), S6 ! (1, 5), S6 ! (1, 6) ];
    P2 := [ bps[1], 0 ];
    genchar12 := SE_AbelJacobi(P2, [ 1 ], SE);
    P3 := [ bps[2], 0 ];
    genchar13 := SE_AbelJacobi(P3, [ 1 ], SE);
    P4 := [ bps[3], 0 ];
    genchar14 := SE_AbelJacobi(P4, [ 1 ], SE);
    P5 := [ bps[4], 0 ];
    genchar15 := SE_AbelJacobi(P5, [ 1 ], SE);
    P6 := [ bps[5], 0 ];
    genchar16 := SE_AbelJacobi(P6, [ 1 ], SE);
    genchars := [ genchar12, genchar13, genchar14, genchar15, genchar16 ];
    genchars := [ V2 ! [ Round(2*c) : c in Eltseq(char) ] : char in genchars ];

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

    tupsh := [ < divs[i], chars[i] > : i in [1..16] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..16] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

elif #bps eq 6 then
    S6 := SymmetricGroup(6);
    FF := FiniteField(2);
    V2 := VectorSpace(FF, 4);

    gendivs := [ S6 ! (1, 2), S6 ! (1, 3), S6 ! (1, 4), S6 ! (1, 5), S6 ! (1, 6) ];
    P1 := [ bps[1], 0 ];
    P2 := [ bps[2], 0 ];
    genchar12 := SE_AbelJacobi(P2, P1, SE);
    P3 := [ bps[3], 0 ];
    genchar13 := SE_AbelJacobi(P3, P1, SE);
    P4 := [ bps[4], 0 ];
    genchar14 := SE_AbelJacobi(P4, P1, SE);
    P5 := [ bps[5], 0 ];
    genchar15 := SE_AbelJacobi(P5, P1, SE);
    P6 := [ bps[6], 0 ];
    genchar16 := SE_AbelJacobi(P6, P1, SE);
    genchars := [ genchar12, genchar13, genchar14, genchar15, genchar16 ];
    genchars := [ V2 ! [ Round(2*c) : c in Eltseq(char) ] : char in genchars ];

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

    tupsh := [ < divs[i], chars[i] > : i in [1..16] ];
    tupshinv:= [ < chars[i], divs[i] > : i in [1..16] ];
    h := map< divs -> chars | tupsh >;
    hinv := map< chars -> divs | tupshinv >;
    return h, hinv;

end if;

end function;
