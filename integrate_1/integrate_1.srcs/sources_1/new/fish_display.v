`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 14:06:35
// Design Name: 
// Module Name: fish_display
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


module fish_display(input [12:0] pixel_index, input clk_6_25MHz, input [6:0] middle_i, input [5:0] middle_j, output reg[15:0] oled_color = 16'b0111011100011111);
    // Initialization
    wire [6:0] x; 
    wire [5:0] y; 
    wire [6:0] i; 
    wire [5:0] j; 
    assign x = pixel_index % 96; 
    assign y = pixel_index / 96; 
   
    assign i = middle_i - 3;
    assign j = middle_j - 2;
    
    always@(posedge clk_6_25MHz) begin
        if ((x >= i + 3 && x <= i + 3) && (y == j + 0)) oled_color <= 16'b1111101110100000;
        else if ((x >= i + 3 && x <= i + 3) && (y == j + 0)) oled_color <= 16'b1111101110100000;
        else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 2 && x <= i + 2) && (y == j + 1)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 3 && x <= i + 3) && (y == j + 1)) oled_color <= 16'b1111101110100000;
        else if ((x >= i + 4 && x <= i + 4) && (y == j + 1)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 5 && x <= i + 5) && (y == j + 1)) oled_color <= 16'b0111101001000011;
        else if ((x >= i + 5 && x <= i + 5) && (y == j + 1)) oled_color <= 16'b0111101001000011;
        else if ((x >= i + 1 && x <= i + 2) && (y == j + 2)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 3 && x <= i + 3) && (y == j + 2)) oled_color <= 16'b1111101110100000;
        else if ((x >= i + 4 && x <= i + 4) && (y == j + 2)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 4 && x <= i + 4) && (y == j + 2)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 0 && x <= i + 0) && (y == j + 3)) oled_color <= 16'b1111101111000000;
        else if ((x >= i + 3 && x <= i + 3) && (y == j + 3)) oled_color <= 16'b1111101110100000;
        else oled_color = 16'b10000_000000_00000;
    end
endmodule

