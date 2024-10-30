#import "../common.typ": conf
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

#set heading(numbering: "1.1.a.i.")

= Test 1

== Erlang

=== About Erlang B formula?

==== Assumptions of Erlang-B blocking probability formula

- Statisical equilibrium
- Random call arrival and holding time
- Number of callers is much greater than the number of lines
- Full availability -- any call can connect to any free line

==== What is statisical equilibrium

The chance to enter a state is the same as the chance to leave a state

==== The probability of being in state $i+1$ from $i$

$
  [3] &= [2] A/(3)\ 
  [2] &= [1] A/(2)\ 
  [1] &= [0] A/(1)\ 
  [3] &= [0] A^3/6
$

=== Telephone Exchange

==== probability of being blocked from exchange

$
  1246 &= 1246 A/3 \
  A &= 3 \
  E_3 (3) &= (3^3/3!)/(sum_(n = 0)^3 3^n/n!)
  E_3 (3) &= 0.3461538462
$

==== traffic

$
  1246 &= 1246 A/3 \
  A &= 3 "erlangs"\
$

==== traffic blocked from system

$
  "blocked traffic" &= A dot.c E_3(3) \
  &= 3 dot.c 0.3461538462 = 1.038461539 "erlangs"
$

== System Modelling

=== Bisymmetric Channel

==== error probability

$P_e = 0.15$ as regardless of symbol sent the chance of error is $0.15$

==== transition probability if asymmetric

$
  P(s_0 | s_1) = 1 - 0.9 = 0.1 \
  P(s_1 | s_0) = 1 - 0.8 = 0.2
$
$
  P_e = 0.6(0.1) + 0.4(0.2) = 0.14
$

=== Transmission speed

$
  log_2 (8) = 3 "bits/symbol" \
  3R "bits/second"
$

=== Basis Functions

==== show orthonormal

show they are unit energy

$
  E_phi_3 &= (-1/2)^2 dot.c 2 + (1/2)^2 dot.c 2 = 1 \
  E_phi_2 &= (-1/2)^2 dot.c 2 + (1/2)^2 dot.c 2 = 1 \
  E_phi_1 &= (-1/2)^2 dot.c 4 = 1
$

show they are orthogonal

$
  integral^4_0 phi_1 (t) phi_2 (t) " d"t &= integral^2_0 (-1/2) (-1/2) " d"t +
  integral^4_2 (-1/2) (1/2) " d"t \ &= 0.5 + (-1 + 0.5) = 0 \

  integral^4_0 phi_2 (t) phi_3 (t) " d"t &=  
  integral^1_0 (-1/2) (-1/2) " d"t + 
  integral^2_1 (1/2) (-1/2) " d"t + 
  integral^3_2 (-1/2) (1/2) " d"t + 
  integral^4_3 (1/2) (1/2) " d"t \
  &= 0.25 + (-0.5 + 0.25) + (-0.75 + 0.5) + (1 - 0.75) = 0 \

  integral^4_0 phi_3 (t) phi_1 (t) " d"t &=
  integral^1_0 (-1/2) (-1/2) " d"t + 
  integral^2_1 (1/2) (-1/2) " d"t + 
  integral^3_2 (-1/2) (-1/2) " d"t + 
  integral^4_3 (1/2) (-1/2) " d"t \
  &= 0.25 + (-0.5 + 0.25) + (0.75 - 0.5) + (-1 + 0.75) = 0 \
$

==== draw them lmao

3d fully independent unit vectors

#image(width: 30%, "3d.jpg")

==== express signal in basis functions

$s = -2phi_1 - 2phi_3$ \
$s = vec(-2, 0, -2)$

==== compute the energy of signal

$(-2)^2 + (-2) = E = 8$

= Test

== BPSK 

$ E_b = ((10 dot.c 10^-3)^2 T_b)/(2) $

condition $P_e = 0.0081$ must be true

$0.0162 = "erfc"(x)$ \
$0.0162 = 1 - "erf"(x)$ \
$0.9838 = "erf"(x)$ \
$x = 1.7$

$ 
  1.7 &= sqrt(E_b/N_0) \
  1.7^2 dot.c 10^(-11) &= E_b \
  2.89 dot.c 10^(-11) &= E_b
$
$ 
  E_b = (A_b^2 T_b)/(2) \
  (2E_b)/(10 dot.c 10^(-3))^2 = T = 0.000000578 \
  1/T = R = 1730103.806$
