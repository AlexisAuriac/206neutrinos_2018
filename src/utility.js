// Generated by CoffeeScript 2.4.1
(function() {
  var isUint;

  isUint = function(str) {
    return typeof str === "string" && Boolean(str.match(/^[1-9]\d*$/));
  };

  module.exports.isUint = isUint;

}).call(this);
