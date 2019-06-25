export default {
  check: function (turns) {
    if (turns.length < 4) return
    let sameX, sameY
    let dupsX = []

    turns.forEach(c => {
      if (c[0] === sameX) {
        dupsX[0].push(c)
      } else {
        dupsX.unshift([c])
        sameX = c[0]
      }
    })
    let foursX = dupsX.filter(c => c.length >= 4)
    let column = foursX.some(cs => {
      let compareY = -1
      let conse = []
      cs.forEach(c => {
        if (c[1] === compareY + 1) {
          conse[0].push(c[1])
        } else {
          conse.unshift([c[1]])
        }
        compareY = c[1]
      })
      console.log(conse)
      return conse.some(y => y.length >= 4)
    })

    let dupsY = turns.reduce((acc, c) => {
      let key = c[1]
      if (!acc[key]) {
        acc[key] = []
      }
      acc[key].push(c)
      return acc
    }, {})
    let foursY = Object.values(dupsY).filter(c => c.length >= 4)
    let row = foursY.some(cs => {
      let compareX = -1
      let conse = []
      cs.forEach(c => {
        if (c[0] === compareX + 1) {
          conse[0].push(c[0])
        } else {
          conse.unshift([c[0]])
        }
        compareX = c[0]
      })
      console.log(conse)
      return conse.some(x => x.length >= 4)
    })
    return column || row
  },
  getCoordinate: function(elm) {
    return elm.dataset.coordinate.split("-").map(n => parseInt(n))
  }
}
