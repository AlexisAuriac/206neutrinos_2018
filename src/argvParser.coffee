isUint = require("./utility.coffee").isUint
Record = require("./record.coffee")

USAGE = (bin) -> """
USAGE
	#{bin} n a  h sd

DESCRIPTION
	n		number of values
	a		arithmetic mean
	h		harmonic mean
	sd		standard deviation
"""

valuesDesc = [
	"number of values",
	"arithmetic mean",
	"harmonic mean",
	"standard deviation"
]

parser = (argv) ->
	if argv.length != 5
		console.log(do USAGE)
		process.exit 84

	values = []
	for i in [1..4]
		if not isUint argv[i]
			console.error("#{argv[i]}: Invalid #{valuesDesc[i - 1]}")
			process.exit 84
		values.push(Number(argv[i]))
	return new Record(...values)

module.exports = parser
