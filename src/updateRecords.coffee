isUint = require("./utility.coffee").isUint

updateRecords = (line, record) ->
	++record.n
	if not isUint line
		console.error("#{line}: Invalid value")
		process.exit(84)

module.exports = updateRecords
