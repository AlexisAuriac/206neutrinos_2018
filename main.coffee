parser = require "./src/argvParser.coffee"

[n, a, h, sd] = parser process.argv.slice(1)

console.log(n, a, h, sd)
