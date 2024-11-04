`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 14:05:17
// Design Name: 
// Module Name: bg_control
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


module bg_control(
    input [12:0] pixel_index,
    input clk_6_25MHz,
    input [1:0] bg_state,
    output reg [15:0] oled_color = 16'b10000_000000_00000
);

    wire [15:0] bg1_oled_color;
    wire [15:0] bg2_oled_color;
    wire [15:0] bg3_oled_color;

    // Instantiate background modules
    bg1st bg11_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg1_oled_color));
    bg2nd bg22_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg2_oled_color));
    bg3rd bg33_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg3_oled_color));
    
    always @(posedge clk_6_25MHz) begin
        // Background state machine with transition handling
        case(bg_state)
            0: oled_color <= bg1_oled_color;
            1: oled_color <= bg2_oled_color;
            2: oled_color <= bg3_oled_color;
        endcase
    end
endmodule
