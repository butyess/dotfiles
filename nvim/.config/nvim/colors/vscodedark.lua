-- Color scheme 'vscodedark'
-- Approximation of VSCode Dark+ theme using base16
--
-- base16 role mapping:
--   base00 - editor background          #1e1e1e
--   base01 - sidebar/panel background   #252526
--   base02 - selection/highlight        #264f78
--   base03 - comments, ignored          #6a9955
--   base04 - dark foreground            #858585
--   base05 - default foreground         #d4d4d4
--   base06 - light foreground           #e9e9e9
--   base07 - lightest (white)           #ffffff
--   base08 - variables, errors          #f44747  (red)
--   base09 - numbers, constants         #b5cea8  (light green)
--   base0A - classes, warnings          #dcdcaa  (yellow, functions in vscode)
--   base0B - strings                    #ce9178  (orange-brown)
--   base0C - escape chars, regex        #d7ba7d  (gold)
--   base0D - functions, attributes      #569cd6  (blue)
--   base0E - keywords                   #c586c0  (purple)
--   base0F - deprecated, special        #9cdcfe  (light blue, variables)
local palette = {
  base00 = '#1e1e1e',
  base01 = '#252526',
  base02 = '#264f78',
  base03 = '#6a9955',
  base04 = '#858585',
  base05 = '#d4d4d4',
  base06 = '#e9e9e9',
  base07 = '#ffffff',
  base08 = '#f44747',
  base09 = '#b5cea8',
  base0A = '#dcdcaa',
  base0B = '#ce9178',
  base0C = '#d7ba7d',
  base0D = '#569cd6',
  base0E = '#c586c0',
  base0F = '#9cdcfe',
}

require('mini.base16').setup({ palette = palette, use_cterm = true })
vim.g.colors_name = 'vscodedark'
