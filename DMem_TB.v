`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2024 08:46:01 AM
// Design Name: 
// Module Name: DMem_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DMem_TB();


    reg Enable_port;
    reg Write_enable_port;
    reg [7:0] DI;
    wire [7:0] DO;
    reg [3:0] Address_port;
    reg clock; // Declare clock signal
    // Below 2 signals are for for loop
    //reg [7:0] data_in;
    reg [3:0] addr_in;

    DMem dut( 
        .clk(clock),
        .E(Enable_port), // Enable port 
        .WE(Write_enable_port), // Write enable port
        .Addr(Address_port), // Address port 
        .DI(DI), // Data input port
        .DO(DO) // Data output port
    );
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        #5
        Enable_port = 1'b1; 
        Write_enable_port = 1'b1;
                // Loop to input values
        for (addr_in = 0; addr_in < 8; addr_in = addr_in + 1) begin
            DI = addr_in + 8; // Set DI to data input starting from 8
            Address_port = addr_in; // Set address port
            #10; // Wait for some time for the write operation
            // Optionally, you can add a read operation here if needed
        end
        #40
        Enable_port = 1'b0; 
        Write_enable_port = 1'b1;
    end
    
endmodule

