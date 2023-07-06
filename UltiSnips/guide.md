# Nick's guide to using UltiSnips

## Basics

### Options
- `A` enables automatic expansion
- `r` allows the use of regex expansion
- `b` expands snippet only if trigger is used at the beginning of the line
- `i` expands the snippet regardless of where the trigger is typed (stands for in-word)

The default is to expand the trigger if it starts a new line or is preceded by whitespace.

### Tabstops
Tabstops are created with `$N` where `N` is an integer including 0. Tabstops are visited starting from `$1` in increasing order, whereas `$0` is the special tabstop and will always be the last one visited by the tab trigger. Tabstops can also contain placeholders, e.g. for remembering the order of URL and text when using `\href`
> `${1:placeholder}`, e.g. `\href{${1:url}}{${2:text}}`

Repeating a placeholder will by default create a mirrored tabstop. There are also visual placeholders, where UltiSnips will store in buffer the highlighted text after it is tabbed and place it in the tabstop position specified.
> `\textit{${1:${VISUAL}}}}$0`, useful for converting non-italicised text into italics without awkward yank/pasting.

### Regex snippet triggers
It is easier to give examples in this case:
```
snippet "([^a-zA-Z])trigger" "Expands if 'trigger' is typed after characters other than a-z or A-Z" r
`!p snip.rv = match.group(1)`snippet body
endsnippet

snippet "(^|[^a-zA-Z])trigger" "Expands on a new line or after characters other than a-z or A-Z" r
`!p snip.rv = match.group(1)`snippet body
endsnippet

# This trigger suppresses numbers, too
snippet "(^|[\W])trigger" "Expands on a new line or after characters other than 0-9, a-z, or A-Z" r
`!p snip.rv = match.group(1)`snippet body
endsnippet
```
Now for some more nuanced examples. Making `mm` expand to math mode without affecting words like *communication*, etc.
```
snippet "(^|[^a-zA-Z])mm" "Inline LaTeX math" rA
`!p snip.rv = match.group(1)`\$ ${1:${VISUAL:}} \$$0
endsnippet
```
### Refreshing VimTeX
**Problem**. You update your snippets and want this to be reflected in your current TeX workspace.Solution?
```
" Use <leader>u in normal mode to refresh UltiSnips snippets
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>
```
Put this in your configuration file and you're good to go!
