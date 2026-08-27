module.exports = function (eleventyConfig) {
  // css, images はそのままコピー
  eleventyConfig.addPassthroughCopy("css");
  eleventyConfig.addPassthroughCopy("images");

  // 住所などをURLに埋め込めるようにエンコードするフィルター(Nunjucksに標準搭載されていないため追加)
  eleventyConfig.addFilter("urlencode", function (str) {
    return encodeURIComponent(str || "");
  });

  return {
    dir: {
      input: "content",
      includes: "../_includes",
      data: "../_data",
      output: "_site",
    },
    templateFormats: ["md", "njk"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
  };
};
