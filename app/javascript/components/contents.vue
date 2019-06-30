<template>
  <ul id="toc">
    <li v-for="h2 in h2s" :key="h2.id">
      <a :href="'#' + h2.id" data-turbolinks="false" class="link">{{ h2.text }}</a>
      <ul v-if="h2.h3.length > 0">
        <li v-for="h3 in h2.h3" :key="h3[0]">
          <a :href="'#' + h3[0]" data-turbolinks="false" class="link">{{ h3[1] }}</a>
        </li>
      </ul>
    </li>
  </ul>
</template>

<script>
export default {
  data: function () {
    return {
      h2s: {}
    }
  },
  created: function() {
    let h2s = Array.from(document.querySelectorAll(".post-body > h2")).reduce((acc, node) => {
      acc[node.id] = { id: node.id, text: node.textContent, h3: [] }
      return acc
    }, {})
    if (Object.keys(h2s).length > 0) {
      document.querySelectorAll('h3').forEach(h => {
        let sibl = h.previousElementSibling
        let notH2 = sibl.tagName !== "H2"
        while (notH2) {
          sibl = sibl.previousElementSibling
          if (sibl.tagName === "H2") { notH2 = false }
        }
        h2s[sibl.id].h3.push([h.id, h.textContent])
      })
    }
    this.h2s = h2s
  }
}
</script>

<style lang="scss" scoped>
#toc {
  position: fixed;
  top: 190px;
  left: 40px;
  width: 200px;
  ul {
    margin-left: 15px;
  }
  a {
    border-bottom: none;
  }
}
@media only screen and (max-width: 1190px) {
  #toc {
    position: static;
    width: 100%;
  }
  ul {
    list-style: none;
  }
}
</style>
