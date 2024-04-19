# Creat a ALU 8-bit

## 8-Bit ALU Supporting Four Operations
This 8-bit ALU design supports four basic operations:
1. **Addition**: Adds two 8-bit binary numbers.
2. **Subtraction**: Subtracts an 8-bit binary number from another 8-bit binary number.
3. **AND**: Performs the bitwise AND operation on two 8-bit binary numbers.
4. **OR**: Performs the bitwise OR operation on two 8-bit binary numbers.

The ALU also features a **ZERO** signal that goes high if the result of the operation is zero.

## Operation Selection
The operation to be performed is selected by a 2-bit control signal `OP`. The following table shows the truth table for operation selection:

|OP  |	Operation  |
|:--:|    :--:     |
|00  |	Addition   |
|01	 | Subtraction |  
|10	 |     AND     |
|11  | 	   OR      | 

# Inputs and Outputs
The ALU has two 8-bit data inputs, A and B, and one 8-bit output, F. The ZERO signal is an additional output.
