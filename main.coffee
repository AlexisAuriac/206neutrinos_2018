parser = require "./src/argvParser.coffee"

record = parser process.argv.slice(1)

rl = require('readline').createInterface(
	input: process.stdin,
	output: process.stdout
)

rl.setPrompt("Enter next value: ")

handleInput = (input) ->
	if input == "END"
		process.exit 0
	record.update input
	console.log record.toString()
	console.log ""
	do rl.prompt

do rl.prompt

rl.on('line', handleInput)
rl.on('close', () -> process.exit 84)
