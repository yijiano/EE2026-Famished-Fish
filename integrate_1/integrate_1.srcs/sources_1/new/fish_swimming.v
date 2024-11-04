`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 14:07:24
// Design Name: 
// Module Name: fish_swimming
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


module fish_swimming(
    input clk_6_25MHz,
    output reg [6:0] i = 0
);
    // Clock divider to slow down movement updates
    reg [22:0] clk_divider = 0;
    wire move_enable;
    wire [22:0] random_speed;

    // Instantiate random_in_range module to generate random speed value
    random_in_range rand_gen (
        .clk(clk_6_25MHz),
        .random_value(random_speed)
    );

    assign move_enable = (clk_divider == 0);

    always @(posedge clk_6_25MHz) begin
        // Clock divider to slow down movement
        if (clk_divider == random_speed)
            clk_divider <= 0;
        else
            clk_divider <= clk_divider + 1;
            
        if (move_enable) 
            i <= i + 4;
    end
endmodule