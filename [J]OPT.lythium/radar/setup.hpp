#define STR_RADAR_DEPLOY "Radar aufbauen"
#define STR_RADAR_UNDEPLOY "Radar abbauen"

#define STR_RADAR_HINT_HEADER "Radar-Dämpfung"
#define STR_RADAR_HINT_TEXT "Dämpfung durch Gelände"

#define RADAR_COMPOSITION [ \
    ["Land_TTowerSmall_1_F", [-0.5, 0.5, 0.0], 0], \
    ["CamoNet_ghex_big_F", [0.0, 0.0, 0.0], 0] \
]

#define RADAR_DAMPING(var1) round((count var1)/350)