#
#
#

# Extract variables from input
#
# The input format is defined as a JSON array where:
#    - [0] = a JSON object representing a map from
#            effect names to effect escape codes.
#            For example: {"bold": "01"}
#    - [1] = a JSON object representing a map from
#            color names to color escape codes.
#            For example: {"blue": "0;0;255"}
#    - [2] = a JSON array of objects where each object
#            represents a single entry in LS_COLORS.
#            For example: {"blob": "*", "effect": "bold", "color": "blue"}
#
.[0] as $effectmap |
.[1] as $colormap  |
.[2] as $colors    |

# Save magic string literals as variables
#
#    - colorregex = a regular expression that matches the
#                   required format for LS_COLORS colors.
#                   Note that this matches any 3-digit numbers
#                   separated by semicolons (123;456;789) even
#                   though LS_COLORS needs each number to be
#                   less than 256. Thus doesn't catch all errors.
#    - effectregex = a regular expression that matches the
#                    required format for LS_COLORS effects.
#                    The only options are 00, 01, & 04. Other
#                    LS_COLORS effects are not supported.
#   - esc = a string literal for the 24-bit color escape code.
#
"^\\d{1,3};\\d{1,3};\\d{1,3}$" as $colorregex |
"^00|01|04$" as $effectregex |
";38;2;" as $esc |

# Build a list of LS_COLORS entries
#
# For each color entry, we replace named effects & named
# colors with the corresponding values in the effect &
# color maps. The values of each effect & color are then
# validated using the regular expressions defined above.
# Finally, the LS_COLORS entry is built by concatenating
# the various values into a format like: "*.md=00;38;2;122;122;122"
# 
[
    $colors[] |                        # Operate on each color
    .effect |= ($effectmap[.] // .) |  # Fill in named effects
    .color  |= ($colormap[.]  // .) |  # Fill in named colors
    .effect |= (scan($effectregex) // error("invalid effect: " + .)) |  # Check effect format
    .color  |= (scan($colorregex)  // error("invalid color: "  + .)) |  # Check color format
    (.glob + "=" + .effect + $esc + .color)  # Concatenate values
] |

# Combine all LS_COLORS entries
#
# The LS_COLORS environment variable requires the
# individual entries be separated by a colon.
join(":")
