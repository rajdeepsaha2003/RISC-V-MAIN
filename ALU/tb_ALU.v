`timescale 1ns / 1ps

module tb_ALU_v;

    // Inputs
    reg [31:0] in1;
    reg [31:0] in2;
    reg [3:0] alu_control;

    // Outputs
    wire [31:0] alu_result;
    wire zero_flag;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .in1(in1),
        .in2(in2),
        .alu_control(alu_control),
        .alu_result(alu_result),
        .zero_flag(zero_flag)
    );

    // Initialize inputs and apply stimulus
    initial begin
        // Initialize Inputs
        in1 = 32'd0;
        in2 = 32'd0;
        alu_control = 4'b0000;

        // Wait for 100 ns for global reset
        #100;

        // Add stimulus
        in1 = 32'd23; in2 = 32'd42; alu_control = 4'b0000;   // AND operation
        #20 in1 = 32'd23; in2 = 32'd42; alu_control = 4'b0001; // OR operation
        #20 in1 = 32'd23; in2 = 32'd42; alu_control = 4'b0010; // ADD operation
        #20 in1 = 32'd23; in2 = 32'd42; alu_control = 4'b0100; // XOR operation
        #20 in1 = 32'd23; in2 = 32'd42; alu_control = 4'b1000; // SUB operation
        #20 in1 = 32'd42; in2 = 32'd23; alu_control = 4'b1000; // SUB operation (reverse)
        #20 in1 = 32'd42; in2 = 32'd23; alu_control = 4'b0100; // XOR operation (reverse)
    end

    // Monitor changes in values
    initial begin
        $monitor("Time: %0t | in1 = %d | in2 = %d | ALU_Control = %b | ALU_Result = %d | Zero_Flag = %b",
                 $time, in1, in2, alu_control, alu_result, zero_flag);
    end



endmodule

