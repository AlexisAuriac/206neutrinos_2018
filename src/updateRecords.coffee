isUint = require("./utility.coffee").isUint

updateArithmeticMean = (record, val) ->
	record.a = record.a  + (val - record.a) / record.n

updateRecords = (line, record) ->
	++record.n
	if not isUint line
		console.error("#{line}: Invalid value")
		process.exit(84)
	val = Number(line)
	updateArithmeticMean record, val

module.exports = updateRecords
