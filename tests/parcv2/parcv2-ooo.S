//========================================================================
// parcv2-ooo.S
//========================================================================

#include "parc-macros.h"

        TEST_PARC_BEGIN
        //Out-of-Order Commit


        li    $2, 7
        li    $3, 2
        li    $4, 0
        li    $5, 0
        mul   $4 ,$2, $3
        addiu $4, $2, 3
        addiu $5, $5, 1
        addiu $5, $5, 1
        addiu $5, $5, 1
        addiu $5, $5, 1
        addiu $5, $5, 1
        TEST_CHECK_EQ( $4, 10)

        TEST_PARC_END