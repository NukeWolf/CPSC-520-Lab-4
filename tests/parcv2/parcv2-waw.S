//========================================================================
// parcv2-waw.S
//========================================================================

#include "parc-macros.h"

        TEST_PARC_BEGIN
        //Out-of-Order Commit


        li    $2, 7
        li    $3, 2
        li    $4, 0
        li    $5, 0
        mul   $4 ,$2, $3
<<<<<<< Updated upstream
        addiu $4, $2, $3
=======
        addu $4, $2, $3
>>>>>>> Stashed changes
        TEST_CHECK_EQ( $4, 9)

        TEST_PARC_END
