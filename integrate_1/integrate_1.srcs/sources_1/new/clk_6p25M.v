`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 00:58:48
// Design Name: 
// Module Name: clk_6p25M
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



module clk_6p25M(
    input basys_clock,
    output my_6_25mhz_clock
);

    wire clk_6_25mhz;
    
    flexible_clock clock_divider (
        .basys_clock(basys_clock),
        .m(32'd8),  
        .clk_out(clk_6_25mhz)
    );

    assign my_6_25mhz_clock = clk_6_25mhz;
endmodule
