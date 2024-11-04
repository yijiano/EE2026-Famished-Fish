`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 11:45:48
// Design Name: 
// Module Name: seaweed_strand
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


module seaweed_strand(input [6:0] seg, input [6:0] compare, input [6:0] x, y, input clk, input [7:0] i, input [5:0] j, output reg[15:0] oled_color = 16'b11111_111111_11111);
    
    always @ (posedge clk) begin
    
    if ((x >= i + 0 && x <= i + 3) && (y == j + 0)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 0)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 1)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 1)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 2)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 2)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 3)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 3)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 4)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 4)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 5)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 5)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 6)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 6)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 7)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 7)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 8)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 8)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 9)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 9)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 10)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 10)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 11)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 11)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110010000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 11)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 11)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 12)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 12)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110010000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 12)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 12)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 13)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 13)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110010000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 13)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 13)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 14)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 14)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0110110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 14)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 14)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 15)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 15)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0110110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 15)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 15)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 16)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 16)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0110110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 16)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 16)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 17)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 17)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0110110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 17)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 17)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 18)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 18)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 18)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 18)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 19)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 19)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 19)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 19)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 20)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 20)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 20)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 20)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 21)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 21)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 21)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 22)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 22)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 22)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 23)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 23)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 23)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 24)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 24)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 24)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 25)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 25)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 25)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 26)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 26)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 26)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 27)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 27)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 27)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 28)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 28)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 28)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 28)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 29)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 29)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 29)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 29)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 30)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 30)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 30)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 30)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 31)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 31)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 31)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 31)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 32)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 32)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 32)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 32)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 33)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 33)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 33)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 33)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 34)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 34)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 34)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 34)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 35)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 35)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 35)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 11 && x <= i + 14) && (y == j + 35)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 36)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 36)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 37)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 37)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 38)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 14) && (y == j + 38)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 39)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 39)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 39)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 39)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 40)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 40)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 40)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 40)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 41)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 41)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 41)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 41)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 42)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 42)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 42)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 42)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 43)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 43)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 43)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 43)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 44)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 44)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 44)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 44)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 45)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 45)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 45)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 45)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 46)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 46)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 46)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 46)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 47)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 47)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 47)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 47)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 48)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 48)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 48)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 48)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 49)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 49)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100110011101000;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 49)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 49)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 50)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 50)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 50)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 50)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 51)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 51)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 51)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 51)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 0 && x <= i + 3) && (y == j + 52)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 52)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011110001000111;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 52)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 52)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000000110;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 53)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 53)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 53)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 54)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 54)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 54)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 55)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 55)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 55)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 0 && x <= i + 7) && (y == j + 56)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0000001111100100;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 56)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 10) && (y == j + 56)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 57)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000100110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 57)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 57)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 58)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000100110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 58)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 58)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 4 && x <= i + 7) && (y == j + 59)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010000100110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 59)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 59)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0100010101001011;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 60)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 60)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 61)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 61)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 62)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 62)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else if ((x >= i + 8 && x <= i + 14) && (y == j + 63)) oled_color <= (seg == compare) ? 16'b11111_111111_11111 : 16'b0011001111000110;
    else
        oled_color <= 16'b00000_000000_00000;
        
    end
endmodule
