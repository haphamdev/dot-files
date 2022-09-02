local q = require('vim.treesitter.query')
local function i(value)
    print(vim.inspect(value))
end

local query_string = [[
    (class_declaration
        (class_body
            (function_declaration
                (modifiers
                    (annotation
                        (single_annotation
                            (user_type
                                identifier: (type_identifier) @anno (#eq? @anno "Test")
                            )
                        )
                    )
                )
                identifier: (simple_identifier) @method
            ) @method_body (#offset! @method_body)
        )
    )
]]

-- Check if a position is in a range
-- For example: check if the cursor is currently inside a function
-- range: {l0, c0, l1, c0}
-- position: line, col
local function in_position(range, line, col)
    local start_line, start_col, end_line, end_col = unpack(range)

    if line == start_line then
        return start_col <= col
    elseif line == end_line then
        return end_col >= col
    else
        return start_line < line and line < end_line
    end
end

local bufnr = 38
local cursor_line = 44
local cursor_col = 8
local lang_tree = vim.treesitter.get_parser(bufnr, 'kotlin')
local syntax_tree = lang_tree:parse()
local root = syntax_tree[1]:root()

local query = vim.treesitter.parse_query('kotlin', query_string)

local lines = {}
local file_name = vim.api.nvim_buf_get_name(bufnr)

for _, captures, metadata in query:iter_matches(root, bufnr) do
    local method_name = q.get_node_text(captures[2], bufnr)
    local offset = metadata.content[1]

    -- if in_position(offset, cursor_line, cursor_col) then
    --     vim.api.nvim_command("make test --tests " .. "'" .. method_name .. "'")
    --     break
    -- end

    table.insert(
        lines,
        file_name .. ':' .. (offset[1] + 1) .. ':' .. (offset[2] + 1) .. ':' .. method_name
    )
end

local bf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(bf, 0, -1, false, lines)
vim.api.nvim_command("cbuffer" .. bf)

