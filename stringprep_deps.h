/* Same as `stringprep_nameprep` except `stringprep_rfc3454_B_2` mapping */
private const Stringprep_profile stringprep_nameprep_keep_case[] = {
    {STRINGPREP_MAP_TABLE, 0, stringprep_rfc3454_B_1},
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

