//========================================================================
<<<<<<< Updated upstream
// parcv2-ooo.S
=======
// parcv2-rob-byp.S
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
        TEST_PARC_END
=======
        TEST_PARC_END
>>>>>>> Stashed changes
