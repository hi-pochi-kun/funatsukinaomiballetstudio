const studios = require("./studios.json");

const DAY_ORDER = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"];

module.exports = function () {
  return studios.map((studio) => {
    const daysSet = new Set();
    const timesSet = new Set();
    studio.schedule.forEach((e) => {
      daysSet.add(e.day);
      timesSet.add(e.time);
    });
    const days = DAY_ORDER.filter((d) => daysSet.has(d));
    const times = Array.from(timesSet).sort();

    const grid = {};
    times.forEach((t) => {
      grid[t] = {};
    });
    studio.schedule.forEach((e) => {
      grid[e.time][e.day] = e.class;
    });

    return { name: studio.name, days, times, grid };
  });
};
