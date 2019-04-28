/***
 *  Characteristics to divisors for some labeling
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


function SomeCharToDivFor12(v)

S4 := SymmetricGroup(4);
S6 := SymmetricGroup(6);

V := Parent(v); FF := BaseRing(V);
V1 := VectorSpace(FF, 2);
V2 := VectorSpace(FF, 4);

w1 := V1 ! [ v[1], v[2] ];
w2 := V2 ! [ v[3], v[4], v[5], v[6] ];

case w1:
    when V1 ! [0,0]:
        fp := S4 ! 1;
    when V1 ! [1,0]:
        fp := S4 ! (1,2);
    when V1 ! [0,1]:
        fp := S4 ! (1,3);
    when V1 ! [1,1]:
        fp := S4 ! (1,4);
end case;

case w2:
    when V2 ! [0,0,0,0]:
        sp := S6 ! 1;
    when V2 ! [1,0,0,0]:
        sp := S6 ! (1, 2);
    when V2 ! [0,1,0,0]:
        sp := S6 ! (3, 4);
    when V2 ! [0,0,1,0]:
        sp := S6 ! (1, 5);
    when V2 ! [0,0,0,1]:
        sp := S6 ! (3, 6);
    when V2 ! [1,1,0,0]:
        sp := S6 ! (5, 6);
    when V2 ! [1,0,1,0]:
        sp := S6 ! (2, 5);
    when V2 ! [1,0,0,1]:
        sp := S6 ! (4, 5);
    when V2 ! [0,1,1,0]:
        sp := S6 ! (2, 6);
    when V2 ! [0,1,0,1]:
        sp := S6 ! (4, 6);
    when V2 ! [0,0,1,1]:
        sp := S6 ! (2, 4);
    when V2 ! [1,1,1,0]:
        sp := S6 ! (1, 6);
    when V2 ! [1,1,0,1]:
        sp := S6 ! (3, 5);
    when V2 ! [1,0,1,1]:
        sp := S6 ! (1, 4);
    when V2 ! [0,1,1,1]:
        sp := S6 ! (2, 3);
    when V2 ! [1,1,1,1]:
        sp := S6 ! (1, 3);
end case;

return [* fp, sp *];

end function;


function SomeCharToDivFor111(v)

S4 := SymmetricGroup(4);

V := Parent(v); FF := BaseRing(V);
V1 := VectorSpace(FF, 2);

w1 := V1 ! [ v[1], v[2] ];
w2 := V1 ! [ v[3], v[4] ];
w3 := V1 ! [ v[5], v[6] ];

case w1:
    when V1 ! [0,0]:
        fp := S4 ! 1;
    when V1 ! [1,0]:
        fp := S4 ! (1,2);
    when V1 ! [0,1]:
        fp := S4 ! (1,3);
    when V1 ! [1,1]:
        fp := S4 ! (1,4);
end case;

case w2:
    when V1 ! [0,0]:
        sp := S4 ! 1;
    when V1 ! [1,0]:
        sp := S4 ! (1,2);
    when V1 ! [0,1]:
        sp := S4 ! (1,3);
    when V1 ! [1,1]:
        sp := S4 ! (1,4);
end case;

case w3:
    when V1 ! [0,0]:
        tp := S4 ! 1;
    when V1 ! [1,0]:
        tp := S4 ! (1,2);
    when V1 ! [0,1]:
        tp := S4 ! (1,3);
    when V1 ! [1,1]:
        tp := S4 ! (1,4);
end case;

return [* fp, sp, tp *];

end function;


function SomeDivToCharFor12(pair)
/* Redundant */

S4 := SymmetricGroup(4);
S6 := SymmetricGroup(6);

fp, sp := Explode(pair);
FF := FiniteField(2);
V := VectorSpace(FF, 6);

case fp:
    when S4 ! 1:
        v1 := [0,0];
    when S4 ! (1, 2):
        v1 := [1,0];
    when S4 ! (1, 3):
        v1 := [0,1];
    when S4 ! (1, 4):
        v1 := [1,1];
end case;

case sp:
    when S6 ! 1:
        v2 := [0,0,0,0];
    when S6 ! (1,2):
        v2 := [1,0,0,0];
    when S6 ! (3,4):
        v2 := [0,1,0,0];
    when S6 ! (1,5):
        v2 := [0,0,1,0];
    when S6 ! (3,6):
        v2 := [0,0,0,1];
    when S6 ! (5,6):
        v2 := [1,1,0,0];
    when S6 ! (2,5):
        v2 := [1,0,1,0];
    when S6 ! (4,5):
        v2 := [1,0,0,1];
    when S6 ! (2,6):
        v2 := [0,1,1,0];
    when S6 ! (4,6):
        v2 := [0,1,0,1];
    when S6 ! (2,4):
        v2 := [0,0,1,1];
    when S6 ! (1,6):
        v2 := [1,1,1,0];
    when S6 ! (3,5):
        v2 := [1,1,0,1];
    when S6 ! (1,4):
        v2 := [1,0,1,1];
    when S6 ! (2,3):
        v2 := [0,1,1,1];
    when S6 ! (1,3):
        v2 := [1,1,1,1];
end case;

return V ! (v1 cat v2);

end function;

