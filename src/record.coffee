isUint = require("./utility.coffee").isUint

rmsFromMeanAndStddev = (u, sd) ->
	return Math.sqrt(u**2 + sd**2)

module.exports = class Record
	constructor: (n = 0, a = 0, h = 0, sd = 0, rms) ->
		this.n = n
		this.a = a
		this.h = h
		this.sd = sd
		this.rms = 0
		if rms != undefined
			this.rms = rms
		else
			this.rms = rmsFromMeanAndStddev(a, sd)

	copy: -> new Record(...Object.values(this))

	toString: (r) ->
		return """
			\tNumber of values:	#{this.n}
			\tStandard deviation	#{this.sd.toFixed(2)}
			\tArithmetic mean:	#{this.a.toFixed(2)}
			\tRoot mean square:	#{this.rms.toFixed(2)}
			\tHarmonic mean:		#{this.h.toFixed(2)}

		"""

	updateArithmeticMean: (old, val) ->
		this.a = old.a  + (val - old.a) / this.n

	updateRMS: (old, val) ->
		this.rms = Math.sqrt((old.n * old.rms**2 + val**2) / this.n)

	updateStandardDeviation: (old, val) ->
		this.sd = Math.sqrt(this.rms**2 - this.a**2)

	updateHarmonicMean: (old, val) ->
		this.h = (old.n + 1) / (old.n / old.h + 1 / val)

	update: (line) ->
		old = do this.copy

		++this.n
		if not isUint line
			console.error("#{line}: Invalid value")
			process.exit(84)
		val = Number(line)
		this.updateArithmeticMean old, val
		this.updateRMS old, val
		this.updateStandardDeviation old, val
		this.updateHarmonicMean old, val
