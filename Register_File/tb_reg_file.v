`timescale 1ns / 1ps

module tb_reg_file_v;

    // Inputs
    reg [4:0] read_reg_num1;
    reg [4:0] read_reg_num2;
    reg [4:0] write_reg;
    reg [31:0] write_data;
    reg regwrite;
    reg clock;
    reg reset;

    // Outputs
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Instantiate the Unit Under Test (UUT)
    REG_FILE uut (
        .read_reg_num1(read_reg_num1),
        .read_reg_num2(read_reg_num2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .regwrite(regwrite),
        .clock(clock),
        .reset(reset)
    );

    // Clock generation (toggling every 10 time units)
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    // Initialize inputs and apply stimulus
    initial begin
        // Initialize inputs
        reset = 1;           // Reset active
        regwrite = 0;        // No write operations initially
        read_reg_num1 = 0;
        read_reg_num2 = 0;
        write_reg = 0;
        write_data = 0;

        #10 reset = 0;       // Deassert reset after 10 time units

        // Start writing to registers
        #10 regwrite = 1; write_data = 32'd20; write_reg = 5'd0;  // Write 20 to register 0
        #10 regwrite = 1; write_data = 32'd30; write_reg = 5'd1;  // Write 30 to register 1
        #10 regwrite = 1; write_data = 32'd40; write_reg = 5'd2;  // Write 40 to register 2
        #10 regwrite = 1; write_data = 32'd50; write_reg = 5'd3;  // Write 50 to register 3

        // Disable writing
        #10 regwrite = 0;

        // Start reading from registers
        #10 read_reg_num1 = 5'd0; read_reg_num2 = 5'd1;  // Read register 0 and 1
        #10 read_reg_num1 = 5'd2; read_reg_num2 = 5'd3;  // Read register 2 and 3
        #10 read_reg_num1 = 5'd1; read_reg_num2 = 5'd2;  // Read register 1 and 2
        #10 read_reg_num1 = 5'd0; read_reg_num2 = 5'd3;  // Read register 0 and 3

        // Continue running indefinitely (no $finish)
    end

    // Monitor output for debug
    initial begin
        $monitor("Time: %0t | read_data1 = %h | read_data2 = %h", $time, read_data1, read_data2);
    end

endmodule


