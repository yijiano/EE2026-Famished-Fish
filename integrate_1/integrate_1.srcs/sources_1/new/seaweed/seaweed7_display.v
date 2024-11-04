`timescale 1ns / 1ps

module seaweed7_display(input [12:0] pixel_index, input clk_6_25MHz, input [6:0] i, input [5:0] j, output reg[15:0] oled_color = 16'b10000_000000_00000);
        // Initialization
    wire [6:0] x; 
    wire [5:0] y; 
    assign x = pixel_index % 96; 
    assign y = pixel_index / 96; 
    always@(posedge clk_6_25MHz) begin
        if ((x >= i + 34 && x <= i + 34) && (y == j + 3)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 3)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 4)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 4)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 34) && (y == j + 5)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 34) && (y == j + 5)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 31 && x <= i + 31) && (y == j + 6)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 32) && (y == j + 6)) oled_color <= 16'b0110110011101000;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 6)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 6)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 31 && x <= i + 31) && (y == j + 7)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 32) && (y == j + 7)) oled_color <= 16'b0101110011101000;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 7)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 34) && (y == j + 7)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 33) && (y == j + 8)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 33) && (y == j + 8)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 32 && x <= i + 32) && (y == j + 9)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 9)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 9)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 32 && x <= i + 32) && (y == j + 10)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 10)) oled_color <= 16'b0111010011101000;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 10)) oled_color <= 16'b0101010011101000;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 10)) oled_color <= 16'b0101010011101000;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 11)) oled_color <= 16'b0100010001000111;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 36) && (y == j + 12)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 36) && (y == j + 12)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 13)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 13)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 14)) oled_color <= 16'b0011010000000110;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 14)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 14)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 15)) oled_color <= 16'b0011010000000110;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 15)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 36) && (y == j + 15)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 16)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 16)) oled_color <= 16'b0100110010000111;
        else if ((x >= i + 35 && x <= i + 35) && (y == j + 16)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 35 && x <= i + 35) && (y == j + 16)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 33 && x <= i + 33) && (y == j + 17)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 34 && x <= i + 34) && (y == j + 17)) oled_color <= 16'b0011001111000110;
        else oled_color = 16'b1000_0000_0000_0000;
    end
endmodule