parser = require "./src/argvParser.coffee"
updateRecords = require "./src/updateRecords.coffee"

record = parser process.argv.slice(1)

rl = require('readline').createInterface(
	input: process.stdin,
	output: process.stdout,
	terminal: true
)

rl.setPrompt("Enter next value: ")

dispRecords = (r) ->
	console.log("""
		\tNumber of values:	#{r.n}
		\tStandard deviation	#{r.rms.toFixed(2)}
		\tArithmetic mean:	#{r.a.toFixed(2)}
		\tRoot mean square:	#{r.sd.toFixed(2)}
		\tHarmonic mean:		#{r.h.toFixed(2)}

	""")

handleInput = (input) ->
	if input == "END"
		process.exit 0
	record = updateRecords input, record
	dispRecords record
	do rl.prompt

do rl.prompt
rl.on('line', handleInput)
rl.on('close', () -> process.exit 84)
