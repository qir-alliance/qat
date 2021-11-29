$(document).ready(function () {
  $("#sidebarOpen").click(function () {
    $("#sidebar").removeClass("hidden");
  });
  $("#sidebarClose").click(function () {
    $("#sidebar").addClass("hidden");
  });

  $("#mkdocs-search-query").focus(function () {
    $("#searchResults").removeClass("hidden");
    $("#searchOverlay").removeClass("hidden");
  });
  $(".searchOverlayElement").click(function () {
    console.log("click click");
    $("#searchResults").addClass("hidden");
    $("#searchOverlay").addClass("hidden");
  });
  $("#mkdocs-search-query").change(function () {
    doSearch();
  });
});

function gotoSearch(url) {
  console.log("Hello: ", url);
  window.location.href = url;
  setTimeout(function () {
    $("#searchResults").addClass("hidden");
    $("#searchOverlay").addClass("hidden");
  }, 25);
}
