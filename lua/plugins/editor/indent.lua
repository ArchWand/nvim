return { -- Detect tabstop and shiftwidth automatically
  'Darazaki/indent-o-matic',
  opts = {
    -- Number of lines without indentation before giving up (use -1 for infinite)
    max_lines = 2048,

    -- Space indentations that should be detected
    standard_widths = { 1, 2, 4, 8 },

    -- Skip multi-line comments and strings (more accurate detection but less performant)
    skip_multiline = true,
  },
}
