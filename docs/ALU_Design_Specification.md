# 8-bit ALU Design Specification

## 📌 Overview
Arithmetic Logic Unit (ALU) that performs:
- **Arithmetic**: ADD, SUB  
- **Logical**: AND, OR, XOR, NOT  
- **Shift Operations**: SHL, SHR  

## 📐 Block Diagram
![ALU Diagram](./images/ALU_block_diagram.png)

## 🔌 Inputs/Outputs
| Signal     | Width | Direction | Description          |
|------------|-------|-----------|----------------------|
| A, B       | 8     | Input     | Operands             |
| Opcode     | 3     | Input     | Operation selector   |
| Carry_in   | 1     | Input     | Carry input          |
| Result     | 8     | Output    | Operation result     |
| Carry_out  | 1     | Output    | Carry output         |
| Zero       | 1     | Output    | Zero flag            |
| Negative   | 1     | Output    | Negative flag        |

## 🎛 Opcode Mapping
| Opcode | Operation | Description               |
|--------|-----------|---------------------------|
| 000    | ADD       | A + B                     |
| 001    | SUB       | A - B                     |
| 010    | AND       | Bitwise AND               |
| 011    | OR        | Bitwise OR                |
| 100    | XOR       | Bitwise XOR               |
| 101    | NOT       | Bitwise NOT (A only)      |
| 110    | SHL       | Shift left (A << 1)       |
| 111    | SHR       | Shift right (A >> 1)      |
