<template>
  <div id="caro">
    <table :class="{ blur: isBlur }" :key="randKey">
      <tr v-for="y in 15" :key="y">
        <td v-for="x in 15" :key="x" @click="mark" :data-coordinate="x + '-' + y" class="center">
        </td>
      </tr>
    </table>
    <caro-announce v-show="isAnnounce" @play="play">
      <h4 v-show="replay">{{ winner }} thắng rồi, chơi lại không?</h4>
    </caro-announce>
  </div>
</template>

<script>
import CaroAnnounce from '../components/caro_announce'
import CaroUtil from '../utils/caro'

export default {
  components: { CaroAnnounce },
  data: function () {
    return {
      isAnnounce: true,
      isBlur: true,
      replay: false,
      p1Turns: [],
      p2Turns: [],
      isP1: true,
      randKey: 0,
      winner: ""
    }
  },
  computed: {
    label: function() {
      return this.isP1 ? "O" : "X"
    },
    color: function() {
      return this.isP1 ? "blue" : "red"
    },
    hasWin: function() {
      if (this.isP1) {
        return CaroUtil.check(this.p1Turns)
      } else {
        return CaroUtil.check(this.p2Turns)
      }
    }
  },
  methods: {
    play: function() {
      if (this.replay) {
        this.randKey = Math.floor(Math.random() * 100) + 20
        this.p1Turns = []
        this.p2Turns = []
      }
      this.isAnnounce = false
      this.isBlur = false
      this.isP1 = true
    },
    mark: function(event) {
      let square = event.target
      if (square.innerHTML.length !== 0) return
      square.innerHTML = this.label
      square.classList.add(this.color)
      if (this.isP1) {
        this.p1Turns.push(CaroUtil.getCoordinate(square))
        this.p1Turns.sort((a, b) => {
          return a[0] - b[0] || a[1] - b[1]
        })
      } else {
        this.p2Turns.push(CaroUtil.getCoordinate(square))
        this.p2Turns.sort((a, b) => {
          return a[0] - b[0] || a[1] - b[1]
        })
      }

      if (this.hasWin) {
        this.winner = this.isP1 ? "Xanh" : "Đỏ"
        this.isAnnounce = true
        this.isBlur = true
        this.replay = true
        this.p1Turns = []
        this.p2Turns = []
        this.isP1 = true
      } else {
        this.isP1 = !this.isP1
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  #caro {
    position: relative;
    table, th, td {
      width: 676px;
      border: 1px solid black;
      border-collapse: collapse;
    }
    table {
      margin: auto;
      td {
        height: 44px;
        width: 44px;
        font-size: 30px;
      }
      .blue {
        color: blue;
      }
      .red {
        color: red;
      }
    }
    .blur {
      filter: blur(2px);
    }
  }
</style>
