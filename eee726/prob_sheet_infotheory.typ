#import "../common.typ": *
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

= 3

$"SNR"_"receiver" = 25 "dB"$ \
400k picture elements \
#table(
  columns: 2,
  [Black], [30%],
  [Dark Grey], [15%],
  [Light Grey], [15%],
  [White], [40%],
)

== a

entropy $ H = 0.3 log_2(1/0.3) + 0.15 log_2(1/0.15) dot.c 2 + 0.4 log_2(1/0.4) = 1.870950594 $

== b

information

$ 
  I &= H dot.c "picture elements" \ 
  I &= 1.87 dot.c 400000 = 748380.2376
$

== c

determine $B$ for $20 "s"$

$ "SNR" = 25 "dB" = 100 sqrt(10) $

$ 20 &= I/(B log_2 (1 + 100 sqrt(10))) \
  B  &= I/(20log_2 (1 + 100 sqrt(10))) = 4503.228076 "Hz" $

== d

going to assume that black, dark grey, light grey and white are all 'grey levels'

calculate equiprobable information $I_"eq"$

$ I_"eq" = 0.25log_2(1/0.25) dot.c 4 dot.c 400000 = 800000 $

$ B  &= I_"eq"/(20log_2 (1 + 100 sqrt(10))) = 4813.839650 "Hz" $

= 4

$
  B &= 4000 \
  "pixels" &= 600000 \
  P_"black" &= 0.35 \
  P_"white" &= 0.65 \
$

== a

$
  H = 0.35 log_2(1/0.35) + 0.65 log_2(1/0.65) = 0.9340680554
$

== b

HARTLEY SHANNON THEOREM

find $"SNR"$ when $t = 60 "s "$

$
  60 &= (600000H) / (4000 log_2 (1 + "SNR")) \
  log_2 (1 + "SNR") &= (600000H) / (4000 dot.c 60) \
  "SNR" &= 2^((600000H) / (4000 dot.c 60)) - 1 = 4.046104693 \
  "SNR" &= 6.070371160 "dB"
$

== c

$H = 1$

$H prop t$ so $H_"eq"/H = 1/0.9340680554 = 1.070585804$ times longer

= 5

let $x$ be length of cable

$
  F_c &= 10^((0.05x)/10) \
  F_a &= 100^(0.2) \
  G_a &= 100
$

$
  F_c &= F_a - (F_c - 1)/G_a \
  F_c &= 100^0.2 - (F_c - 1)/100 \
  F_c + (F_c - 1)/100 &= 100^0.2\
  100 F_c + F_c &= 100 dot.c 100^0.2 + 1\ 
  F_c(100 + 1) &= 100 dot.c 100^0.2 + 1\ 
  F_c &= (100 dot.c 100^0.2 + 1)/(100 + 1)\ 

$
#todo[why bad at rearranging -- I'm not #emoji.face.cool]
