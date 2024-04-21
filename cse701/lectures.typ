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

= Group and Individual Project Goals
- Follows SystemJ concepts but separates on specification level control
	dominated fomr data dominated parts explicitly
- Uses _ReCOP_ processors for control dominated parts in time critical
	applications
- General purpose processor and application specific processors are used for
	data dominated parts
- Network of Chip (NOC) uses TDMA-MIN 
	- Conflict-less network (parts can communicate without interference)
	- Happens in one clock cycle
	

Diagram forgot why

CD_1
- R_11
- R_12

CD_2
- R_2

CD_3
- R_31
- R_32
	- R_321
	- R_322

== TDMA-MIN
- $"stages" = log_2 "number_of_io_ports"$
- each stage has $"number_of_io_ports / 2"$ of crossbar switches (2 muxs)
- counter is used to divide up each port
	- $n_"rx"$ receiving
	- $n_"tx"$ transmitting
	- $T_i$ counter 
	- $n_"rx" = "mirror"(n_"tx") xor T_i$

Inserting packets
- Put into fifo buffer with receiving address
- when equal send

== ReCOP

- 16 bit processor
- 16 registers
- 16 bit SOP
- 16 bit SIP

Instruction format
#table(
	columns: 2,
	[*Component*], [*Size in Bits*],
	[Adressing Mode (AM)], [2],
	[Opcode], [6],
	[Rz], [4],
	[Rx], [4],
	[Operand], [16],
)

Adressing modes
- immediate
- register
- direct
- inherent (needs 1 or less args)

Rz dst
Rx src

- `#` immediate
- `$` direct
- `R` register

== Application Specific Processor (ASP)

Each individual will make part of the Frequency Analysis Unit (FAU)

READ THE PAPER!!!

ASPs
- Window average (good filter!)
	- sum & average are proportional -- don't need to find real average
- turn average into abs(signal) and make peaks more extreme (reference point
	function)
- find diff(signal) = 0, peak detection
- generator of the input waveform

== Lab 2

NoC with audio processing thing

IO-ASP generate messages which used to configure the ASPs

== Major Tasks

Configuration of ASPs
Programming of ReCOP
Custom Instructions into Nios ISA (maybe?)
Making ReCOP multi cycle (no pipelining)

Instruction Groups
- Memory Reference (Load/Store)
- Register Reference
- Program flow 

= MORTEZA BIGLARI: Introduction to Multi-Processor System on Chip

== ISAs

Relation to memory
- Stack-based
- Accumulator-based
- Register-Memory
- Register-Register (Load-store architecture)

Classes based on 
- Instruction word size
- Number of different instuction
- Number of clock cycles
Like:
- RISC (ARM, MIPS, RISC-V)
- CISC (x86)
- EPIC

== Nios II ISA
- 32-bit data word
- 32 general registers
- Little endian
- 32 Interrupt sources
- Multiply and divide have 32-bit result
- _optional_ f32 support
- _optional_ shadow registers
- _optional_ MMU with supervisor (kernel) and user modes

3 Implementations
- economy
- standard (deprecated)
- fast

CSR (Control and Status Register)

= Back to Zoran

== Lab 2

ADC, DAC and IOASP connected through NoC.

ADC & DAC are connected to codec chip on dev board that can be used with audio
I/O on the board.

IOASP interacts with pushbuttons and switches on the board to configure other
ASPs.

== Project

*ASP Pipeline*
Signal Generator -> Averaging Filter -> Reference Point -> Peak Detector

Nios 2 calculates frequency of the source signal from the Peak Detector.

=== Signal Generator ASP
$2^8$ levels for positive side of signal. 10 cycles of input signal.

Signal Generator: Data in memory
Averaging Filter: Size of window 
Reference Point: Size of window
Peak detector: No idea (wah wah wah)

Develop protocol for configuration of ASPs.

