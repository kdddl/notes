#import "../common.typ": conf, todo
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

= 2023

== 1

=== a

_why the fuck does zoran ask questions like this_ \
_so academia brained_ \

*Interrupts*

External events can generate hardware interrupts where in reponse to the event
the processor will stop execution and perform a context switch to a handler for
the interrupt.

*Channels*

#todo[]

*Semaphores*

#todo[]

_Synchronisation_ is making multiple behaviours to line up in execution and
coordinate. This might be needed to only allow one behaviour to access a
resource.

_Communication_ between behaviours is the sharing of data.

#todo[
I honestly have no idea what the _types_ of data exchange are?\
could mean like types as in queues or types as in reader-writer
- queues
]

=== b

HW behaviours can have a signal to act as a interrupt when they are ready
could have hardware queues.
_WHAT THE FUCK DOES HE WANT_

can use handshake protocol to avoid loss, ready/acknowledged signals.
synchronise behaviours to a common clock.

=== c

conceptual diagrams of frequency relay

#todo[see someone's who got full marks for it]

Real time requirements mean the program must react from event to response
within a given time. For the frequency relay it must respond fast enough to
protect the electrical system when underfrequency happens. Hardware implemented
components are faster than software components and therefore better meet real
time requirements. Real time requirements are not uniform and are dependent on
the system as well as the consequences: Control systems for vehicles might be
considered _hard_ real time as missing a total system failure. Meanwhile, _soft_
real time systems may just make the system less useful like with video and audio
processing. The reaction times from event to response can also be very different.

Frequency of the power waveform is calculated using the inverse of time between
peaks of the fundamental waveform. The frequency of the power system changes
when loads or generation is disconnected or connected -- when demand and
generations do not match.

Two cycles are required to calculate frequency as the system measures peaks in
the waveform. Therefore, to workout the rate of change four cycles are needed as
two frequency values are needed.

The FAU provides the number of samples between peaks of the waveform and a
interrupt signal for when this data is ready. The microprocessor uses the
interrupt signal on the ready line to know when the data is available and reads
the number of samples with PIO.

If the signal samples are arriving at a faster rate than the processing of the
signals, the system may never act upon the signals or miss some of the samples.

*do what zoran wants*

== 2

=== a

_wtf are activators_ 

Interrupt Service Routines are activated by external events triggering hardware
interrupts in the processor. A task is activated when the RTOS scheduler
determines it to be the highest priority ready task.

Event handlers can be preempted by other tasks or ISRs unlike ISRs. This allows
for the system to respond using other tasks or service other interrupts. Leaving
just the critical part in the ISR which can increase response time.

#todo[wtf do I draw here]

To match it with a periodic scenario the minimal time between events must be
equal or more than the periodic scenario.

*Events*
#table(
  columns: (3fr, 1fr, 2fr, 1fr, 2fr, 1fr),
  [A], [B], [C], [D], [E], [F],
)
*Check*
#table(

  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],
)

=== b

uhh can't all the synchronisation stuff be used in ISRs, you just can to think
about it... ISRs will have exclusive access cause can't be interrupted.

I'm a dumbass

When a ISR is sending data to a task, the ISR will have exclusive control as
it cannot be preempted by the scheduler. When a task is sending data to an ISR
it could be interrupted so to avoid data corruption, that interrupt should be
disabled or otherwise prevented from accessing the resource.

(idk about the semaphores)

#todo[need help]

=== c

Preemptive. An preemptive scheduler can stop a task and perform a higher
priority task that may be more time critical rather than continuing with a lower
priority task that takes a lot of time -- a non preemptive scheduler will allow
a task to run until it completes or allows another task to execute. The response
time of the task increases as the amount of tasks managed by the scheduler
goes up as the scheduler has to make more comparisons for what task should be
running.

#todo[verify]

Aren't interrupts handled the same in non preemptive and preemptive RTOSs? \

#todo[find this out]

Doesn't this depend on if the system supports nested interrupts??

priority inversion example easy with resource handling...

T3 accesses a shared resource through a mutex that blocks T1 from executing even
though T1 is higher priority and ready. T2 is ready and is higher priority so
it can execute further delaying the execution of T3. (no idea how to use the
interrupts here lol). To mitigate this T3 can inherit the priority of T1 while
accessing the resource shared with T1 so that T2 cannot preempt it.

ISRs belonging to lower priority interrupts can be preempted by higher priority
ISRs on systems with nested interrupt support. (idk what I am meant to say other
than this)

== 3

=== a

SystemJ uses the globally asynchronous locally synchronous model of computation.
A SystemJ program consists of asynchronous clock domains that use different
logical ticks to perform inner synchronous _reactions_. Reactions are also
hierarchical so can reaction can have a parent reaction.

Tick duration of the clock domain is always limited by the time to complete
the longest reaction.

=== b

SystemJ uses channels for communication between reactions in separate clock
domains and signals in the same clock domain.
- Channels
- Signals

fuck this

=== c

does this compile lmao \
reaction one never finishes

maybe it exits the reaction? \
no idea ;-;

== 4

=== a

#table(
  columns: 4,
  [*Tick*], [*S*], [*O*], [*Notes*],
  [0], [0], [0], [S emitted],
  [1], [1], [0], [S present],
  [2], [0], [0], [pre(S) present and final pause in `[]` block],
  [3], [0], [1], [sustain O],
)

=== b

```
    A / C       B / D
S1 -------> S2 -------> S3
```

== 5

=== a

#import "@preview/finite:0.3.0": automaton

#automaton((
  s13: (s14: "b", s23: "a"),
  s14: (s23: "a"),
  s23: (s14: "b"),
  // s24: (s14: "b", s23: "a"), can't be reached
))

=== b

three differences between statecharts and esterel
- this
- should
- be 
- easy

#todo[remember what this is]

```esterel
pause;
await A;
emit O;
```

== 6

=== a

#automaton((
  idle: (wait: ""),
  wait: (wait: "!G/Rq", busy: "G/Rq"),
  busy: (busy: "!S/Rn", idle: "S/Rl"),
))

=== b

#todo[TEST THIS]

// idle
```
await T;
weak abort 
  sustain Rq;
when G;
abort
  sustain Rn;
when S;
emit RI;
```
