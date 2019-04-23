// Generated by CoffeeScript 2.4.1
(function() {
  var isUint, updateArithmeticMean, updateRecords;

  isUint = require("./utility.js").isUint;

  updateArithmeticMean = function(oldR, newR, val) {
    return newR.a = oldR.a + (val - oldR.a) / newR.n;
  };

  // updateStandardDeviation = (oldR, newR, val) ->
  // 	oldVar = oldR.sd ** 2
  // 	record.a = record.a  + (val - record.a) / record.n
  updateRecords = function(line, record) {
    var newRecord, val;
    newRecord = record.copy();
    ++newRecord.n;
    if (!isUint(line)) {
      console.error(`${line}: Invalid value`);
      process.exit(84);
    }
    val = Number(line);
    updateArithmeticMean(record, newRecord, val);
    // updateStandardDeviation record, val
    return newRecord;
  };

  module.exports = updateRecords;

}).call(this);
