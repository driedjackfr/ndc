window.addEventListener('DOMContentLoaded', (event) => {
  document.getElementById("new_comment").addEventListener("ajax:success", e => {
    console.log(e.detail)
    document.getElementById("body-error").innerHTML = ''
    document.getElementById("comment_body").value = ''
  })
  document.getElementById("new_comment").addEventListener("ajax:error", e => {
    document.getElementById("body-error").innerHTML = e.detail[0].body

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
