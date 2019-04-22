parser = require "./src/argvParser.coffee"

[n, a, h, sd] = parser process.argv.slice(1)

rl = require('readline').createInterface(
	input: process.stdin,
	output: process.stdout,
	terminal: true
)

rl.setPrompt("> ", 5)

# updateRecords = (line)

handleInput = (input) ->
	console.log(input)
	do rl.prompt

do rl.prompt
rl.on('line', handleInput)
