`timescale 1ns / 1ps



module tb_IFU_v;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [31:0] Instruction_Code;

	// Instantiate the Unit Under Test (UUT)
	IFU uut (
		.clock(clock), 
		.reset(reset), 
		.Instruction_Code(Instruction_Code)
	);

	// Clock Generation: Toggle the clock every 20 time units
	initial begin
		clock = 0;
		forever #20 clock = ~clock; // Clock toggles every 20 time units
	end

	// Reset Logic and Test Sequence
	initial begin
		// Initialize Inputs
		reset = 0;

		// Initial reset
		#20 reset = 1; // Assert reset for 20 time units
		#20 reset = 0; // Deassert reset

		// Monitor changes in the instruction code and clock
		$monitor("Time = %0t | Clock = %b | Reset = %b | Instruction_Code = %h", $time, clock, reset, Instruction_Code);
		
		
	end
      
endmodule


