`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 15:11:53
// Design Name: 
// Module Name: seaweed_strand_mouse
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


module seaweed_strand_mouse(output reg hover = 0, input [11:0] x_mouse, input [11:0] y_mouse, input clk, input [7:0] i, input [5:0] j);
    
    always @ (posedge clk) begin
    
    if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 0)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 0)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 1)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 1)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 2)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 2)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 3)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 3)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 4)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 4)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 5)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 5)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 6)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 6)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 7)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 7)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 8)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 8)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 9)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 9)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 10)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 10)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 11)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 11)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 11)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 11)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 12)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 12)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 12)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 12)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 13)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 13)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 13)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 13)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 14)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 14)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 14)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 14)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 15)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 15)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 15)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 15)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 16)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 16)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 16)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 16)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 17)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 17)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 17)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 17)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 18)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 18)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 18)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 18)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 19)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 19)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 19)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 19)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 20)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 20)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 20)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 20)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 21)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 21)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 21)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 22)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 22)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 22)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 23)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 23)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 23)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 24)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 24)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 24)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 25)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 25)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 25)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 26)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 26)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 26)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 27)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 27)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 27)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 28)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 28)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 28)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 28)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 29)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 29)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 29)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 29)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 30)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 30)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 30)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 30)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 31)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 31)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 31)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 31)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 32)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 32)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 32)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 32)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 33)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 33)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 33)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 33)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 34)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 34)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 34)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 34)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 35)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 35)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 35)) hover <= 1;
    else if ((x_mouse >= i + 11 && x_mouse <= i + 14) && (y_mouse == j + 35)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 36)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 36)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 37)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 37)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 38)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 14) && (y_mouse == j + 38)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 39)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 39)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 39)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 39)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 40)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 40)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 40)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 40)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 41)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 41)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 41)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 41)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 42)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 42)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 42)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 42)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 43)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 43)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 43)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 43)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 44)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 44)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 44)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 44)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 45)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 45)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 45)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 45)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 46)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 46)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 46)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 46)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 47)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 47)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 47)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 47)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 48)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 48)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 48)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 48)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 49)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 49)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 49)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 49)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 50)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 50)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 50)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 50)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 51)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 51)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 51)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 51)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 3) && (y_mouse == j + 52)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 52)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 52)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 52)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 53)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 53)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 53)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 54)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 54)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 54)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 55)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 55)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 55)) hover <= 1;
    else if ((x_mouse >= i + 0 && x_mouse <= i + 7) && (y_mouse == j + 56)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 56)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 10) && (y_mouse == j + 56)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 57)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 57)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 57)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 58)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 58)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 58)) hover <= 1;
    else if ((x_mouse >= i + 4 && x_mouse <= i + 7) && (y_mouse == j + 59)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 59)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 59)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 60)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 60)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 61)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 61)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 62)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 62)) hover <= 1;
    else if ((x_mouse >= i + 8 && x_mouse <= i + 14) && (y_mouse == j + 63)) hover <= 1;
    else
        hover <= 0;
        
    end
endmodule
