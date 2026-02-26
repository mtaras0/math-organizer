#set page(
  width: 200mm,
  height: auto,
  margin: (x: 1em, y: 1em),
  fill: none,
)
#set text(lang: "ru", font: "New Computer Modern", size: 16pt)
#show sym.gt.eq: sym.gt.eq.slant
#show sym.lt.eq: sym.lt.eq.slant
#set par(justify: true)

#let ru-problem-numbering(..nums) = {
  let args = nums.pos()
  let n = args.last()
  let level = args.len()

  if level == 1 {
    numbering("1.", n)
  } else if level == 2 {
    let rus = "абвгдежзийклмнопрстуфхцчшщъыьэюя".clusters()

    if n <= rus.len() {
      rus.at(n - 1) + ")"
    } else {
      numbering("a)", n)
    }
  } else if level == 3 {
    numbering("(1)", n)
  } else {
    numbering("1.", n)
  }
}

// Example usage with a list
#set enum(numbering: ru-problem-numbering, full: true)
