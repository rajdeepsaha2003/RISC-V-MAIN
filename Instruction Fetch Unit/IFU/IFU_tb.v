`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:35 10/17/2024
// Design Name:   IFU
// Module Name:   IFU_tb.v
// Project Name:  IFU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_IFU;

  // Inputs
  reg clock;
  reg reset;

  // Output
  wire [31:0] Instruction_Code;

  // Instantiate the Unit Under Test (UUT)
  IFU uut (
    .clock(clock),
    .reset(reset),
    .Instruction_Code(Instruction_Code)
  );

 // Monitoring the changes in values
    initial
    $monitor($time, "CLOCK = %b, RESET = %b, Instruction Code = %h", Clock,Reset,OUTPUT);

    // Initializing reset
    initial
    begin
        Reset = 1'b0;
        #20 Reset = 1'b1;
        #200 Reset = 1'b0;
        #100 Reset = 1'b1;
    end

    // Initializing clock
    initial
    begin
        Clock = 1;
        forever #20 Clock = ~Clock;
    end

endmodule
