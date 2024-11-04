`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 23:02:01
// Design Name: 
// Module Name: six_bit_lfsr
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


module four_bit_lfsr(
    input wire clk,
    input wire [3:0] seed,    // Seed input
    output reg [3:0] lfsr
);
    // Feedback polynomial x^4 + x^3 + 1
    wire feedback = lfsr[0] ^ lfsr[1];

    // Initialize the LFSR
    initial begin
        lfsr = seed;
    end

    // Update LFSR on clock edge
    always @(posedge clk) begin
        // If LFSR is zero, reload the seed
        if (lfsr == 4'b0000)
            lfsr <= seed;
        else
            lfsr <= {feedback, lfsr[3:1]};  // Right shift with feedback
    end
endmodule