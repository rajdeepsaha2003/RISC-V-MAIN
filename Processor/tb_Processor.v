`timescale 1ns / 1ps

module tb_Processor_v;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.clock(clock), 
		.reset(reset), 
		.zero(zero)
	);

	initial begin
        reset = 1;
        #50 reset = 0;
    end

    initial begin
        clock = 0;
        forever #20 clock = ~clock;
    end
      
endmodule

