`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 14:19:43
// Design Name: 
// Module Name: bubble_display
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


module bubble_display(
    input [12:0] pixel_index,
    input clk_6_25MHz,
    input [6:0] i, input [5:0] input_j, 
    output reg [15:0] oled_color = 16'b00000_000000_00000
    );
    
    // Initialization
    wire [6:0] x; 
    wire [5:0] y; 
    assign x = pixel_index % 96; 
    assign y = pixel_index / 96; 
    reg [31:0] clk_divider = 0;
    reg [3:0] state;
    reg [5:0] j; 
    
    initial begin
        state <= 0;
        j <= input_j;
    end
   
    always@(posedge clk_6_25MHz) begin
        case(state)
            0: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 1;
                    j <= j - 3;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011111111111;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else oled_color = 16'b10000_000000_00000;
                        
                    clk_divider <= clk_divider + 1;
                end
            end
            
            1: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 2;
                    j <= j - 6;
                end
                else begin
                    if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b1111011110111110;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b1111011110111110;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011110111110;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011110111110;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 2)) oled_color = 16'b1011011111111111;
                    else oled_color = 16'b10000_000000_00000;
                        
                    clk_divider <= clk_divider + 1;
                end
            end  
            
            2: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 3;
                    j <= j - 8;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1111011110111110;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 2)) oled_color = 16'b1011011111111111;
                    else oled_color = 16'b10000_000000_00000;
                    
                    clk_divider <= clk_divider + 1;
                end
            end  
            
            3: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 4;
                    j <= j - 11;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 0)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 2)) oled_color = 16'b1111011101111101;
                    else oled_color = 16'b10000_000000_00000;
                    
                    clk_divider <= clk_divider + 1;
                end
            end
            
            4: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 5;
                    j <= j - 10;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 1)) oled_color = 16'b1011011111111111;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 1)) oled_color = 16'b1011011111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 2)) oled_color = 16'b1111011101111101;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 2)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 2)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 3)) oled_color = 16'b1111011101111101;
                    else oled_color = 16'b10000_000000_00000;
                    
                    clk_divider <= clk_divider + 1;
                end
            end
            
            5: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 6;
                    j <= j - 13;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 3 && x <= i + 4) && (y == j + 0)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 3 && x <= i + 4) && (y == j + 0)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 4 && x <= i + 4) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 1)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 1)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 2)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 2)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 2)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 3)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 4 && x <= i + 4) && (y == j + 3)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 4 && x <= i + 4) && (y == j + 3)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 4)) oled_color = 16'b1010010100010100;
                    else oled_color = 16'b10000_000000_00000;
                    
                    clk_divider <= clk_divider + 1;
                end
            end
            
            6: begin
                if (clk_divider == 3_125_000) begin
                    clk_divider <= 0;
                    state <= 0;
                    j <= input_j;
                end
                else begin
                    if ((x >= i + 1 && x <= i + 1) && (y == j + 0)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 3 && x <= i + 3) && (y == j + 0)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 4 && x <= i + 5) && (y == j + 0)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 0)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 0)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 1)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 3 && x <= i + 5) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 3 && x <= i + 5) && (y == j + 1)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 4 && x <= i + 4) && (y == j + 2)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 2)) oled_color = 16'b0110111111111111;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 2)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 2)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 2)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 0 && x <= i + 0) && (y == j + 4)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 4)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 6 && x <= i + 6) && (y == j + 4)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 1 && x <= i + 1) && (y == j + 5)) oled_color = 16'b1010010100010100;
                    else if ((x >= i + 2 && x <= i + 2) && (y == j + 5)) oled_color = 16'b1111111111111111;
                    else if ((x >= i + 5 && x <= i + 5) && (y == j + 5)) oled_color = 16'b1010010100010100;
                    else oled_color = 16'b10000_000000_00000;
                                    
                    clk_divider <= clk_divider + 1;
                end
            end
        endcase
    end
endmodule

