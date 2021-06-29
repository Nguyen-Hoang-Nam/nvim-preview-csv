local api = vim.api
local M = {}

local function print_separate_line(col_length, len, left, mid, separator, right)
	-- local len = #col_length
	local line = left

	for i = 1, len do
		local mid_line = ''
		for _ = 1, col_length[i] + 2 do
			mid_line = mid_line .. mid
		end

		line = line .. mid_line
		if i ~= len then
			line = line .. separator
		else
			line = line .. right
		end
	end

	return line
end

function M.preview_csv()
	local current_buf = api.nvim_get_current_buf()
	local filename = api.nvim_eval("expand('%:t')")

	local number_line = api.nvim_buf_line_count(current_buf)
	if number_line == 0 then
		return
	end

	local all_line = api.nvim_buf_get_lines(current_buf, 0, number_line, false)
	local csv_view = {}

	local _, number_columns = string.gsub(all_line[1], ',', '')
	number_columns = number_columns + 1

	local max_col_length = {}
	for _ = 1, number_columns do
		table.insert(max_col_length, 0)
	end

	for _, row in ipairs(all_line) do
		local cells = {}
		local i = 1
		for cell in string.gmatch(row, '[^","]+') do
			cell = cell or ''
			if #cell > max_col_length[i] then
				max_col_length[i] = #cell
			end
			i = i + 1

			table.insert(cells, cell)
		end

		table.insert(csv_view, cells)
	end

	local result = {}
	table.insert(result, print_separate_line(max_col_length, number_columns, '┌', '─', '┬', '┐'))

	for _, row in ipairs(csv_view) do
		if #result > 1 then
			table.insert(result, print_separate_line(max_col_length, number_columns, '├', '─', '┼', '┤'))
		end

		local line = '│'
		for i = 1, #row do
			line = string.format('%s %-' .. max_col_length[i] .. 's │', line, row[i])
		end

		table.insert(result, line)
	end

	table.insert(result, print_separate_line(max_col_length, number_columns, '└', '─', '┴', '┘'))

	local new_buf = api.nvim_create_buf(true, true)
	api.nvim_buf_set_name(new_buf, 'Preview ' .. filename)
	api.nvim_set_current_buf(new_buf)
	api.nvim_buf_set_lines(new_buf, 0, number_line, false, result)
end

function M.preview()
	local filetype = api.nvim_eval("expand('%:e')")

	if filetype == 'csv' then
		M.preview_csv()
	end
end

return M
