/*
 * gauche_rfc_stringprep.c
 */

#include "gauche_rfc_stringprep.h"

/*
 * The following function is a dummy one; replace it for
 * your C function definitions.
 */

ScmObj test_gauche_rfc_stringprep(void)
{
    return SCM_MAKE_STR("gauche_rfc_stringprep is working");
}

/*
 * Module initialization function.
 */
extern void Scm_Init_gauche_rfc_stringpreplib(ScmModule*);

void Scm_Init_gauche_rfc_stringprep(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(gauche_rfc_stringprep);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("gauche_rfc_stringprep", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_gauche_rfc_stringpreplib(mod);
}
