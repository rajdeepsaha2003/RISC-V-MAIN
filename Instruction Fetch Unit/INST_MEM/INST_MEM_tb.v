`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:34:22 10/17/2024
// Design Name:   INST_MEM
// Module Name:   INST_MEM_tb.v
// Project Name:  INST_MEM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: INST_MEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_INST_MEM;
  
  // Inputs
  reg [31:0] PC;
  reg reset;

  // Output
  wire [31:0] Instruction_Code;

  // Instantiate the Unit Under Test (UUT)
  INST_MEM uut (
    .PC(PC),
    .reset(reset),
    .Instruction_Code(Instruction_Code)
  );

  initial begin
    // Monitor changes in the signals
    $monitor("Time = %0t | PC = %h | Instruction_Code = %h", $time, PC, Instruction_Code);

    // Test Case 1: Reset the memory (load instructions into memory)
    reset = 1;
    #5;
    reset = 0;

    // Test Case 2: Fetch the first instruction (add t1, s0, s1 => 0x00940333)
    PC = 0;
    #5;
    if (Instruction_Code !== 32'h00940333)
      $display("Test Case 2 Failed!");

    // Test Case 3: Fetch the second instruction (sub t2, s2, s3 => 0x413903b3)
    PC = 4;
    #5;
    if (Instruction_Code !== 32'h413903b3)
      $display("Test Case 3 Failed!");

    // Test Case 4: Fetch the third instruction (mul t0, s4, s5 => 0x035a02b3)
    PC = 8;
    #5;
    if (Instruction_Code !== 32'h035a02b3)
      $display("Test Case 4 Failed!");

    // Test Case 5: Fetch the fourth instruction (xor t3, s6, s7 => 0x017b4e33)
    PC = 12;
    #5;
    if (Instruction_Code !== 32'h017b4e33)
      $display("Test Case 5 Failed!");

    // Test Case 6: Fetch the fifth instruction (sll t4, s8, s9 => 0x019c1eb3)
    PC = 16;
    #5;
    if (Instruction_Code !== 32'h019c1eb3)
      $display("Test Case 6 Failed!");

    // Test Case 7: Fetch the sixth instruction (srl t5, s10, s11 => 0x01bd5f33)
    PC = 20;
    #5;
    if (Instruction_Code !== 32'h01bd5f33)
      $display("Test Case 7 Failed!");

    // Test Case 8: Fetch the seventh instruction (and t6, a2, a3 => 0x00d67fb3)
    PC = 24;
    #5;
    if (Instruction_Code !== 32'h00d67fb3)
      $display("Test Case 8 Failed!");

    // Test Case 9: Fetch the eighth instruction (or a7, a4, a5 => 0x00f768b3)
    PC = 28;
    #5;
    if (Instruction_Code !== 32'h00f768b3)
      $display("Test Case 9 Failed!");

    
  end

endmodule
