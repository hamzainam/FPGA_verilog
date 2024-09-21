module MCU_tb;
// fpga4student.com: FPGA project, Verilog project, VHDL project 
// Verilog project: Verilog code for microcontroller
// Inputs
reg clk;
reg rst;
// Instantiate the Unit Under Test (UUT)
MicroController uut (
.clk(clk), 
.rst(rst)
);
initial begin
// Initialize Inputs
rst = 1;
// Wait 100 ns for global reset to finish
#100;
rst = 0;
end
initial begin 
clk = 0;
forever #10 clk = ~clk;
end 
endmodule 



// module MCU_tb;
// // fpga4student.com: FPGA project, Verilog project, VHDL project 
// // Verilog project: Verilog code for microcontroller 

// // Inputs
// reg clk;
// reg rst;
// //reg [11:0] program_mem [0:9]; // Declare program_mem as an array of 12-bit registers
// //reg [11:0] i;
// // Instantiate the Unit Under Test (UUT)
// MicroController uut (
//     .clk(clk), 
//     .rst(rst),
//     //.data(program_mem)
// );

// initial begin
//     // Initialize Inputs
//     rst = 1;
// //program_mem[0] = 12'h000; // Initialize first element of the array

//     // Wait 100 ns for global reset to finish
//     #100;
//     rst = 0;
//    // program_mem[0] = 12'h444; // Initialize first element to 444

//     // Loop to increment program_mem
//     // for ( int i = 1; i < 10; i = i+1) begin // Start from 1 since 0 is initialized
//     //     program_mem[i] = program_mem[i - 1] + 1'b1; // Increment subsequent elements
//     //     #20;
//     // end
// end

// initial begin 
//     clk = 0;
//     forever #10 clk = ~clk; // Generate clock signal
// end 

// endmodule