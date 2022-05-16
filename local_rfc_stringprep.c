/*
 * local_rfc_stringprep.c
 */


/* Upstream library */
#include <stringprep.h>

#include "local_rfc_stringprep.h"

const Stringprep_profile stringprep_nameprep_downcase[] = {
  {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_2},
  {STRINGPREP_NFKC, 0, 0},
  { 0 }
};

const Stringprep_profile stringprep_nameprep2[] = {
  {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_1},
  /* {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_2}, */
  {STRINGPREP_NFKC, 0, 0},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_1_2},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_2_2},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_3},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_4},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_5},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_6},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_7},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_8},
  {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_9},
  {STRINGPREP_BIDI, 0, 0},
  {STRINGPREP_BIDI_PROHIBIT_TABLE, ~STRINGPREP_NO_BIDI,
   stringprep_rfc3454_C_8},
  {STRINGPREP_BIDI_RAL_TABLE, 0, stringprep_rfc3454_D_1},
  {STRINGPREP_BIDI_L_TABLE, 0, stringprep_rfc3454_D_2},
  {STRINGPREP_UNASSIGNED_TABLE, ~STRINGPREP_NO_UNASSIGNED,
   stringprep_rfc3454_A_1},
  {0}
};

ScmString * lib_rfc_stringprep(ScmString * s)
{
    const char * cStr = Scm_GetStringConst(s);
    const int stringSize = SCM_STRING_SIZE(s) + 1024;
    char * buf = SCM_NEW_ATOMIC_ARRAY(char, stringSize);

    memset(buf, 0, stringSize);
    memcpy(buf, cStr, stringSize);

    int rc = stringprep(buf, stringSize, 0, stringprep_nameprep_downcase);

    /* TODO errors are: */
    /* Stringprep failed (104): Could not convert string in locale encoding. */
    /* Stringprep failed (100): Output would exceed the buffer space provided */

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
