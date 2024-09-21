# RISC Processor Verilog Implementation

## Overview

This project implements a simplified RISC (Reduced Instruction Set Computer) processor using Verilog. The design emphasizes clarity and educational value, making it suitable for both learning and demonstration purposes.

## Key Components

### Parameters

- **LOAD**, **FETCH**, **DECODE**, **EXECUTE**: These parameters define the states of the finite state machine (FSM) used to manage instruction processing.

### Registers

- **current_state**, **next_state**: Registers that hold the current and next states of the FSM.
- **program_mem[9:0]**: An array that acts as the program memory, storing up to 10 instructions, each 12 bits wide.
- **load_done**: A flag indicating whether the loading of instructions is complete.
- **load_addr**: An 8-bit register that tracks the address location for loading instructions.
- **PC**, **DR**, **Acc**, **IR**, **SR**: Registers for the Program Counter, Data Register, Accumulator, Instruction Register, and Status Register, respectively.

### Wires

- Various wires (e.g., **PC_E**, **Acc_E**, **SR_E**) are used to control the enable signals for different modules and registers.
- **PC_updated**, **DR_updated**, **IR_updated**, **SR_updated**: Wires that hold updated values for respective registers.

## Memory Initialization

```verilog
initial begin
    program_mem[0] = 12'b000000000000;
    program_mem[1] = 12'b101100000001;
    program_mem[2] = 12'b001000100000;
    program_mem[3] = 12'b101100000000;
    program_mem[4] = 12'b001100110000;
    program_mem[5] = 12'b000100000101;
    program_mem[6] = 12'b000000000000;
    program_mem[7] = 12'b000000000000;
    program_mem[8] = 12'b000000000000;
    program_mem[9] = 12'b000000000000;
end

##ALU (Arithmetic Logic Unit)

ALU ALU_unit(
    .Operand1(Acc),
    .Operand2(ALU_Oper2),
    .E(ALU_E),
    .Mode(ALU_Mode),
    .CFlags(SR),
    .Out(ALU_Out),
    .Flags(SR_updated)
);
The ALU performs arithmetic and logical operations. It takes two operands (the contents of the Accumulator and another operand), an enable signal, and the mode of operation. The result and status flags are outputted to manage subsequent operations.
##Multiplexers (MUX)

MUX1 MUX2_unit(
    .In2(IR[7:0]),
    .In1(DR),
    .Sel(MUX2_Sel),
    .Out(ALU_Oper2)
);
The multiplexer selects between two inputs based on the selection signal (Sel). In this case, it chooses between the lower 8 bits of the Instruction Register and the Data Register as input to the ALU.
##Data Memory

DMem DMem_unit(
    .clk(clk),
    .E(DMem_E),
    .WE(DMem_WE),
    .Addr(IR[3:0]),
    .DI(ALU_Out),
    .DO(DR_updated)
);
This module represents the data memory. It includes ports for clock, enable, write enable, address, data input, and data output to manage read and write operations.
##Program Memory

PMem PMem_unit(
    .clk(clk),
    .E(PMem_E),
    .Addr(PC),
    .I(IR_updated),
    .LE(PMem_LE),
    .LA(load_addr),
    .LI(load_instr)
);
The program memory module is responsible for storing instructions and loading them into the Instruction Register when needed.
##Program Counter (PC)

adder PC_Adder_unit(
    .In(PC),
    .Out(Adder_Out)
);
The adder updates the Program Counter based on the current instruction execution, facilitating sequential instruction fetching.
##Control Logic

Control_Logic Control_Logic_Unit(
    .stage(current_state),
    .IR(IR),
    .SR(SR),
    .PC_E(PC_E),
    .Acc_E(Acc_E),
    .SR_E(SR_E),
    .IR_E(IR_E),
    .DR_E(DR_E),
    .PMem_E(PMem_E),
    .DMem_E(DMem_E),
    .DMem_WE(DMem_WE),
    .ALU_E(ALU_E),
    .MUX1_Sel(MUX1_Sel),
    .MUX2_Sel(MUX2_Sel),
    .PMem_LE(PMem_LE),
    .ALU_Mode(ALU_Mode)
);
This module handles the control signals based on the current state of the FSM. It dictates how the processor behaves at each stage of instruction processing.
State Machine
The state machine transitions between the states LOAD, FETCH, DECODE, and EXECUTE, managing the flow of data and control signals throughout the processor. Each state corresponds to a specific phase in instruction processing:

LOAD: Load instructions into memory.
FETCH: Retrieve the next instruction from program memory.
DECODE: Decode the fetched instruction to determine the operation.
EXECUTE: Perform the operation specified by the instruction.
Summary
This Verilog code defines a simplified RISC processor that incorporates fundamental concepts of computer architecture, such as instruction fetching, decoding, execution, and memory management. Each component is modularized for clarity and ease of testing. The design can serve as an educational tool for understanding processor architecture and design principles
