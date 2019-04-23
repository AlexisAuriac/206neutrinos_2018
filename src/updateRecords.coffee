isUint = require("./utility.coffee").isUint

updateArithmeticMean = (oldR, newR, val) ->
	newR.a = oldR.a  + (val - oldR.a) / newR.n

# updateStandardDeviation = (oldR, newR, val) ->
# 	oldVar = oldR.sd ** 2
# 	record.a = record.a  + (val - record.a) / record.n

updateRecords = (line, record) ->
	newRecord = do record.copy

	++newRecord.n
	if not isUint line
		console.error("#{line}: Invalid value")
		process.exit(84)
	val = Number(line)
	updateArithmeticMean record, newRecord, val
	# updateStandardDeviation record, val
	return newRecord

module.exports = updateRecords
