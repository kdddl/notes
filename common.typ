#let todo(body, fill: red) = {
  block(
	width: 100%,
	inset: 5pt,
    stroke: 2pt + fill,
	text(fill: fill, weight: "bold", [TODO: ] + body)
  )
}

#let code(it, code_colour, highlight: ()) = {
  let x = it.text.split("\n").enumerate();
  let content = ();
  let size_line = 20pt;
  let size_code = 100% - size_line;
  for (i, line) in x {
    let num = str(i+1);
    while num.len() < 3 {
      num = " " + num;
    }
    content.push(
      block(
        fill: rgb(code_colour.at(0)),
        width: size_line,
        text(
          font: "Ubuntu Mono",
          fill: code_colour.at(3), 
          size: 11pt,
          num,
        )
      ),
    )    
    content.push(
      block(
        fill: rgb(code_colour.at(0)),
        width: size_code,
        text(
          font: "Ubuntu Mono",
          fill: code_colour.at(5), 
          size: 11pt,
          align(start, raw(line, lang: it.lang)),
        )
      )
    )
  }
  grid(
    rows: 2,
    block(
  	  fill: code_colour.at(0),
      stroke: 1pt + code_colour.at(1),
      inset: 8pt,
      grid(
        columns: (size_line, size_code),
        gutter: 7pt,
        ..content
      ),
    ),
    if it.lang != none {
      block(
        stroke: 1pt + code_colour.at(1),
        inset: 2pt,
        width: 100%,
        height: auto,
        fill: code_colour.at(1),
        align(
          end, 
          text(
            font: "Ubuntu Mono",
            fill: code_colour.at(4),
            size: 11pt,    
            it.lang          
          )
        )
      )
    }
  )
}

#let conf(
	colour,
	code_colour,
	doc,
) = {

set page(
  fill: colour.at(0)
)

set text(
  font: "Ubuntu",
  fill: colour.at(5),
  size: 11pt,
)

// code
set raw(theme: "base16-gruvbox-dark-medium.tmTheme")
show raw.where(block: true): it => { 
  code(it, code_colour)
}

show raw.where(block: false): it => text(
  font: "Ubuntu Mono",
  size: 11pt,
  it,
)

// quote
show quote.where(block: true): it => {
v(-1em)
table(
  columns: (5pt, auto),
  rows: if it.has("attribution") {
    (auto, auto)
  } else {
    (auto, 0pt)
  },
  inset: 8pt,
  fill: (col, row) => if calc.odd(col) { colour.at(1) } else { colour.at(3) },
  [],
  block(
    width: 100%,
    it.body 
  ),
  if it.has("attribution") {
    block(
      v(-4pt) + [#it.attribution]
    )
  } 
)
v(-0.5em)
}

set table(
  align: start,
  stroke: none,
  fill: (col, row) => if calc.odd(row) { colour.at(2) } else { colour.at(1) },
  inset: 8pt,
)

set list(
  marker: [--]
)

show link: it => {
  set text(fill: colour.at(13));
  underline(it)
}

set outline(indent: 2em)
set outline(fill: none)
show outline.entry.where(level: 2): it => {
  v(-1.5em)
  grid(
    columns: (1em, 1fr),
    block(
    ),
    block(
      inset: 4pt,
      it
    )
  )
  v(-2.0em)
}
show outline.entry.where(level: 1): it => {
  block(
    width: 100%,
    inset: 4pt,
    fill: colour.at(1),
    strong(it)
  )
  v(-2em)
}

set footnote.entry(
  separator: line(length: 100%, stroke: 1pt + colour.at(4))
)


doc
}

