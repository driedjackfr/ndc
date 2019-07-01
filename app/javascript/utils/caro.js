export default function (turns, oppositeTurns) {
  if (turns.length < 5) return
  return isSameX(turns, oppositeTurns) || isSameY(turns, oppositeTurns) ||
         isCrossFromLeft(turns, oppositeTurns) || isCrossFromRight(turns, oppositeTurns)
}

function isSameX(turns, oppositeTurns) {
  let hold = []
  let compare
  turns.forEach(turn => {
    if (turn === compare + 1) {
      hold[0].push(turn)
    } else {
      hold.unshift([turn])
    }
    compare = turn
  })
  let conse5 = hold.filter(g => {
    return g.length === 5 && ceil15(g[0]) === ceil15(g[4])
  })
  let conseMore = hold.filter(g => {
    return g.length > 5 && ceil15(g[0]) !== ceil15(g[g.length - 1])
  })
  let isConse5 = conse5.some(g => {
    return !(oppositeTurns.includes(g[0] - 1) && oppositeTurns.includes(g[4] + 1) && ceil15(g[0] - 1) === ceil15(g[0]) && ceil15(g[4] + 1) === ceil15(g[0]))
  })
  let isConseMore = conseMore.some(g => {
    return g.indexOf(ceil15(g[0]) * 15) === 4 || g.indexOf(ceil15(g[0]) * 15) + 5 === g.length - 1
  })
  return isConse5 || isConseMore
}

function ceil15(n) {
  return Math.ceil(n / 15)
}

function isSameY(turns, oppositeTurns) {
  return checkCrossY(turns, oppositeTurns, 15)
}

function isCrossFromLeft(turns, oppositeTurns) {
  return checkCrossY(turns, oppositeTurns, 16)
}

function isCrossFromRight(turns, oppositeTurns) {
  return checkCrossY(turns, oppositeTurns, 14)
}

function checkCrossY(turns, oppositeTurns, distant) {
  let hold = []
  turns.forEach(turn => {
    let match = hold.find(e => e[0] + distant === turn)
    if (match) {
      match.unshift(turn)
    } else {
      hold.push([turn])
    }
  })
  let result = hold.filter(e => e.length === 5)
  return result.some(g => {
    return !(oppositeTurns.includes(g[0] + distant) && oppositeTurns.includes(g[g.length - 1] - distant))
  })
}
