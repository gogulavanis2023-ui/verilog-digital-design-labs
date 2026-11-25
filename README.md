# Verilog Digital Design Labs

A collection of combinational and sequential digital building blocks written in Verilog. They were simulated in ModelSim, and the counter design was also implemented on an Intel Cyclone IV (Terasic DE2-115) in Quartus. The modules cover gate-level, dataflow and behavioural modelling of the same circuits.

## Contents
| Folder | Module | Modelling style / notes |
|---|---|---|
| `combinational/` | `half_adder.v`, `full_adder.v` | Gate-level / dataflow |
| | `half_subtractor_pos.v`, `full_subtractor.v` | Product-of-sums and dataflow |
| | `four_bit_adder.v`, `adder_subtractor.v` | Ripple-carry; add/sub with a mode bit |
| | `four_bit_multiplier.v` | 4×4 array multiplier |
| | `mux_64x1.v`, `demux_1x4.v` | Hierarchical 64:1 mux tree, 1:4 demux |
| | `decoder_16to4.v` | One-hot 16-to-4 encoder with a `valid` flag (`case`-based) |
| | `boolean_functions.v` | Four-output Boolean functions in SOP and POS form |
| `behavioural/` | `half_subtractor_if.v`, `full_subtractor_case.v` | `if-else` and `case` styles of the same logic |
| `sequential/` | `sipo.v`, `siso.v`, `piso.v`, `pipo.v` | All four shift-register types, with testbenches in the same files |
| | `ring_counter.v`, `up_down_counter.v` | 3-bit ring and up/down counters with asynchronous reset and inline testbenches |
| `fpga_counter_7seg_de2-115/` | `counter_segment.v` (top), `clk_divider.v`, `counter_4bit.v`, `binary_segment.v`, `counter_segment_tb.v` | 50 MHz → 1 Hz divider (async active-low reset), 4-bit counter and 7-segment decoder on the DE2-115 board |

## How to run
**ModelSim / Questa:**
```tcl
vlib work
vlog sequential/ring_counter.v
vsim -c ring_tb -do "run -all"
```
**DE2-115 counter:** create a Quartus project for `EP4CE115F29C7`, add the `fpga_counter_7seg_de2-115/` sources with `counter_segment` as top, import the DE2-115 pin assignments, compile and program.

## What these demonstrate
- The same function written in gate-level, dataflow and behavioural styles, and how each synthesises
- Hierarchical design (mux trees, adder chains)
- Clocked logic: shift registers, counters, clock division
- A complete FPGA flow: RTL → simulation → pin assignment → bitstream → board

## Possible extensions
Self-checking testbenches for every module, parameterised widths, and a carry-lookahead adder compared against ripple-carry for delay and area.

## Technologies
`Verilog` `ModelSim` `Quartus Prime` `Cyclone IV` `DE2-115` `Combinational logic` `Sequential logic`
