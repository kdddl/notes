#import "../common.typ": conf
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

= Vector Space Concepts (Lecture 4)

Represent signals in terms of energy

Noise adds _energy_

Basis functions $phi_x (t)$ and $phi_y (t)$ are orthonormal if
$ integral_0^T phi_x (t) phi_y (t) = 0, x eq.not y $
$ integral_0^T phi_x (t) phi_y (t) = 1, x = y $

Magnitude is $sqrt(E)$

= Module 3: Receiver Structure

- Noise power $P_N$ = Variance $sigma_n^2$

Transmitter can be thought of synthesising the different basis functions into
a signal.

Receiver multiplies received signal by each basis function

Smaller noise vector is _more_ likely.

== Notation

- $s_i(t)$: transmitted time-domain signal where $0 eq.lt t eq.lt T$
- $M$ possible symbols so $i = 1 ... M$, $m_0$ represents 0 bit transmitted 
- $bold(s)_i$ is a vector of $vec(s_(i 1), ..., s_(i N))$
- $w(t)$ is random noise with variance $sigma_n^2$

Bayes theorem
$ P(m_i|bold(x)) = (P(bold(x)|m_i) P(m_i))/(P(bold(x))) $
where:
- $P(m_i)$: probably of each symbol occuring (constant)
- $P(bold(x))$: overall probability distribution for $bold(x)$

== QPSK 

Error rate
$ P_e = 1/2 "erfc"(sqrt(E_s/(2N_0))) $

Probability of error is same as BPSK

= Module 5: Ofthogonal Frequency Division Multiplexing (OFDM)

== Multipath Channels and Fading

- Objects in the environment reflet and scatter radiowaves
- Lowers throughput
- Possible in wired channels due to reflections from connections and dispersion
- Superposition of multiple paths leads to fading
- Results in phase difference and noise

== Views of Fading

- The impulse response will echo across time
- Frequency domain is inconsistent response to single tone

== Impact of Fading

- Intersymbol Interference occurs when echoes interfere with other symbols 
  (not long enough delay between symbols)
  - Corrupts received signal

== Mutlicarrier modulation

- Transmit over multiple frequencies (multiple carriers) over longer periods
  of time
  - can reduces intersymbol interference

Baseband -- pre modulation \
Passband -- post modulation \

Subcarriers need to be orthogonal

Peak on subcarriers should be at a point where other subcarriers are zero in the
time domain so the signal can be sampled for one of the subcarriers and none of
the rest

$ cal(L)^(-1)(X(f-f_0)) = x(t)e^(j 2pi f_0 t) $
$e^(j x) = cos(x) + j sin(x)$

== Importance of Sampling

- Length/period of time domain signal $T$
- sampled at $N$ points
- $T/N$ sampling period

== OFDM

Inverse fourier transform is used to make the sent wave form
by using the frequencies defined by the bits

== Synchronisation

- use known preamble to mark the start of each frame
- use autocorellator with copy of preamble to know when signal

== Cyclic Prefix

As intersymbol interference can happen between the edges of each symbol
copy from the start of the symbol to the end

= Traffic Theory

== Type of Telephony Systems

- Delay systems: queue (like when calling instutition)
- Lost calls cleared (personal phone)

$ E_N [A] = ((A^N)/N!)/(sum^N_(v = 0) (A^v)/(v!)) $
where $E_N [A]$ is the probably that $N$ states (lines) are busy given that the
traffic is $A$ erlangs
