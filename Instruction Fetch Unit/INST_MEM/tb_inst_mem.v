`timescale 1ns / 1ps

module tb_inst_mem_v;

    // Inputs
    reg [31:0] PC;
    reg reset;

    // Outputs
    wire [31:0] Instruction_Code;

    // Instantiate the Unit Under Test (UUT)
    INST_MEM uut (
        .PC(PC), 
        .reset(reset), 
        .Instruction_Code(Instruction_Code)
    );

    // Initialize Inputs and set up stimulus
    initial begin
        // Set initial values
        PC = 32'd0;
        reset = 1'b0;

        // Apply stimulus
        #20 reset = 1'b1;  // Assert reset after 20 time units
        #20 PC = 32'd0;    // First instruction
        #20 PC = 32'd4;    // Second instruction
        #20 PC = 32'd8;    // Third instruction
        #20 PC = 32'd12;   // Fourth instruction
    end

    // Monitor the output
    initial begin
        $monitor($time, " PC = %d, Instruction Code = %h", PC, Instruction_Code);
    end
endmodule


