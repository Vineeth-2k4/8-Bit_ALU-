
# ALU Verification Test Cases

## 🧪 Test Coverage
- Arithmetic operations (ADD/SUB)  
- Logical operations (AND/OR/XOR/NOT)  
- Shift operations (SHL/SHR)  
- Flag behavior (Zero, Negative, Carry)  

## 📊 Test Cases
| Opcode | Operation | Input A (hex) | Input B (hex) | Expected Result | Flags (Z/N/C) | Description           |
|--------|-----------|---------------|---------------|-----------------|--------------|-----------------------|
| 000    | ADD       | 0x55          | 0xAA          | 0xFF            | 0/1/0        | Basic addition        |
| 001    | SUB       | 0x55          | 0x10          | 0x45            | 0/0/0        | Basic subtraction     |
| 010    | AND       | 0x55          | 0x0F          | 0x05            | 0/0/0        | Bitwise AND           |
| 011    | OR        | 0x55          | 0x0F          | 0x5F            | 0/0/0        | Bitwise OR            |
| 100    | XOR       | 0x55          | 0xFF          | 0xAA            | 0/1/0        | Bitwise XOR           |
| 101    | NOT       | 0x55          | -             | 0xAA            | 0/1/0        | Bitwise NOT           |
| 110    | SHL       | 0xAA          | -             | 0x54            | 0/0/1        | Shift left (MSB→Carry)|
| 111    | SHR       | 0x55          | -             | 0x2A            | 0/0/1        | Shift right (LSB→Carry)|

## 🚩 Flag Behavior
- **Zero (Z)**: `1` when Result = 0x00  
- **Negative (N)**: `1` when Result[7] = 1  
- **Carry (C)**: `1` on overflow (arithmetic) or last bit shifted out (shifts)  
