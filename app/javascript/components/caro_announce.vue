<template>
    <div class="announce">
    <slot></slot>
    <button class="btn" @click="$emit('play')">
      Chơi thôi
    </button>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
.announce {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  text-align: center;
  button {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  }
}
</style>
