<template>
  <div id="caro-comp">
    <h1>Chơi caro nào!</h1>
    <button class="btn">Chơi với máy</button>
    <button class="btn">Chơi với bạn</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Tạo phòng"
    }
  }
}
</script>

<style lang="scss" scoped>
#caro-comp {
  text-align: center;
  h1 {
    margin-bottom: 10px;
  }
}
</style>
