isUint = (str) ->
	typeof str == "string" && Boolean(str.match(/[1-9]\d*/))

module.exports.isUint = isUint
