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

isUint = (str) ->
	typeof str == "string" && Boolean(str.match(/[1-9]\d*/))

isInt = (str) ->
	typeof str == "string" && Boolean(str.match(/\d+/))


parser = (argv) ->
	if argv.length != 5
		console.log(do USAGE)
		process.exit 84

	values = []
	for i in [1..4]
		if not isUint argv[i]
			console.error("Invalid #{valuesDesc[i - 1]}")
			process.exit 84
		values.push(Number(argv[i]))
	return values

module.exports = parser
