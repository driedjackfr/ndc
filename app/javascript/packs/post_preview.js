import axios from 'axios'

document.addEventListener('turbolinks:load', () => {
  document.getElementById('preview').addEventListener('click', e => {
    e.preventDefault()
    document.getElementById('post_body').style.display = "none";
    document.getElementById('post-preview').style.display = "block";
    axios.get('/admin/posts/preview.json', {
        params: {
          text: document.getElementById('post_body').value
        }
      })
      .then(function (response) {
        document.getElementById('post-preview').insertAdjacentHTML('beforeend', response.data.raw_html)
      })
      .catch(function (error) {
        // handle error
        console.log(error);
        document.getElementById('post-preview').append(error)
      })
      .finally(function () {
        // always executed
      });
  })

  document.getElementById('raw').addEventListener('click', e => {
    e.preventDefault()
    let preview = document.getElementById('post-preview')
    while (preview.firstChild) {
        preview.removeChild(preview.firstChild)
    }
    document.getElementById('post_body').style.display = "block"
    preview.style.display = "none"
  })
})
