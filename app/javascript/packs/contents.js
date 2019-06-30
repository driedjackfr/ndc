import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Contents from '../components/contents'

Vue.use(TurbolinksAdapter)
// TODO: fix js errors
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#container',
    components: { Contents }
  })
})
