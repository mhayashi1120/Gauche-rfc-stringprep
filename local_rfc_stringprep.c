#include <stringprep.h>

/*
 * local_rfc_stringprep.c
 */

#include "local_rfc_stringprep.h"

/*
 * The following function is a dummy one; replace it for
 * your C function definitions.
 */

ScmString * lib_rfc_stringprep(ScmString * s)
{
    const char * cStr = Scm_GetStringConst(s);
    const int stringSize = SCM_STRING_SIZE(s);
    char * buf = SCM_NEW_ATOMIC_ARRAY(char, stringSize);

    memset(buf, 0, stringSize);
    memcpy(buf, cStr, stringSize);

    int rc = stringprep(buf, stringSize, 0, stringprep_nameprep);

  if (rc != STRINGPREP_OK) {
      printf ("Stringprep failed (%d): %s\n", rc, stringprep_strerror (rc));
      /* TODO raise error? */
      /* return SCM_MAKE_STR(sprintf("Error: %s", stringprep_strerror (rc)));; */
      return SCM_STRING(SCM_MAKE_STR(stringprep_strerror (rc)));
  }
  
  return SCM_STRING(SCM_MAKE_STR(buf));
}

/*
 * Module initialization function.
 */
extern void Scm_Init_local_rfc_stringpreplib(ScmModule*);

void Scm_Init_local_rfc_stringprep(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(gauche_rfc_stringprep);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("rfc.stringprep", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_local_rfc_stringpreplib(mod);
}
