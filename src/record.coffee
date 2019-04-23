class Record
	constructor: (n = 0, a = 0, h = 0, sd = 0, rms = 0) ->
		this.n = n
		this.a = a
		this.h = h
		this.sd = sd
		this.rms = rms

	copy: -> new Record(...Object.values(this))

module.exports = Record
