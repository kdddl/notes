#import "../common.typ": *
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

#set heading(numbering: "1.a.i")

= 1

== a

=== i

$
  [4] &= [3] A/4 \
  [3] &= [2] A/3 \
  [2] &= [1] A/2 \
  [1] &= [0] A/1 \
  [4] &= [0] A/4 A/3 A/2 A/1 \
  [4] &= [0] A^4/24
$

=== ii

$
  742 &= 220 A^4/24 \
  A &= 2.9995
$

=

==

$
  bold(H) = mat(1, 0, 1, 1, 1, 0, 0; 1, 1, 1, 0, 0, 1, 0; 1, 1, 0, 1, 0, 0, 1) 
$

=== 

$
  bold(G) = mat(1, 0, 0, 0, 1, 1, 1; 0, 1, 0, 0, 0, 1, 1; 0, 0, 1, 0, 1, 1, 0; 0, 0, 0, 1, 1, 0, 1)
$

===

#table(
  columns: (4fr, 3fr),
  fill: (col, row) => if calc.odd(col) { gruvbox_dark.colour.at(1) } else { gruvbox_dark.colour.at(2) },
  [message (4)], [parity (3)]
)

===

$ 4/7 = 0.571 $

=== 

$
  bold(H)' = mat(
  1,  1,  1;
  0,  1,  1;
  1,  1,  0;
  1,  0,  1;
  1,  0,  0;
  0,  1,  0;
  0,  0,  1;
  )
$

error vectors

$
  mat(1, 0, 0, 0, 0, 0, 0) bold(H)' &= mat(1, 1, 1) \
  mat(0, 1, 0, 0, 0, 0, 0) bold(H)' &= mat(0, 1, 1) \
  mat(0, 0, 1, 0, 0, 0, 0) bold(H)' &= mat(1, 1, 0) \
  mat(0, 0, 0, 1, 0, 0, 0) bold(H)' &= mat(1, 0, 1) \
  mat(0, 0, 0, 0, 1, 0, 0) bold(H)' &= mat(1, 0, 0) \
  mat(0, 0, 0, 0, 0, 1, 0) bold(H)' &= mat(0, 1, 0) \
  mat(0, 0, 0, 0, 0, 0, 1) bold(H)' &= mat(0, 0, 1) \
$

===

$
  r &= mat(0, 1, 1, 1, 0, 1, 1) \
  s &= r bold(H)' = mat(0, 1, 1)
$

second MSB is wrong.

$
  r_c = mat(0, 0, 1, 1, 0, 1, 1)
$

=== AAAA PROBABILITY

$(1-0.15)^7 = 0.321 = "BE"_0$ all bits right \
$7(1-0.15)^6 dot.c (0.15) = 0.399 = "BE"_1$ one bit wrong \
$1 - "BE"_0 - "BE"_1 = 0.280$ probability of incorrectly decoding the message 

== 

===

0, 1

===

$ 1 -> mat(1, 1, 1, 1, 1) $ 
$ 0 -> mat(0, 0, 0, 0, 0) $

so $d = 5$, bit errors less than $(d - 1) / 2 = 2$ can be corrected

===
0

===

$1 - (1-0.15)^5 - 5(1-0.15)^4 dot.c 0.15 - 10(1-0.15)^3 dot.c 0.15^2 = 0.027$

#todo[I don't know if this is right]
