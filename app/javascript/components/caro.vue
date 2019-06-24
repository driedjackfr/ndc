<template>
  <div id="caro">
    <table :class="{ blur: isBlur }" :key="randKey">
      <tr v-for="y in 15" :key="y">
        <td v-for="x in 15" :key="x" @click="mark" :data-coordinate="x + '-' + y" class="center">
        </td>
      </tr>
    </table>
    <caro-announce v-show="isAnnounce" @play="play">
      <p v-show="replay">Hết game rồi, chơi lại không?</p>
    </caro-announce>
  </div>
</template>

<script>
import CaroAnnounce from '../components/caro_announce'

export default {
  components: { CaroAnnounce },
  data: function () {
    return {
      isAnnounce: true,
      isBlur: true,
      replay: false,
      p1Turns: [],
      p1LastTurn: [],
      p2Turns: [],
      p2LastTurn: [],
      isP1: true,
      randKey: 0
    }
  },
  computed: {
    label: function() {
      return this.isP1 ? "O" : "X"
    },
    color: function() {
      return this.isP1 ? "blue" : "red"
    },
    endGame: function() {
      if (this.isP1) {
        if (this.p1Turns.length > 3) {
          let xs = this.p1Turns.map(x => x[0])
          let ys = this.p1Turns.map(x => x[1])
          let res = [{coord: [], ind: []}]
          let first = xs[0]
          console.log(xs)
          xs.forEach((x, i) => {
          	if (x === first) {
          		res[0].coord.push(x)
          		res[0].ind.push(i)
            } else if (x === first + 1) {
          		res[0].coord.push(x)
          		res[0].ind.push(i)
          		first = x
            } else {
          		res.unshift({coord: [x], ind: [i]})
          		first = x
            }
          })
          console.log('loc ra')
          console.log(res)
          return res.some(a => {
            return a.coord[a.coord.length - 1] - a.coord[0] >= 3
          })
        }
      } else {
        return false
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
        this.p1Turns.push(this.getCoordinate(square))
        this.p1Turns.sort((a, b) => {
          return a[0] - b[0] || a[1] - b[1]
        })
        console.log(this.p1Turns)
      } else {
        this.p2Turns.push(this.getCoordinate(square))
        console.log(this.p2Turns)
      }

      if (this.endGame) {
        this.isAnnounce = true
        this.isBlur = true
        this.replay = true
        this.p1Turns = []
        this.p2Turns = []
        this.isP1 = true
      }

      this.isP1 = !this.isP1
    },
    getCoordinate: function(elm) {
      return elm.dataset.coordinate.split("-").map(n => parseInt(n))
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
