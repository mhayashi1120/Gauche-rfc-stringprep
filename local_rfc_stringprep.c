/*
 * local_rfc_stringprep.c
 */

/* Upstream library */
#include <stringprep.h>

#include "local_rfc_stringprep.h"

#define private static

#include "stringprep_deps.h"

private const Stringprep_profiles local_profiles[] = {
    {"Nameprep*", stringprep_nameprep_keep_case},
    {NULL, NULL}
};

private const Stringprep_profile * findProfile0(const char * profileName, const Stringprep_profiles * profiles) {
    const Stringprep_profiles *p;

    for (p = profiles; p->name; p++) {
        if (strcmp (p->name, profileName) != 0) {
            continue;
        }

        return p->tables;
    }

    return NULL;
}

private const Stringprep_profile * findProfile(ScmString * profile) {
    const char * profileName = Scm_GetStringConst(profile);

    const Stringprep_profile * localDefined = findProfile0(profileName, local_profiles);

    if (localDefined != NULL) {
        return localDefined;
    }

    const Stringprep_profile * preDefined = findProfile0(profileName, stringprep_profiles);

    if (preDefined != NULL) {
        return preDefined;
    }

    Scm_Error("Failed search profile %s", profileName);
}

ScmString * lib_rfc_stringprep(ScmString * s, ScmString * profile)
{
    const char * inStr = Scm_GetStringConst(s);
    const int inSize = SCM_STRING_SIZE(s);
    const Stringprep_profile * profileTable = findProfile(profile);
    /* Prepare enough size buffer (and terminated NULL). */
    /* NOTE: After the NKFC step, almost string size will be reduced although. */
    const int bufferSize = ( inSize * STRINGPREP_MAX_MAP_CHARS * sizeof(uint32_t) ) + 1;
    char * buf = SCM_NEW_ATOMIC_ARRAY(char, bufferSize);

    memset(buf, 0, bufferSize);
    memcpy(buf, inStr, inSize);

    int rc = stringprep(buf, bufferSize, 0, profileTable);

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
