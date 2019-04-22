parser = require "./src/argvParser.coffee"

[n, a, h, sd] = parser process.argv.slice(1)

rl = require('readline').createInterface(
	input: process.stdin,
	output: process.stdout,
	terminal: true
)

rl.setPrompt("Enter next value: ")

updateRecords = (line) -> ++n

dispRecords = ->
	console.log("""
		\tNumber of values:	#{n}
		\tStandard deviation	0
		\tArithmetic mean:	0
		\tRoot mean square:	0
		\tHarmonic mean:		0

	""")

handleInput = (input) ->
	if input == "END"
		process.exit 0
	updateRecords input
	do dispRecords
	do rl.prompt

do rl.prompt
rl.on('line', handleInput)
# rl.on('close', () -> console.log "END")
