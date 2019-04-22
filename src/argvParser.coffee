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

parser = (argv) ->
	if argv.length != 5
		console.log(do USAGE)
		process.exit 84

	record = {n: 0, a: 0, h: 0, sd: 0}
	i = 1
	for key in Object.keys record
		if not isUint argv[i]
			console.error("Invalid #{valuesDesc[i - 1]}")
			process.exit 84
		record[key] = Number(argv[i])
		++i
	return record

module.exports = parser
