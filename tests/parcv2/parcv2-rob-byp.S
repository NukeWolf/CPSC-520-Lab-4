//========================================================================
// parcv2-ooo.S
//========================================================================

#include "parc-macros.h"

        TEST_PARC_BEGIN
        //Out-of-Order Commit


        li    $2, 1
        addu  $4, $2, $2
        addu  $4, $4, $4
        addu  $4, $4, $4
        addu  $4, $4, $4
        addu  $4, $4, $4
        TEST_CHECK_EQ( $4, 32)

        TEST_PARC_END