<template>
  <div id="caro-comp">
    <h1>Chơi caro nào!</h1>
    <button>Chơi với bạn</button>
    <button>{{ message }}</button>
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

<style scoped>
#caro-comp {
  text-align: center;
}
</style>
