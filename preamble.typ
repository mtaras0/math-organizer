#set page(
  width: 200mm,
  height: auto,
  margin: (x: 2em, y: 2.5em),
  fill: none,
)
#set text(lang: "ru", font: "New Computer Modern", size: 18pt)

#show sym.gt.eq: sym.gt.eq.slant
#show sym.lt.eq: sym.lt.eq.slant
#let arctg = math.op("arctg")

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

#set enum(numbering: ru-problem-numbering, full: true, indent: 0em, body-indent: 1.0em)

#show math.equation: math.display
#import "@preview/itemize:0.2.0" as el
#show: el.default-enum-list.with(auto-resuming: (true, false, false))
#set enum(spacing: 1.5em)
// #show heading.where(level: 1): set block(below: 1.5em, above: 2.5em)
