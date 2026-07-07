# 🚀 32-bit Single-Cycle RISC-V Processor

> A 32-bit Single-Cycle RISC-V Processor designed in **Verilog HDL**, verified using **ModelSim**, and implementing a subset of the **RISC-V RV32I Instruction Set Architecture (ISA)**.

---

## 📖 Project Overview

This repository presents the design and implementation of a **32-bit Single-Cycle RISC-V Processor** based on the open-source **RISC-V RV32I Instruction Set Architecture (ISA)**.

The processor is developed entirely in **Verilog HDL** using a modular hardware design approach. Each functional block—including the Program Counter, Instruction Memory, Register File, Immediate Generator, Control Unit, ALU Control Unit, Arithmetic Logic Unit (ALU), Data Memory, and Multiplexers—was designed independently and then integrated into a complete processor datapath.

The processor executes one instruction per clock cycle and supports a subset of the RV32I instruction set, including arithmetic, logical, immediate, load/store, branch, and jump instructions.

The complete design has been functionally verified through simulation using **ModelSim**, with dedicated testbenches and custom RISC-V assembly programs converted into machine code for execution.

This project was developed as part of an RTL-to-GDSII learning journey to gain a strong understanding of processor architecture, digital design, computer organization, and Verilog-based hardware implementation.

---

## ✨ Features

- ✅ 32-bit Single-Cycle RISC-V Processor
- ✅ Implements a subset of the **RV32I Instruction Set Architecture**
- ✅ Designed completely in **Verilog HDL**
- ✅ Modular RTL design for easy understanding and scalability
- ✅ Executes one instruction per clock cycle
- ✅ Supports arithmetic and logical operations
- ✅ Supports immediate instructions
- ✅ Supports load and store memory operations
- ✅ Supports conditional branch instructions
- ✅ Supports unconditional jump instructions
- ✅ Dedicated ALU Control Unit for instruction decoding
- ✅ 32 × 32-bit Register File
- ✅ Immediate Generator supporting multiple instruction formats
- ✅ Separate Instruction Memory and Data Memory
- ✅ Write-back architecture using a dedicated multiplexer
- ✅ Functional verification performed using **ModelSim**
- ✅ Tested using custom RISC-V assembly programs

---

# 🏗️ Processor Architecture

The processor follows a **Single-Cycle RISC-V Datapath**, where every instruction is fetched, decoded, executed, and completed within a single clock cycle.

The design is divided into multiple RTL modules, each responsible for a specific function in the datapath. These modules are interconnected to perform instruction execution according to the RISC-V RV32I specification.

## Major Hardware Modules

| Module | Function |
|---------|----------|
| Program Counter (PC) | Stores the address of the current instruction |
| Instruction Memory | Fetches instructions using the Program Counter |
| Register File | Stores 32 general-purpose registers and provides source operands |
| Immediate Generator | Generates sign-extended immediate values for different instruction formats |
| Main Control Unit | Generates control signals based on the instruction opcode |
| ALU Control Unit | Decodes instruction fields and selects the ALU operation |
| ALU | Performs arithmetic and logical operations |
| Data Memory | Executes load and store operations |
| Branch & Jump Adder | Computes branch and jump target addresses |
| PC Select MUX | Chooses the next Program Counter value |
| ALU Source MUX | Selects between register data and immediate value |
| Writeback MUX | Selects the value written back to the Register File |

---

# 📂 Project Structure

```text
RISC-V-Single-Cycle-Processor
│
├── rtl/                  # Verilog RTL source files
├── testbench/            # Testbenches for simulation
├── program/              # RISC-V assembly programs and machine code
├── waveforms/            # ModelSim waveform screenshots
├── images/               # Architecture and datapath diagrams
├── docs/                 # Project documentation and report
├── LICENSE
└── README.md
```

## Directory Description

- **rtl/** – Contains all Verilog HDL modules implementing the processor.
- **testbench/** – Simulation testbenches used to verify the RTL.
- **program/** – Assembly programs, generated machine code, and memory initialization files.
- **waveforms/** – Simulation waveform screenshots captured from ModelSim.
- **images/** – Block diagrams, datapath figures, and architecture illustrations.
- **docs/** – Project report and supporting documentation.
