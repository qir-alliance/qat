$(document).ready(function () {
  var rockLang = function (hljs) {
    return {
      case_insensitive: false, // language is case-insensitive
      keywords:
        "else for if while let fn continue return break context pattern route",
      contains: [
        {
          className: "string",
          begin: '"',
          end: '"',
        },
        {
          className: "string",
          begin: "'",
          end: "'",
        },
        {
          className: "literal",
          begin: "true|false",
        },
        {
          className: "number",
          begin: "\\d+(i8|i16|i32|i64|u8|u16|u32|u64)",
        },
        hljs.COMMENT(
          "//", // begin
          "\n", // end
          {
            contains: [
              {
                className: "doc",
                begin: "@\\w+",
              },
            ],
          }
        ),
        hljs.COMMENT(
          "/\\*", // begin
          "\\*/", // end
          {
            contains: [
              {
                className: "doc",
                begin: "@\\w+",
              },
            ],
          }
        ),
      ],
    };
  };

  hljs.registerLanguage("rocklang", rockLang);
});
