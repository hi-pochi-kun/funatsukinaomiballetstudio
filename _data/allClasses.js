const studios = require("./studios.json");

module.exports = function () {
  const seen = new Set();
  const result = [];
  studios.forEach((s) => {
    s.classes.forEach((c) => {
      if (!seen.has(c)) {
        seen.add(c);
        result.push(c);
      }
    });
  });
  return result;
};
