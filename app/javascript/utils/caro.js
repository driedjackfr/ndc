export default function (turns, oppositeTurns) {
  if (turns.length < 5) return
  return isSameX(turns, oppositeTurns) || isSameY(turns, oppositeTurns) ||
         isCrossFromLeft(turns, oppositeTurns) || isCrossFromRight(turns, oppositeTurns)
}

function isSameX(turns, oppositeTurns) {

  return false
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
