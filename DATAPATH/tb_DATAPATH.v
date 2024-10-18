`timescale 1ns / 1ps


module tb_DATAPATH_v;

    // Inputs
    reg [4:0] read_reg_num1;
    reg [4:0] read_reg_num2;
    reg [4:0] write_reg;
    reg [3:0] alu_control;
    reg regwrite;
    reg clock;
    reg reset;

    // Outputs
    wire zero_flag;

    // Instantiate the Unit Under Test (UUT)
    DATAPATH uut (
        .read_reg_num1(read_reg_num1),
        .read_reg_num2(read_reg_num2),
        .write_reg(write_reg),
        .alu_control(alu_control),
        .regwrite(regwrite),
        .clock(clock),
        .reset(reset),
        .zero_flag(zero_flag)
    );

    // Initialize Inputs
    initial begin
        read_reg_num1 = 0;
        read_reg_num2 = 0;
        write_reg = 0;
        alu_control = 4'b0010;  // Set initial ALU control
        regwrite = 0;
        clock = 0;
        reset = 1;

        // Global reset
        #20 reset = 0;
    end

    // Apply stimulus for reading registers
    initial begin
        #25 read_reg_num1 = 0; read_reg_num2 = 0;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 0; read_reg_num2 = 1;
        #20 read_reg_num1 = 1; read_reg_num2 = 2;
    end

    // Apply stimulus for writing data
    initial begin
        #10 regwrite = 1;  // Enable writing after 10 time units
    end

    // Clock signal generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

   
endmodule


