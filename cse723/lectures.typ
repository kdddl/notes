#import "../common.typ": conf, todo
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)
= Lecture 1: Introduction

- prerequisite know _C_
```c
#include <stdio.h>

int main() {
	printf("Hello, World!");
	return 0;
}
```

== Assessment
#table(
	columns: 2,
	[Assignment], [25%],
	[Assignment], [25%],
	[Exam], [50%]
)

== Labs
- Lab 1: Compulsory, Introduction to Assignment
- Lab 2: ???

== Embedded/cyber-physical systems (ES/CPS)

*Embedded System*
- employs a combination hardware & software to perform a specific function
- is part of a larger system that may not be a 'computer'
- works in a reactive and time constrained environment
- is not meant to be programmed by a user

CPS to emphasise interaction with the physical world.

ES became key in mechanical and mechatronic devices in 1990s-2000s
- IoT, IIoT

Uses software for flexibility. Hardware for performance & security.

Have both hardware and software components:
- Hardware: microprocessors, ASIC, VLSI, FPGA, communication, signal processors
- Software: Embedded operating system or real-time operating system and bare
	metal

Need to satisfy _functional_ and _non-functional_ -- low power, security,
reliability, safety -- requirements.

Common Characteristics
#table(
	columns: 2,
	[Application specific], [made for a specific application],
	[Use digital signal processing], [process signals in digital form],
	[Reactive], [react on events from physical world],
	[Real time], [perform functions within time constraints],
	[Communicative], [communicate with other systems],
	[Distributed], [part of spatially distributed system],
	[Human Computer Interface], [communicate with humans],
)

== Embedded System Applications
- Wireless systems
- Data communication systems
- Vehicle automation
- Intelligent sensors
- Home and building networking and automationo
- Control and instrumentation 
- Entertainment

FPGAs good for making custom computing machines -- processors, accelerators.

difference between validation and verification.

== Types of embedded systems

- Reactive or control dominated systems -- Data and events arrive in irregular
	intervals and must be processed within strict timing constraints
- Data dominated -- data arrives in regular streams

== Dependability

#table(
	columns: 2,
	[Reliability $R(t)$], [probability of system working correctly when it was working at $t = 0$],
	[Maintainability $M(d)$], [probability of system working corrrectly time $d$ after an error occurs at $d=0$],
	[Availability $A(t)$], [probability of system working at $t$],
	[Safety], [no harm caused to people or resources],
	[Security], [confidential and authentic communcation]
)

== Efficiency

- Energy
- Code-size
- Run-time
- Weight
- Cost

#quote(
	[A real time constraint is called hard, if not meeting that constraint could result in a catastrophe]
)

#pagebreak()
= Lecture 2: From Specification to Design

== System-Level Tasks

=== Implementation
- Task concurrency management: what tasks need to run at the same time
- High-level transformations: find candidates for hardware implementation by
	looking at initial program on microprocessor
- Design space exploration: explore possible solutions and weigh options
- Hardware/Software partitions: interfacing between hardware and software & what
	components are reponsible for what behaviours
- Compilation 
- Scheduling

=== Hardware vs Software

/ Hardware: Functionality implemented using customized architecture
/ Software: Functionality implemented on a programmable processor

_Key Differences_
- processors usually have a single thread of control
- hardware may have multiple parallel processes

=== Design

_Specification capture_
- The description of the model in a language

_Explore Deisgn Alternatives_
- Allocation of system components
- Specification of their physical and performance constraints

_Specification refinement_
- Allocations of variables to memories
- Insertion of interface protocols between components
- Addition of arbiters to resolve conflicts from access common resources by 
	concurrent processes
- Specification of processors

== Models of Computation


=== Concurrent models
- Kahn process networks
- Logic gates
- Communicating sequential processes
- Synchronous-reactive 
- Globally asynchronous locally synchronous

=== Sequential models
- FSM
	- Mealy: Output is function of input and state
	- Moore: Output is function of state
- HFSM
- Register machines

=== Activity Orentied Models
- Data flow graphs
- Control flow graphs

== ES Design & Specification and Programming Languages

- VHDL & Verilog for Hardware description
- Programming languages (sequential and concurrent) used for software 
	functionality

_Validation_
- Completeness: includes all possible input sequences the environment to the system
- Correctness: generates expected output for every such input sequence

== Internet enabled Frequency Relay
- Measures current frequency and its rate of change in power signal
- Disconnects loads if frequency is not nominal (like 50 Hz)
- Communicates with other supervisory and control systems through landline or
	wireless system
- Operates non stop
- Low cost for use at household level 

== Power dissipation in CMOS Gates


$ P_(s w) = (C_"load" V^2_"dd")/T $

$ I_"leak" = I_"sub" + I_"ox" $
$ I_"sub" = K_1 W e^(-V_"th"/(n V_theta)) (1 - e^(V_("th")/V_theta)) $
$ I_"ox" = K_2 W (V/T_"ox")^2 e^(-alpha T_"ox" / V) $

=== Reducing static power consumption

_Logic Design_
- Multiple $V_"th"$
- Multiple $T_"ox"$
- stack effect: 

_Runtime_
- Using sleep transistors
- Variable $V_"th"$
- Multiple $V_"dd"$
- Application sensitive input control

=== Reducing dynamic power consumption

_Logic Design_
- Proper transistor sizing
- Multiple $V_"dd"$
- Optimising logic design

_Runtime_
- Clock gating: disable or reduce clock signal for certain component or whole 
	system
- Dynamic voltage scaling 
- Dynamic frequency scaling
- Dynamic thermal management

== Design issues for MPSoC
- High level of performance (processing time)
- Power management and optimisation (reduce heat)
- Reducing the energy consumption (for battery life)
- Fault tolerance (for safety critical applications)
- High level of system security (in particular for IoT)

#pagebreak()
= Lecture 2

== Platform Designer

Platform Designer is a system integration tool. It integrates different IP cores
into the FPGA and automatically makes interconnection logic.

== Interconnection

Usually designed on point to point interconnect for efficient communication.
Signals:
- data
- addr
- ready
- rd (read)
- valid
- ready
- ack (acknowledged)


#pagebreak()
= Lecture 3

_Structural Models_: show intersections of the system

== Requirements of Specification Languages

#table(
	columns: 2,
	[Hierarchy of functional modules], 
	[simplifies top down decomposition and bottom up integration can be structural
	or behavioural (functions, modules in software)],
	[Concurrency],
	[describes concurrent operations and parallelisms],
	[State transitions],
	[model internal systems state; important for control systems],
	[Exceptions],
	[interaction with environment -- current state terminated and transition into
	another state],
	[Communication and synchronization], 
	[exchange of data between concurrent parts -- shared memory, message passing],
	[Program instructions],
	[data types, decision constructs, assignments],
	[Time],
	[describe timing constraints -- reponse time],
)

== RTOS

- simulate concurrency on single processor
- RTOS manages multiple running processes
- processes perform the system's computation and the RTOS schedules them
- attempts to meet deadlines by deciding which process runs when

=== RTOS Scheduling

- most RTOSs use fied priority preemptive scheduling where each process is given
	a particular priority when the system is designed
- RTOS runs the highest priority process that is expected to stop after a short
	period of time
- priorities are usually assigned using rate monotonic analysis which assigns
	higher priorities to processes that must meet more frequent deadlines

== SystemJ

`emit S`: emit signal S \
`present S`: if signal S is present do


- presence of signal is high if it was emitted in the last tick
- value of signal works how you expect me
- If different value of the same signal is emitted in the same tick the last
	emission is taken to be the value for the signal for the next tick

Channels
- channels must only have one sender and reciever
- channels are named
- `send channel_name`, `recieve channel_name` 
- channels are unbuffered

Kernel Statements
- `pause` marks the end of the tick
- `input` or `output` parameter for signals is from the environment
- `[input|output] [type] signal identifier` 
- loops in systemJ must take one tick
- `abort` is preemption (basically interrupts) based on signal
- `suspend` stop execution while signal is present
- `trap(identifier) p; do q` basically software interrupts if `exit(identifier)` 
	is executed in `p` do `q`
- `p || q`: run `p` and `q` synchronously in parallel, waits for threads to finish
- `#identifier` extracts value from signal or channel

```SystemJ
output char signal thing;	
emit thing[23];
```

`CD_name (input|output) -> p`: declares clock domain with name `CD_name` with
specified I/O ports and starts `p` as the root reaction

clock domains have their own scopes

#pagebreak()
= Lecture 3: RTOSs

== RTOSs

Operating system that simply handles multiprocessing and multithreading
('Task'). \
Implements
- Scheduler
- Inter-task sync and comms

_System tick_ that maintains time-based services like task execution interval
and time slicing using a hardware timer.

== Why use?

- Abstraction of hardware
- Multiprocessing & Multithreading
- Resource management
- Guarantees meeting real time constraints
- Services
	- Timer
	- ISR
- Common
- Application organization and modularity
- Common communication stacks and drivers

== Basics

RTOS Kernel schedules tasks 

Tasks have their own state 
- Task has atomic completion and non atomic completion (atomic being whether the
	execution can be separated)
- Priority of tasks is given by designer

== Tasks

Task = Code + Data + State (context)

Task state is stored within a Task Control Block that contains the
- ID
- Priority
- Status
- Registers
- Saved Program Counter
- Saved Stack Pointer

== State Diagram for Task

#todo[steal diagram of slide]

== Implementations of RTOS

Monolithic Kernel
- Statically linked when compiling
- Monolithic binary
- Compile time optimizations & analysis possible
- Hard to change, must change entire binary

Micro Kernel
- It's all system calls!
- Limited things handled by kernel other things done in userspace 
- Easy to change as a result
- Less optimizations

== RTOS Standards

#todo[I was too slow]

- RT-POSIX: POSIX OS with real time extensions
- OSEK: automotive

== RTOSs examples

Tiny
- TinyOS
- Contiki
- NuttOS
Medium
- microCOS-II/III
- eCos
- FreeRTOS
- ThreadX
- microLinux
Large
- VxWorks
- QNX Neutrino
- Real time linuxes
- Research kernels: SHARK, MARTE

== RTOS

- Implemented in ANSI C (damn so it works on like everything with a cc)
- open source code 
- \<10 kB
- Priority can change during runtime

Has:
- Tasks
- Queues
- ISR communication
- Semaphores and mutexes

== FreeRTOS Features

- Implemented in C
- Fixed priority, pre emptive scheduling
- Traps software interrupts
- Traps timer interrupts

API functions for:
- Creations and management of multiple tasks
- Inter task communication through queues, semaphores and mutexes
- Heap memory mangement through malloc and free

ISRs are independent from tasks

Communication
- Queues (channels)
- Binary and counting semaphores
- Mutexes

= Lecture 3: FreeRTOS OS

== Data Types & Coding Style
- camel case used for unsigned
- screaming snake case used for signed
- only use `long` and `short`
- use hungarian notation

Start variables and functions with prefix for:
#table(
	columns: 2,
	[`char`], [`c`],
	[`short`], [`s`],
	[`long`], [`l`],
	[`portBASE_TYPE`], [`x`],
	[`unsigned`], [`u`],
	[`pointer`], [`p`],
	[`void`], [`v`],
)

- second word in name is source file
- `vTaskPrioritySet()` returns `void` and is defined in `task.c`.

== Task Priorities
`configMAX_PRIORITIES - 1`

== Task Creation

```c
portBASE_TYPE xTaskCreate(
	pdTASK_CODE pvTaskCode,
	const signed char* const pcName
	unsigned short usStackDepth,
	void* pvParamters,
	unsigned portBASE_TYPE uxPriority,
	xTaskHandle* pxCreatedTask
);
```

#set quote(block: true)
#quote[Whoever the hell decided `for(;;)` should exist should be shot. I'm gonna
use it anyway though.]

- get and set priorities while task is running
- suspend and resume tasks
- suspend all tasks useful for interrupts
- task delay
- task delete

== Kernel Structure

`taskENTER_CRITICAL()` and `taskEXIT_CRITICAL()` provide a basic critical
section implementation that disables intrrupts up to a priority

- `xQueuePeek` reads the top of the queue but does not remove it
- there are special functions for using queues from an ISR

Binary Semaphores
- binary = boolean
- `give` sets the semaphore to 1
- `take` sets the semaphore to 0

Counting Semaphores
- queue multiple events, do thing x number of times

= Assignment 1

ADC --> Averaging Filter --> Symmetry Function --> Peak detection

These are summed up into a Frequency Analysis Unit (FAU) except for the ADC.
The FAU has a interface of `count` the number of clock cycles from the peak and
`peak` that is high when a peak is detected.

Hard to measure frequency from signal with a lot of harmonics. Use peaks rather
than zero crossings.

Sampling frequency & resolution of ADC

ISR on peak signal that gets count

= Lecture 2: Software based ERTS

== Modular Implementation

Techniques
- Subroutine (hierarchical and sequential)
- Coroutine (symmetric and sequential or asymmetric and sequential)
	- Symmetric coroutines: yield to each other
- Processes/tasks (symmetric and concurrent)

== Example: Process Controller

every 20 ms execute clock_module
every 40 ms execute control_module

do sometime display, operator_input, mgmnt_output

Observations of single program approach
- Each function called in the infinite loop represents an independent task
- Each task must return in a reasonable time

== Foreground/Background Approach

- Interrupt on clock signal handles clock_module and control_module (Foreground)
- other display, operator_input and mgmnt_output are running while system is not
	interrupted  (Background)

== Processes vs. Threads

Processes
- Own virtual address space (stack, data, code)
- System resources

Thread
- Subprocess
- Only program coutner, stack and register
- Shares virtual address space
- Small & low cost

== Types of Scheduling

Rate Monotonic 
- Processes with shorter periods have higher priority
- Typically used when execution deadline = period

Deadline Monotonic
- Processes with shorter deadlines have higher priority
- Typically used when execution deadline \< period

= Lecture 6: Resource Access Control

== RTOS Tasks

*Non-Preemptive*: Task yields voluntarily \
*Preemptive*: RTOS switches because of higher priority task

RTOS tasks run in the same memory space so are more like threads.

Reentrancy: If a function can be entered simultaneously by multiple tasks.
- Can be comprised by non atomic operations

== Mutual Exclusion

Ensuring Mutual Exclusion
- Disable interrupts: interrupts otherwise atomic operations
- Test & Set: obtains value of memory location and sets it to one in one
	instruction
- Disable scheduling: prevent scheduler from preempting process
- Use of semaphores

== Problems with Semaphores - Deadlock

- Taking wrong semaphore
- Forgetting to take semaphore
- Not releasing semaphore
- Taking semaphore for 'too long'

Deadlock can occur if two tasks want mutually exclusive access to two resources
in a nested fashion but in reverse order

```c
void task_2() {
	mutex_acq(a); // <-- Start here but switch to line 12
	mutex_acq(b);

	do_shit();
	
	mutex_acq(a);
	mutex_acq(b);
}

void task_2() {
	mutex_acq(b); // go here and now DEADLOCK!!!
	mutex_acq(a);

	do_shit();
	
	mutex_acq(b);
	mutex_acq(a);
}

```

= Lecture 7: Intertask Communication and Synchronisation

== Approaches for synchronisation between tasks
- Synchronisation semaphore
- Event flags
- Global variables
- Message mailboxes
- Message queues
- Pipes

== Synchronisation Semaphores

When two tasks synchronise by using two semaphores this is called bilateral
rendezvous. Both tasks synchronise

== Task Communication

*Message Mailboxes*

Message queue

= Lecture 9: Designing Software in SystemJ


