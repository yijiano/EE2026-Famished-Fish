`timescale 1ns / 1ps

module seaweed5_display(input [12:0] pixel_index, input clk_6_25MHz, input [6:0] i, input [5:0] j, output reg[15:0] oled_color = 16'b10000_000000_00000);
        // Initialization
    wire [6:0] x; 
    wire [5:0] y; 
    assign x = pixel_index % 96; 
    assign y = pixel_index / 96; 
    always@(posedge clk_6_25MHz) begin
        if ((x >= i + 22 && x <= i + 22) && (y == j + 0)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 0)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 1)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 1)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 2)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 2)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 3)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 3)) oled_color <= 16'b0100110010000111;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 3)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 3)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 4)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 4)) oled_color <= 16'b0110110011101000;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 4)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 4)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 5)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 5)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 5)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 5)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 6)) oled_color <= 16'b0011110001000111;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 6)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 6)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 7)) oled_color <= 16'b0100110011101000;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 7)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 7)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 8)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 8)) oled_color <= 16'b0011110001000111;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 8)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 8)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 9)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 9)) oled_color <= 16'b0011110001000111;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 9)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 25 && x <= i + 25) && (y == j + 9)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 25) && (y == j + 10)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 25) && (y == j + 10)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 11)) oled_color <= 16'b0100110011101000;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 11)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 12)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 12)) oled_color <= 16'b0100110011101000;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 12)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 12)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 13)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 13)) oled_color <= 16'b0100110011101000;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 13)) oled_color <= 16'b0011001111000110;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 13)) oled_color <= 16'b0011001111000110;
        else if ((x >= i + 22 && x <= i + 22) && (y == j + 14)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 14)) oled_color <= 16'b0011110001000111;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 14)) oled_color <= 16'b0100010000000110;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 14)) oled_color <= 16'b0100010000000110;
        else if ((x >= i + 22 && x <= i + 23) && (y == j + 15)) oled_color <= 16'b0000001111100100;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 15)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 24 && x <= i + 24) && (y == j + 15)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 23 && x <= i + 23) && (y == j + 16)) oled_color <= 16'b0100010000100110;
        else if ((x >= i + 24 && x <= i + 25) && (y == j + 16)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 24 && x <= i + 25) && (y == j + 16)) oled_color <= 16'b0100010101001011;
        else if ((x >= i + 24 && x <= i + 25) && (y == j + 17)) oled_color <= 16'b0011001111000110;
        else oled_color = 16'b1000_0000_0000_0000;
    end
endmodule