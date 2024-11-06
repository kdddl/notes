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
  F_c &= F_a + (F_c - 1)/G_a \
  F_c &= 100^0.2 + (F_c - 1)/100 \
  F_c + (F_c - 1)/100 &= 100^0.2\
  100 F_c + F_c &= 100 dot.c 100^0.2 + 1\ 
  F_c(100 + 1) &= 100 dot.c 100^0.2 + 1\ 
  F_c &= (100 dot.c 100^0.2 + 1)/(100 + 1)\ 

$

= 9

== a

$
  F_a &= 6 "dB" &&= 10^0.6 \
  G_a &= 20 "dB" &&= 10^2 \
  F_c &= 0.2x "dB" &&= 10^(0.02x) \
$
expression for total noise
$
  F &= F_a + (F_c - 1)/G_a \
  F &= 10^0.6 + (10^(0.02x) - 10^0)/10^2 \
$

== b

$
  F_e = 0.1 x "dB" = 10^((0.1x)/10) = 10^(0.01x) \
  10^(0.01x) = 10^0.6 + 10^(0.02x - 2) - 10^(-2) \
  10^(0.01x) - 10^(0.02x - 2)  = 10^0.6 - 10^(-2) \ 
  10^(0.01x) - 10^(0.02x) 10^(-2)  = 10^0.6 - 10^(-2) \ 
$
let $z = 10^(0.01x), z^2 = 10^(0.02x)$ \
$
  z - 10^(-2)z^2 - (10^0.6 - 10^(-2)) = 0 \ 
  z = 95.857, 4.143 \
  x = 61.731, 198.162
$

$61.731 < x < 198.162 space "m"$

= 11

== a

$ H = 0.3 log_2 (1/0.3) + 0.2 log_2(1/0.2) + 0.1 log_2(1/0.1) + 0.4 log_2(1/0.4) = 1.846 "bits" $

== b

$ 200000 dot.c 1.846 = 369287.869 "bits" $

== c

$"SNR" = 20 "dB" = 10^2$
$
  369287.869/(B log_2(1 + 10^2)) &= 60 \
  369287.869/(60 log_2(1 + 10^2)) &= B \
  369287.869/(60 log_2(1 + 10^2)) &= 924.392 "Hz"
$

== d

$
  P_B = 0.5, P_W = 0.5 \
  H = 0.5 log_2 (1/0.5) dot.c 2 = 1 \
  Delta H = 1/1.846 = 0.542
$

54.2% of the bandwidth is required

= 12

$
  50 dot.c 0.1 = 5 "dB" = F_c &= 10^0.5 \
  G_c &= 10^(-0.5) \
  F_a = 3 "dB" &= 10^0.3 \
  G_a = 20 "dB" &= 10^2 \
  F_r = 6 "dB" &= 10^0.6 \
$
== a
$
  F_c + (F_a - 1)/G_c = 10^0.5 + (10^0.3 - 1)/10^(-0.5) = 6.3096 &= 8 "dB" \
  F_a + (F_c - 1)/G_a = 2.0169 &= 3.0468 "dB"
$

$8 - 3.047 = "penalty"$

= 13


#image("p_a_graph.png")

$H_"max" = 1$
$H_"min" = 0$

= 14

lowest noise figure $F_A = 5 "dB"$ between $F_(B C)$ and $F_(C B)$.

$
  F_B = 10^0.4 \
  F_C = 10^0.3 \ 
  G_B = 10^0.9 \
  G_C = 10^0.6 \
$

noise figure
$
  F_(B C) &= 10^0.4 - (10^0.3 - 1)/10^0.9 = 2.6372 \
  F_(C B) &= 10^0.3 - (10^0.4 - 1)/10^0.6 = 3.6013 \
  F_(B C) &< F_(C B)
$

comparison
$
  F_(B C) = 3.2972 "dB" \
  F_(B C) < F_A
$

$F_(B C)$ provides a better noise figure than $F_A$ so it should be used.

#todo[WRONG]

= 15

200k pixels \
either black or white (binary) \
$P_w = 3P_b$

== a

due to $3P_b + P_b = 1$
$ 
  P_b = 0.25 \
  P_w = 0.75 \
$
entropy
$
  0.25 log_2 (1/0.25) + 0.75 log_2 (1/0.75) = 0.8113
$

== b

$
  162260/(4000 log_2 (1 + "SNR")) &= 60 \
  162260/(4000 dot.c 60) &= log_2 (1 + "SNR") \
  2^(0.6761) - 1 &= "SNR" \
  "SNR" &= 0.5978 \
  "SNR"_"dB" &= 10 log_10 (0.5978) \
  "SNR"_"dB" &= -2.2345 "dB" 
$

== c
new entropy
$
  H = 0.5 log_2 (1/0.5) dot.c 2 = 1 \
$
recalculate time
$
  (200000 dot.c 1)/(4000 log_2 (1 + 0.5979)) &= 73.9451 " s" \
$

= 16

$
  G_a &= 12 "dB" = 10 dot.c 10^0.2 \
  F_a &= 4 "dB" = 100^0.2 \

$
== a
$
  F_c &= 10^((40x)/10) = 10^(4x)
$

== b

$
  F_(a c) &= F_a + (F_c - 1)/G_a \
  F_(a c) &= 100^0.2 + (10^(4x) - 1)/(10^1.2) 
$

== c

$
  10^(4x) &= 100^0.2 + (10^(4x) - 10^0)/(10^1.2) \
  10^(4x) &= 10^0.4 + 10^(4x - 1.2) - 10^(-1.2) \
  10^(4x) - 10^(4x)10^(-1.2) &= 10^0.4 - 10^(-1.2) \
  10^(4x)(1 - 10^(-1.2)) &= 10^0.4 - 10^(-1.2) \
  10^(4x) &= (10^0.4 - 10^(-1.2))/(1 - 10^(-1.2)) \
  x &= 1/4 dot.c log_10 ((10^0.4 - 10^(-1.2))/(1 - 10^(-1.2))) \
  x &= 0.1043 "dB/m" \
$

when $x > 0.1043 "dB/m"$, $F_(a c) < F_c$
