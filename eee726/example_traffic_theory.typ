#import "../common.typ": conf
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

#set heading(numbering: "1.a.i")

=

==

$A = 2 "erlangs"$

===

$
  2/240 = 0.0083 "calls/second"
$

===

- Random traffic
- Much more users than lines
- calls can connect to any free line and lost-calls-cleared system
- Statisical equilibrium

===

blocked
$
  A E_1(2) &= 2/3 dot.c 2  &&= 4/3 "erlangs" \
  A E_2(2) &= 0.4 dot.c 2  &&= 0.8 "erlangs" \
  A E_3(2) &= 4/19 dot.c 2 &&= 8/19 "erlangs" \
$

traffic carried by each line
$
  A_i = A E_(i - 1)(A) - A E_i (A) \
$
$
  A_1 &= 2 - 4/3 &&= 2/3 "erlangs" \
  A_2 &= 4/3 - 0.8 &&= 0.5333 "erlangs" \
  A_3 &= 0.8 - 8/19 &&= 0.3789 "erlangs" \
$


traffic blocked from system
$
  4/19 dot.c 2 = 0.4211 "erlangs"
$
