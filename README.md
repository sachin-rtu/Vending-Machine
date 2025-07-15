# Vending Machine - Verilog HDL Implementation
## Overview
A digital vending machine implementation using Verilog HDL that dispenses four different products with automatic change return. The machine accepts 5 and 10 unit coins and uses Finite State Machine (FSM) design principles.
## Product Specifications
| Item              | Price   | Item Selection Code |
| :---------------- | :------: | ----: |
| Item 1            |15 units   | 4'b0001 |
| Item 2            |   20 units  | 4'b0010 |
| Item 3  |  25 units   | 4'b0100 |
| Item 4 |  30 units   | 4'b1000 |

## System Interface
### Inputs

- **item_number[3:0] -** Item selection
- **five_in -** 5-unit coin insertion
- **ten_in -** 10-unit coin insertion
- **clock -** System clock
- **reset -** Asynchronous reset

### Outputs

- **five_out -*** 5-unit change dispensed
- **dispense -** Item ready for dispensing

## Architecture
The system contains five modules:

1. **Item_One to Item_Four:** Individual FSM modules for each product
2. **VendingMachine:** Top-level module that selects appropriate item module

Each item module uses states representing accumulated money (S0, S5, S10, S15, S20, S25, S30) and transitions based on coin inputs.
### Output Logic

- *{five_out, dispense}* = *2'b00* - No action
- *{five_out, dispense}* = *2'b01* - Dispense item only
- *{five_out, dispense}* = *2'b10* - Return change only
- *{five_out, dispense}* = *2'b11* - Dispense item + return change

## Operation Example
### Item 1 Purchase (15 units):

1. Select Item 1: item_number = 4'b0001
2. Insert 5-unit coin: S0 → S5
3. Insert 10-unit coin: S5 → S15, item dispensed
4. Machine resets to S0

### Overpayment Example:

- Item 1 (15 units) + 20 units payment = Item dispensed + 5-unit change

## Files

- **VendingM.v** - Main implementation
- **VendingMTB.v** - Comprehensive testbench
- **README.md** - Documentation

## Testing
The testbench covers:

- Basic functionality for all items
- Change return scenarios
- Reset functionality
- Invalid item selections

## Running Simulation
Compile Verilog files using Icarus Verilog compiler*
 
 *-o specifies output executable name*
 
```iverilog -o vending_machine VendingM.v VendingMTB.v```

 *Execute the compiled simulation*
 
 *This runs the testbench and generates VCD waveform file*
 
```./vending_machine```

 *Open waveform viewer to analyze simulation results*
 
 *VCD file contains signal timing information*
 
```gtkwave VendingMachine.vcd```

or follow [this](https://youtu.be/08S6NxUs-Uo?si=1JOFm-6Qz1wh8RvM) video to run it locally.

## Key Features
- Multi-item support with different prices
- Automatic change return
- Synchronous FSM design
- Asynchronous reset
- Comprehensive testing
- Modular architecture

## Design Highlights

- **One-hot state encoding** for efficient hardware implementation
- **Clock-synchronous** state transitions
- **Combinational logic** for next state and outputs
- **Modular design** with separate FSMs for each item
