local function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

local module = {}

function module.getGitDir(path)
	if not path or #path < 1 then
		return path
	end

	local count = 0
	local error = false
	while path and path ~= "/" and not exists(path .. "/.git") do
		path = path:match("(.*)/")
		count = count + 1

		-- Maximum 30 attempt to avoid infinite loop
		-- a directory with more then 30 depth levels is not supported
		if count > 30 then
			error = true
			break
		end
	end

	if error or path == "/" then
		return nil
	end

	return path
end

return module
