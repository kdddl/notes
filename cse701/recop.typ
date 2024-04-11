#import "../common.typ": conf
#import "../themes/gruvbox_dark.typ"
#show: doc => conf(gruvbox_dark.colour, gruvbox_dark.colour, doc)

#table(
  columns: (2fr, 6fr, 4fr, 4fr, 16fr),
  fill: (col, row) => if calc.odd(col) { gruvbox_dark.colour.at(1) } else { gruvbox_dark.colour.at(2) },
  [AM], [Opcode], [Rz], [Rx], [Operand],
  [2], [6], [4], [4], [16]
)

#table(
  columns: 3,
  [*Opcode*], [*Instruction*], [*Addressing Mode*],
  [0], [NOP], [Inh],
  [1], [AND], [Imm, Reg],
  [2], [OR], [Imm, Reg],
  [3], [ADD], [Imm, Reg],
  [4], [SUB], [Imm, Reg],
  [5], [CMP], [Imm],
  [6], [LDR], [Imm, Dir, Reg],
  [7], [STR], [Imm, Dir, Reg],
  [8], [JMP], [Imm, Reg],
  [9], [JEZ], [Imm],
  [10], [CZF], [Inh],
  [11], [PRES], [Imm],
  [12], [DCAL], [Imm, Reg],
  [13], [SIP], [Reg],
  [14], [SOP], [Reg],
  [15], [SPC], [Dir],
)

#table(
  columns: 2,
  [*Addressing Mode*], [*Code*],
  [Inherent], [00],
  [Immediate], [01],
  [Direct], [10],
  [Register], [11],
)

== Multicycle Implementation

Standard 5 cycle 

- Instruction fetch
- Instruction decode
- Execution (ALU)
- Memory
- Write back

== Other notes

- separated program and data memory
