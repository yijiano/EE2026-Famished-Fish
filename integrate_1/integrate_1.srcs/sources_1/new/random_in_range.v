`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 14:07:55
// Design Name: 
// Module Name: random_in_range
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


module random_in_range (
    input clk,
    output reg [22:0] random_value
);
    reg [7:0] lfsr; // Small LFSR for random selection

    
    // Select one of the three values based on LFSR output
    always @(posedge clk) begin
        lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5]};
        case (lfsr % 3)
            0: random_value <= 23'd4000000;
            1: random_value <= 23'd2000000;
            2: random_value <= 23'd6000000;
        endcase
    end
endmodule