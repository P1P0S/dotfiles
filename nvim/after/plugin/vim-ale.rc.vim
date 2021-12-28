let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint', 'prettier']}
let g:ale_completion_enabled = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'],
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1
