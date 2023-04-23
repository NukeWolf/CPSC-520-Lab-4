//========================================================================
// parcv2-custom.S
//========================================================================

#include "parc-macros.h"

        TEST_PARC_BEGIN


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



        TEST_PARC_END