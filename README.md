# 🚀 32-bit Single-Cycle RISC-V Processor

> A 32-bit Single-Cycle RISC-V Processor designed in **Verilog HDL**, verified using **ModelSim**, and implementing a subset of the **RISC-V RV32I Instruction Set Architecture (ISA)**.

---

## 📖 Project Overview

This repository presents the design and implementation of a **32-bit Single-Cycle RISC-V Processor** based on the open-source **RISC-V RV32I Instruction Set Architecture (ISA)**.

The processor is developed entirely in **Verilog HDL** using a modular hardware design approach. Each functional block—including the Program Counter, Instruction Memory, Register File, Immediate Generator, Control Unit, ALU Control Unit, Arithmetic Logic Unit (ALU), Data Memory, and Multiplexers—was designed independently and then integrated into a complete processor datapath.

The processor executes one instruction per clock cycle and supports a subset of the RV32I instruction set, including arithmetic, logical, immediate, load/store, branch, and jump instructions.

The complete design has been functionally verified through simulation using **ModelSim**, with dedicated testbenches and custom RISC-V assembly programs converted into machine code for execution.

This project was developed as part of an RTL-to-GDSII learning journey to gain a strong understanding of processor architecture, digital design, computer organization, and Verilog-based hardware implementation.
