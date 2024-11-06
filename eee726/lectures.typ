#import "../common.typ": *
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

= Module 1

Use gaussian white noise for modelling

Conditional transition probabilites
- $P("source|sink")$

== Orthogonality

Two vectors are othogonal if the dot product is zero. \
$bold(a) dot.c bold(b) = 0$
$ bold(a) dot.c bold(b) = sum^n_(i=1) a_i b_i $

== IQ Transceiver

(I = In-phase, Q = Quadrature) \
A IQ transceiver makes use of orthogonality by transmitting two bits at once
by having one out of phase by ninety degrees.


= Module 2: Signal Space Analysis

- View signals as vectors.

$ E_(s_i) =  sum^N_(j = 1) s_(i j) sum^N_(k = 1) s_(i k) integral^T_0 phi_j(t)
phi_k(t) partial t $

where
- $s_i$ represents a signal
- $E$ is energy or the magnitude of the signal vector
- Number of basis functions is equal or less than the number of signals
- $phi$ is the basis function or unit vector

For a signal $s(t)$:
$ phi(t) = (phi prime (t)) / sqrt(integral_(t_0)^T s(t)^2 partial t) $
where $phi prime (t)$ represents the portion of $s(t)$ that cannot be
represented using existing basis functions $phi (t)$ or 
$ phi prime_z (t) = s(t) - x phi_x (t) - y phi_y (t) $
where 
- $x$ is the component along $phi_x (t)$ 
- $y$ is the component along $phi_y (t)$
- $phi prime_z (t)$ is the possible component $z$ along $phi_z(t)$

basis functions must be normalised to be unit functions 
$phi(t) = (phi prime (t)) / (E_(phi prime (t)))$ so that $E_(phi(t)) = 1$

== ML Detection

Received signal $x(t) = s(t) + omega (t)$ \
where:
- $s(t)$ is transmitted signal
- $omega (t)$ is gaussian noise $N(0, sigma_N^2)$

To find $m_i$ to maximise the probability the symbol is correct is to minimise
the distance $|x - m_i|$ where $x$ is the received symbol and $m_i$ is the
symbol

= Module 4: BPSK (Binary Phase Shift Keyring)

- Only two symbols -- binary
- $T_b$ symbol period

Baseband:
- $s_0(t) = -A_b phi_1(t)$
- $s_1(t) = -A_b phi_1(t)$

Passband:
- $s_0(t) = -A_b cos(omega_c t) = A cos(omega_c t + pi)$
- $s_0(t) = A_b cos(omega_c t)$

Energy of a passband BPSK symbol:

$ E_b = (A_b^2 T_b)/(2) $
$ A_b = sqrt((2E_b)/(T_b)) $

Passband basis function:

$ tilde(phi)(t) = sqrt(2/T_b) cos(omega_c t) $

Use error function lookup table to find out the error (error function is not
analytical? or the integral of the gaussian function isn't idk)

Probability of Error

$ P_e = 1/2 "erfc"(sqrt(E_b/N_0)) $

Probability of Error of 50% is the worse as >50% the decision can be flipped and
be more accurate.

AWGN: Additive White Gaussian Noise

$ "SNR" = 10 log_(10) (E_b/N_0) $

= Tue 20 Aug

== Synchronisation in Digital Comms.

- Determinte start/stop of frames
- Preamble can be used to distguish frames


= OSI (Open Systems Interconnection) Model

- Seven Layers
- Six Interfaces between layers
- Each layer communicates with its _peer_
- Each layer serves the layers above
  - Lower layers are lower level

== 7 Layers

- Application
- Presentation: Language, Encryption
- Session: Format, Addressing
- Transport: Connects abstracted layers to physical layers
- Network
- Data Link Control: Breaking up data so it can be transmitted
- Physical

== TCP/IP

- Application: SMTP, FTP etc.
- Transport: TCP
- Internet: IP
- Network Interface


= Telecommunications Traffic Theory

Traffic: 
  - amount of calls 
  - length of calls

Erlang: unit of communication taffic load equal to the traffic load whose calls,
if place end to end, will keep one path continously occupied.

$ A = y s $
where:
- $A$ traffic in erlangs
- $y$ mean call arrival rate
- $s$ mean call holding time

Call holding time is modelled as a negative expoential. \
mean holding time is between two and three minutes.

Negative expoential probability distribution where acrosses x = 0 the probability
is $1/"mean"$

The distribution is memory less because if you pick up a ongoing call you can
expect it to last for a further 2-3 minutes (mean).

== Variation

- nature of the subscribers
- time of day
- month of the year
- occurrence of holiday and other events
- tariff in operation

= Noise

\ Signal: Desired information bearing voltages
\ Distortion: Deterministic, udesired voltages e.g. hardmonic and
  intermodulation distortion
\ Noise: Random, sometimes statistically predictable usually unpredictable e.g.
  cosmic noise
\ SNR: Signal-to-noise ratio

Sources of noise
- ignition systems
- arcing from commutators machines
- switching ystems causing abrupt changes in current flow
- mains origin at supply frequency
- electromagnetic coupling between adjacent circuits
- generation of interfering signals and harmonics
- intermodulation and crossmodulation
- sun

analyse noise in terms of _average noise power_

$ "SNR" = (overline(s^2(t)))/(overline(n^2(t))) $
$ "SNR"_"dB" = 10 log_10((overline(s^2(t)))/(overline(n^2(t)))) $
(overline is used for mean)

SNR usually means the unit is dB while S/N is unitless.

If $overline(n(t)) = 0$ then spectral density $S_n(omega) = eta/2$ for all
$omega$

== Thermal Noise (Johnson Noise)

Thermal noise is produced as a result of the thermally excited random motion of
free electrons in a conducting medium.

power spectral density
$ S_n(omega) ( h |omega| )/( pi ( exp((h |omega|)/(2 pi k T)) - 1) ) $

if $|omega| << (2 pi k T)/h$ then $S_n(omega) = 2 k T$

Thermal noise is white noise below ~6000 GHz.

Thermal noise $v_"rms" = sqrt(4 k T R B)$ although it is _still random_

== Noise Figure

Noise Figure 
$ F = (S/N)_i/(S/N)_o$

Noise generated by system $(F - 1)$

With two cascading amplifiers the noise figure 

$F = F_1 + (F_2 - 1)/G_1$

Generically with cascading amplifiers

$F = F_1 + (F_2 - 1)/G_1 + (F_3 - 1)/(G_1 G_2) + (F_4 - 1)/(G_1 G_2 G_3) + ...$

== Sky Noise

Below 30 MHz have to deal with atmospheric noise  

== Lossy Lines

In a passive network the gain $G$ will be $G < 1$.

The insertion loss $L$ of a network is 
$L = "input signal power"/"output signal power" = 1/G$ and the insertion loss
$L$ is equal to the noise figure $F$, $L = F$.

= Information Theory

information associated with an event $I_a = -log_2(P_A)$

information entropy $H = sum_(i = 1)^n P_i log_2 1/P_i$

== Huffman encoding

minimum variance is achieved by putting the combined probability in the highest
position above other probaiblities that are equal.

== Lempel-Ziv-Welch

*NO EXAM QUESTION ON LEMPEL-ZIV-WELCH*

== Channel Capacity

rate of information transmission $R = r H "bits per second"$ where $r$ is symbol
rate.

The limiting rate of information transmission through a channel is called the
_channnel capacity_ $C$. This is called Shannon's Theorem. $R <= C$.

$C = B log_2 (1 + S/N)$
where 
- $B$ channel bandwidth
- $S/N$ mean square signal to noise ratio

== Error Control Code

*THERE IS A EXAM QUESTION ON ERROR CONTROL CODES*

introduce redundancy to prevent error

code rate $r = k/n$ where $k$ is the message bits while $n$ is $k$ plus error
control bits. $r < 1$.

coding gain is difference in SNR to to achieve the same probability of error
when error control coding is applied. $"SNR"_"without" - "SNR"_"coding" =
"coding gain"$ when $P_e$ is constant.

Forward Error Correction classes:
- Block coding
- Convolutional coding

Acceptable Error rates
- Phone line: $10^(-2)$
- Computer data: $10^(-6)$

Fading channels have bursts of errors.

Automatic Repeat Request (ARQ) requests another packet to be sent if there are 
errors with the packet. It is unusually unsuitable for continous information and
one-way communication.
- Stop and wait for acknowledgement
- Interleave repeat packet with new ones using some kind of indexing
- Repeat from packet index

$ "SNR" = E_b/N_0 $

=== Hamming coding

*HAMMING ENCODING IS IN EXAM (PROBABLY)*

$bold(b) = bold(m) bold(P)$ \
where
- $bold(b)$ parity vector
- $bold(m)$ message vector
- $bold(P)$ coefficient matrix

generator matrix $bold(G) = [bold(P) | bold(I)_k]$

codeword $bold(c) = bold(m) bold(G)$

codewords are additive.

parity check matrix $bold(H) = [bold(I)_(n-k) | bold(P)^T]$

$bold(H) bold(G)^T = 0$

#todo[

$"size"(bold(G)) = k dot.c n$

$"size"(bold(H)) = k dot.c n$
  
]

syndrome vector $s = r H^T$ \
$"size"(bold(s)) = 1 dot.c (n-k)$ \
received vector $r$ \ 
$"size"(bold(r)) = 1 dot.c n$ \
$"size"(bold(H)) = n dot.c (n - k)$ \

If $sum(bold(s)) > 0$ then there are errors in $r$.

Hamming codes must satisfy these conditions
- Block length: $n = 2^m - 1$
- Number of message bits: $k = 2^m -m - 1$
- Number of parity bits: $n - k = m$

For hamming codes codewords are different in at least 3 places from each other
resulting in if one bit flips it can always be corrected.

$bold(s) = bold(e) bold(H)^T$ where $bold(e)$ is the error vector $bold(r) =
bold(c) + bold(e)$.

#set math.vec(delim: "[")
#set math.mat(delim: "[")
The syndrome vector $bold(s)$ is the index of where the error occurred. 
- $s = mat(1, 1, 1)$ means the 7th LSB is wrong
- $s = mat(0, 0, 1)$ means the LSB is wrong
- $s = mat(0, 0, 0)$ means there are no errors.

=== Convolutional Coding
