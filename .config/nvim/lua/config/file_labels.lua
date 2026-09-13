local hidden = { java = true, lua = true, rust = true }

return function(name)
	local stem, extension = name:match('^([^.].*)%.([^.]+)$')
	return hidden[extension] and stem or name
end
