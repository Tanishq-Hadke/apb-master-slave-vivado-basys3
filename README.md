# AMBA APB Master-Slave Protocol Implementation (Verilog)

This project implements the AMBA APB (Advanced Peripheral Bus) Master-Slave protocol using Verilog HDL on the Basys3 FPGA board (Artix-7). The design is created using Xilinx Vivado and integrated using IP Integrator (Block Design).

---

## 📌 Project Overview

The project demonstrates:

- APB Master FSM implementation
- APB Slave with internal register file
- Read/Write transactions
- Block Design using Vivado IP Integrator
- FPGA implementation on Basys3
- LED output demonstration

The APB Master continuously writes incrementing data to the APB Slave registers. The Slave stores data and outputs the lower 16 bits to the onboard LEDs.

---

## 🏗 System Architecture

CLK100MHZ  
↓  
APB Master → APB Slave → LEDs  

The system follows the standard APB transaction phases:

1. IDLE  
2. SETUP  
3. ACCESS  

---

---

## ⚙️ Tools Used

- Xilinx Vivado
- Verilog HDL
- Basys3 FPGA (Artix-7)

---

## 🔁 APB Signals Used

| Signal | Description |
|--------|------------|
| PCLK | APB Clock |
| PRESETn | Active-Low Reset |
| PSEL | Peripheral Select |
| PENABLE | Enable Signal |
| PWRITE | Read/Write Control |
| PADDR | Address Bus |
| PWDATA | Write Data |
| PRDATA | Read Data |
| PREADY | Ready Signal |

---

## 🧠 Functional Description

- The Master FSM generates continuous write transactions.
- The Slave contains 4 internal registers.
- Address decoding is done using PADDR[3:2].
- LEDs display register[0][15:0].
- Reset clears all registers.

---

## 🧪 Simulation

Testbench included to verify:

- APB timing behavior
- Write transactions
- Proper state transitions

---

## 🔌 FPGA Implementation

Board: Basys3  
Clock: 100 MHz  
Reset: Center Button  
Output: 16 LEDs  

---

## 🚀 Future Improvements

- Multiple APB Slaves
- Wait state support (PREADY control)
- Interrupt generation
- AXI to APB Bridge
- MicroBlaze integration

---

## 📖 Learning Outcome

This project demonstrates understanding of:

- AMBA APB protocol
- FSM-based bus design
- IP Packaging in Vivado
- Block Design flow
- FPGA hardware validation

---
