// > commit 518b72c7273278d24cb79ac1485972e42cf98ed4
// > Date:   Thu Jun 29 12:52:57 2017 +0200

// > * Noteworthy changes in release 1.35 (2018-05-11) [stable]
// > ** Reflect ABI/API breakage in version 1.34
// >   (Stringprep_profile has a new struct member)
// >   Reported-by: Miroslav Lichvar

// any version between 1.34, 1.35, 1.36
// maybe added `Stringprep_table` `table_size` field

/* Same as `stringprep_nameprep` except `stringprep_rfc3454_B_2` mapping */
private const Stringprep_profile stringprep_nameprep_keep_case[] = {
    {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_1, 27},
    {STRINGPREP_NFKC, 0, 0, 0},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_1_2, 17},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_2_2, 16},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_3, 3},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_4, 18},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_5, 1},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_6, 5},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_7, 1},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_8, 15},
    {STRINGPREP_PROHIBIT_TABLE, 0, stringprep_rfc3454_C_9, 2},
    {STRINGPREP_BIDI, 0, 0, 0},
    {STRINGPREP_BIDI_PROHIBIT_TABLE, ~STRINGPREP_NO_BIDI,
     stringprep_rfc3454_C_8, 15},
    {STRINGPREP_BIDI_RAL_TABLE, 0, stringprep_rfc3454_D_1, 34},
    {STRINGPREP_BIDI_L_TABLE, 0, stringprep_rfc3454_D_2, 360},
    {STRINGPREP_UNASSIGNED_TABLE, ~STRINGPREP_NO_UNASSIGNED,
     stringprep_rfc3454_A_1, 396},
    {0}
};
