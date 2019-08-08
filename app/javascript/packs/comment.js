window.addEventListener('DOMContentLoaded', (event) => {
  document.getElementById("new_comment").addEventListener("ajax:error", e => {
    console.log(e)
  })
});

// $(document).ready(function() {
//   alert('a')
//   return $("#new_article").on("ajax:success", function(event) {
//     var data, ref, status, xhr;
//     ref = event.detail, data = ref[0], status = ref[1], xhr = ref[2];
//     return $("#new_article").append(xhr.responseText);
//   }).on("ajax:error", function(event) {
//     return $("#new_article").append("<p>ERROR</p>");
//   });
// });
