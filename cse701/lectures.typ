#import "../common.typ": conf
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

= Introduction to Multi-Processor System on Chip (MPSoC)

Use concepts such as:
- Parallelism
- Pipelining
- Resource sharing
- Scheduling

Use VHDL & apply advanced techniques to design a complex digital system for
an FPGA.

Use EDA tools to design application specific MPSoC and to satisfy resource and
timing constraints in FPGA systems.

== Assessments
#table(
	columns: 2,
	[Lab], [20%],
	[Research Project], [20%],
	[Group Research Project -- ReCOP], [30%],
	[Group Research Project -- Phase 2], [30%],
)

`uP` refers to microprocessor

MPSoC consists of interconnection network of uP, storage & custom IP to speed
up processing

Examples of Processing Architectures for AI -- from least to most efficient: \
CPU -- GPU -- FPGA -- Vector DSP -- ASIC

= Nios 2 (I think I forgot to save :/)

== Profiling Nios 2 Systems

=== Performance Counters
=== High Res. Timers

=== GNU profiler

- performs periodic sampling to determine the perctange of time spent in each function.
- an overview of the entire system 
- profiling overhead does not affect determining the most time consuming part of the code
- uses system clock timer
- binary code size increases
- instruction cache behaviour may different as instruction inserted for profiling
- data cache behaviour different as results stored in memory

`-pg` compiler flag

#pagebreak()
== Header files & Data types for C

= Overview, Trends and Challenges of Modern Digital Design 

"I/F": Interface

- trend towards high level synthesis

`;` tick seperation \
`,` seperates RTL statements

Von Neumann Architecture: combined data instruction \
Harvard Architecture: seperated data and instruction memories



16 bit kdISA
- status bit
- 5 bits operator (32 instructions)
- 4 bit reg 1
- 4 bit reg 2

instructions

+ cmp
+ mov
+ swap
+ lli
+ lui
+ add
+ addi
+ sub
+ subi
+ or
+ ori
+ and
+ andi
+ not
+ xor
+ xori
+ test
+ load
+ store
+ srl
+ sll
+ sra

special registers
+ zero/null
+ program counter
+ instruction register
+ status register


32 bit kd ISA, want 32 registers

- 5 dst reg
- 5 src reg
22 bits left
- 5 bit opcode
17 bits



status flags
- overflow
- zero
- negative
- carry

special registers
+ zero/null
+ program counter
+ instruction register
+ status register
+ stack pointer


MAR: Memory Access Register
initialisation of registers

== SystemC

- Pick and choose what _modules_ are hardware or software.
- Modules can interface with each other
- SystemC simulations are synchronous
- Software modules are simulated independently (if on different cores)

== SystemJ & SystemGALS

Disadvanatage of SystemJ
- jvm

== Group and Individual Project Goals
- Follows SystemJ concepts but separates on specification level control
	dominated fomr data dominated parts explicitly
- Uses _ReCOP_ processors for control dominated parts in time critical
	applications
- General purpose processor and application specific processors are used for
	data dominated parts
- Network of Chip (NOC) uses TDMA-MIN 
	- Conflict-less network (parts can communicate without interference)
	- Happens in one clock cycle
	
