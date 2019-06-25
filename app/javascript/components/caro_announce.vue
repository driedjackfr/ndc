<template>
    <div class="announce">
      <div class="modal">
        <slot></slot>
        <button class="btn" @click="$emit('play')">
          Chơi thôi
        </button>
      </div>
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
  .modal {
    width: 400px;
    background: #fff;
    padding: 20px;
    margin: 270px auto;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    h4 {
      margin-bottom: 10px;
    }
  }
}
</style>
