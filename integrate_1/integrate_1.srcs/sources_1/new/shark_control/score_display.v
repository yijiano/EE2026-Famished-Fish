`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 02:20:13
// Design Name: 
// Module Name: score_display
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


module score_display(
    input clk,              // 100MHz clock from Basys 3
    input [13:0] reg_value, // 14-bit register input (0-16383)
    output reg [3:0] an,    // Anode signals for 4 digits
    output reg [6:0] seg    // Cathode signals for segments a-g
    );
    
    // Parameters for segment patterns (active low)
    parameter ZERO  = 7'b1000000;  // 0
    parameter ONE   = 7'b1111001;  // 1
    parameter TWO   = 7'b0100100;  // 2
    parameter THREE = 7'b0110000;  // 3
    parameter FOUR  = 7'b0011001;  // 4
    parameter FIVE  = 7'b0010010;  // 5
    parameter SIX   = 7'b0000010;  // 6
    parameter SEVEN = 7'b1111000;  // 7
    parameter EIGHT = 7'b0000000;  // 8
    parameter NINE  = 7'b0010000;  // 9

    // Binary to BCD conversion registers
    reg [3:0] thousands, hundreds, tens, ones;
    reg [16:0] refresh_counter = 0;  // Counter for display refresh
    wire [1:0] refresh_rate;         // Display multiplexing rate
    
    // Use MSBs of refresh_counter to control display multiplexing
    assign refresh_rate = refresh_counter[16:15];
    
    // Registers for value limiting
    reg [13:0] limited_value;
    
    // Binary to BCD conversion using Double Dabble algorithm
    reg [19:0] bcd;
    reg [13:0] bin;
    integer i;
    
    // First limit the value to 9999
    always @(reg_value) begin
        if (reg_value > 14'd9999)
            limited_value = 14'd9999;
        else
            limited_value = reg_value;
    end
    
    // Then convert the limited binary value to BCD
    always @(limited_value) begin
        // Initial values
        bcd = 20'd0;
        bin = limited_value;
        
        // Iterate 14 times for 14 input bits
        for (i = 0; i < 14; i = i + 1) begin
            // Check if any BCD digit is greater than 4
            if (bcd[3:0] > 4)
                bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] > 4)
                bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] > 4)
                bcd[11:8] = bcd[11:8] + 3;
            if (bcd[15:12] > 4)
                bcd[15:12] = bcd[15:12] + 3;
                
            // Shift left one bit
            bcd = {bcd[18:0], bin[13]};
            bin = {bin[12:0], 1'b0};
        end
        
        // Assign BCD digits
        thousands = bcd[15:12];
        hundreds = bcd[11:8];
        tens = bcd[7:4];
        ones = bcd[3:0];
    end
    
    // Refresh counter logic
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end
    
    // Anode and segment control for digit multiplexing
    always @(*) begin
        case(refresh_rate)
            2'b00: begin
                an = 4'b1110;  // Enable digit 0 (ones)
                case(ones)
                    4'd0: seg = ZERO;
                    4'd1: seg = ONE;
                    4'd2: seg = TWO;
                    4'd3: seg = THREE;
                    4'd4: seg = FOUR;
                    4'd5: seg = FIVE;
                    4'd6: seg = SIX;
                    4'd7: seg = SEVEN;
                    4'd8: seg = EIGHT;
                    4'd9: seg = NINE;
                    default: seg = ZERO;
                endcase
            end
            2'b01: begin
                an = 4'b1101;  // Enable digit 1 (tens)
                case(tens)
                    4'd0: seg = ZERO;
                    4'd1: seg = ONE;
                    4'd2: seg = TWO;
                    4'd3: seg = THREE;
                    4'd4: seg = FOUR;
                    4'd5: seg = FIVE;
                    4'd6: seg = SIX;
                    4'd7: seg = SEVEN;
                    4'd8: seg = EIGHT;
                    4'd9: seg = NINE;
                    default: seg = ZERO;
                endcase
            end
            2'b10: begin
                an = 4'b1011;  // Enable digit 2 (hundreds)
                case(hundreds)
                    4'd0: seg = ZERO;
                    4'd1: seg = ONE;
                    4'd2: seg = TWO;
                    4'd3: seg = THREE;
                    4'd4: seg = FOUR;
                    4'd5: seg = FIVE;
                    4'd6: seg = SIX;
                    4'd7: seg = SEVEN;
                    4'd8: seg = EIGHT;
                    4'd9: seg = NINE;
                    default: seg = ZERO;
                endcase
            end
            2'b11: begin
                an = 4'b0111;  // Enable digit 3 (thousands)
                case(thousands)
                    4'd0: seg = ZERO;
                    4'd1: seg = ONE;
                    4'd2: seg = TWO;
                    4'd3: seg = THREE;
                    4'd4: seg = FOUR;
                    4'd5: seg = FIVE;
                    4'd6: seg = SIX;
                    4'd7: seg = SEVEN;
                    4'd8: seg = EIGHT;
                    4'd9: seg = NINE;
                    default: seg = ZERO;
                endcase
            end
        endcase
    end
    
endmodule
