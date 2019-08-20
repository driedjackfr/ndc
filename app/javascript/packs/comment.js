window.addEventListener('turbolinks:load', (event) => {
  document.getElementById("new_comment").addEventListener("ajax:success", e => {
    document.getElementById("body-error").innerHTML = ''
    document.getElementById("comment_body").value = ''
  })
  document.getElementById("new_comment").addEventListener("ajax:error", e => {
    document.getElementById("body-error").innerHTML = e.detail[0].body
  })
});
