/***
 *  All relevant isotropic subgroups in the 2-torsion case
 *
 *  Written by Jeroen Sijsling (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


function AllVs2For12()

return [ PowerRSpace(GF(2), 6, 3) |
    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >
];

end function;


function AllVs2For111()

return [ PowerRSpace(GF(2), 6, 3) |
    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 1, 0, 0, 1, 1, 0 ],
        [ GF(2) | 0, 1, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 0, 0, 0 ],
        [ GF(2) | 0, 1, 0, 1, 1, 0 ],
        [ GF(2) | 1, 0, 0, 1, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 0, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 0, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 0, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 1, 0, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 1, 0, 1, 0, 1, 0 ],
        [ GF(2) | 0, 1, 1, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 1, 0, 0, 0, 1 ]
    >,

    sub<VectorSpace(GF(2), 6) |
        [ GF(2) | 1, 1, 1, 1, 0, 0 ],
        [ GF(2) | 0, 1, 1, 0, 1, 0 ],
        [ GF(2) | 1, 0, 1, 0, 0, 1 ]
    >
];

end function;


function LiftFF(c, n)
    return (Integers() ! c)/n;
end function;


function GenerateVFor12(p)

FF := FiniteField(p);
W := VectorSpace(FF, 6);
CP := CartesianPower(W, 3);

while true do
    v1 := Random(W); v2 := Random(W); v3 := Random(W);
    V := sub<W | [v1, v2, v3]>;
    if #V eq p^3 then
        E1 := StandardSymplecticMatrix(1);
        E2 := StandardSymplecticMatrix(2);
        E3 := DiagonalJoin(E1, E2);
        E3FF := ChangeRing(E3, FF);
        test1 := Matrix(v1)*E3FF*Transpose(Matrix(v2)) eq 0;
        test2 := Matrix(v1)*E3FF*Transpose(Matrix(v3)) eq 0;
        test3 := Matrix(v2)*E3FF*Transpose(Matrix(v3)) eq 0;

        V1 := [ v : v in V | &and([ v[3] eq 0, v[4] eq 0, v[5] eq 0, v[6] eq 0 ]) ];
        V2 := [ v : v in V | &and([ v[1] eq 0, v[2] eq 0 ]) ];
        test4 := not ((#V1 eq p) and (#V2 eq p^2));

        if &and([ test1, test2, test3, test4 ]) then
            return V;
        end if;
    end if;
end while;

end function;


function GenerateVFor111(p)

FF := FiniteField(p);
W := VectorSpace(FF, 6);
CP := CartesianPower(W, 3);

while true do
    v1 := Random(W); v2 := Random(W); v3 := Random(W);
    V := sub<W | [v1, v2, v3]>;
    if #V eq p^3 then
        E1 := StandardSymplecticMatrix(1);
        E3 := DiagonalJoin([ E1, E1, E1 ]);
        E3FF := ChangeRing(E3, FF);
        test1 := Matrix(v1)*E3FF*Transpose(Matrix(v2)) eq 0;
        test2 := Matrix(v1)*E3FF*Transpose(Matrix(v3)) eq 0;
        test3 := Matrix(v2)*E3FF*Transpose(Matrix(v3)) eq 0;

        V1 := [ v : v in V | &and([ v[3] eq 0, v[4] eq 0, v[5] eq 0, v[6] eq 0 ]) ];
        V2 := [ v : v in V | &and([ v[1] eq 0, v[2] eq 0 ]) ];
        test4 := not ((#V1 eq p) and (#V2 eq p^2));

        V1 := [ v : v in V | &and([ v[1] eq 0, v[2] eq 0, v[5] eq 0, v[6] eq 0 ]) ];
        V2 := [ v : v in V | &and([ v[3] eq 0, v[4] eq 0 ]) ];
        test5 := not ((#V1 eq p) and (#V2 eq p^2));

        V1 := [ v : v in V | &and([ v[1] eq 0, v[2] eq 0, v[3] eq 0, v[4] eq 0 ]) ];
        V2 := [ v : v in V | &and([ v[5] eq 0, v[6] eq 0 ]) ];
        test6 := not ((#V1 eq p) and (#V2 eq p^2));

        if &and([ test1, test2, test3, test4, test5, test6 ]) then
            return V;
        end if;
    end if;
end while;

end function;
