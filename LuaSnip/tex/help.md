# Configuration

## Regex-enabled Snippets
The following are the three main regex-enabled snippet conditions that you will likely need to use:
1. `[^%a]` = expands are blank spaces, punctuation marks and other delimiters but not after alphanumeric characters
2. `[%a]` = only after letters
3. `[%a]%]%}%)]` = only after letters or closing delimiters like `)`, `}` or `]

Other available options are:
-  `.` = all characters
- `%d` = digits
- `%a` = letters (upper and lowercase)
- `%w` = alphanumeric characters
- `%s` = whtespace characters
