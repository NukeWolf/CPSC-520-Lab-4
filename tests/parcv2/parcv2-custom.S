//========================================================================
// parcv2-custom.S
//========================================================================

#include "parc-macros.h"

        TEST_PARC_BEGIN



        // Mixed tests

        TEST_RR_OP( mul, 0x0deadbeef, 0x10000000, 0xe0000000 )
        TEST_RR_OP( div, 2000, 5, 4 )
        TEST_RR_OP( rem, 2006, 5, 1 )


        //--------------------------------------------------------------------
        // Bypassing tests
        //--------------------------------------------------------------------

        TEST_RR_DEST_BYP( 0, mul, 13, 11, 143 )
        TEST_RR_DEST_BYP( 1, mul, 14, 11, 154 )

        TEST_RR_SRC01_BYP( 0, 0, mul, 13, 11, 143 )
        TEST_RR_SRC01_BYP( 0, 1, mul, 14, 11, 154 )

        TEST_RR_SRC10_BYP( 2, 1, div, 3024, 11, 274 )
        TEST_RR_SRC10_BYP( 2, 1, rem, 3024, 11, 10 )


        // WAW Test
        li    $2, 5
        addiu $2, $2, 5
        addiu $2, $2, 5
        TEST_CHECK_EQ( $2, 15 )
        
        // Non-ALU Instructions
        li    $2, 7
        li    $3, 2
        li    $4, 3
        li    $5, 5
        mul   $2, $2, $3
        mul   $4, $4, $5
        TEST_CHECK_EQ( $2, 14 )
        TEST_CHECK_EQ( $4, 15 )

        //Out-of-Order Commit


        li    $2, 7
        li    $3, 2
        li    $4, 0
        mul   $4 ,$2, $3
        addiu $4, $2, 3
        TEST_CHECK_EQ( $4, 10)
        TEST_CHECK_EQ( $4, 10)
        TEST_CHECK_EQ( $4, 10)
        TEST_CHECK_EQ( $4, 10)
        



        TEST_PARC_END