/*
 * local_rfc_stringprep.c
 */


/* Upstream library */
#include <stringprep.h>

#include "local_rfc_stringprep.h"

/* Plan to implement */
const Stringprep_profile stringprep_nameprep_downcase[] = {
  {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_2},
  /* {STRINGPREP_NFKC, 0, 0}, */
  { 0 }
};

ScmString * lib_rfc_stringprep(ScmString * s)
{
    const char * inStr = Scm_GetStringConst(s);
    const int inSize = SCM_STRING_SIZE(s);
    /* Prepare enough size buffer (and terminated NULL). */
    /* NOTE: After the NKFC step, almost string size will be reduced although. */
    const int bufferSize = ( inSize * STRINGPREP_MAX_MAP_CHARS * sizeof(uint32_t) ) + 1;
    char * buf = SCM_NEW_ATOMIC_ARRAY(char, bufferSize);

    memset(buf, 0, bufferSize);
    memcpy(buf, inStr, inSize);

    int rc = stringprep(buf, bufferSize, 0, stringprep_nameprep);

    /* TODO expected errors are: */
    /* STRINGPREP_TOO_SMALL_BUFFER: Stringprep failed (100): Output would exceed the buffer space provided */
    /* STRINGPREP_ICONV_ERROR: Stringprep failed (104): Could not convert string in locale encoding. */
    /* STRINGPREP_PROFILE_ERROR:  */

    if (rc != STRINGPREP_OK) {
        Scm_Error("Failed stringprep. [%s with %d]", stringprep_strerror(rc), rc);
    }

    return SCM_STRING(SCM_MAKE_STR_COPYING(buf));
}

/*
 * Module initialization function.
 */
extern void Scm_Init_local_rfc_stringpreplib(ScmModule*);

void Scm_Init_rfc__stringprep(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(gauche_rfc_stringprep);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("rfc.stringprep", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_local_rfc_stringpreplib(mod);
}
