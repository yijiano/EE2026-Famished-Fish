`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 22:23:25
// Design Name: 
// Module Name: adjustable_clock
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


module adjustable_clock(
    input basys_clock,
    input [31:0] hertz,
    output reg output_clock = 0
    );
    
    reg [31:0] count = 0;
    reg [31:0] m = 0;
    
    always @ (*) begin
        if (hertz != 0)
            m <= ((100_000_000) / (2 * hertz)) - 1;
        else
            m <= 1;
    end
    
    always @ (posedge basys_clock) 
    begin
        count <= (count == m) ? 0 : count + 1;
        output_clock <= (count == 0) ? ~output_clock : output_clock;
    end
    
endmodule

module random_number(
    input clk,         
    input stop,         
    input reset,
    output reg [4:0] random_out 
);
    reg [4:0] random_reg = 5'b00001;
    wire feedback;
    reg done = 0;

    assign feedback = random_reg[4] ^ random_reg[2]; 

    always @(posedge clk or posedge stop) begin
        if (done && reset) begin
           done <= 0;
        end 
        if (stop) begin
           done <= 1;
        end else if (!done) begin
            random_reg <= {random_reg[3:0], feedback}; 
        end
    end
    
    always @(*) begin
        if (random_reg > 23)
            random_out = 23;
        else
            random_out = random_reg;
    end
endmodule





module shuffle (
    input done,
    input [4:0] randnum,
    input clk, 
    output reg [6:0] seg,
    output [3:0] an,
    output dp
);


    reg [1:0] numbers [0:3];
    
    
    always @(*) begin
        case (randnum)
            5'd0: begin
                numbers[0] = 2'b00; numbers[1] = 2'b01; numbers[2] = 2'b10; numbers[3] = 2'b11;  // Permutation 1: 0123
            end
            5'd1: begin
                numbers[0] = 2'b00; numbers[1] = 2'b01; numbers[2] = 2'b11; numbers[3] = 2'b10;  // Permutation 2: 0132
            end
            5'd2: begin
                numbers[0] = 2'b00; numbers[1] = 2'b10; numbers[2] = 2'b01; numbers[3] = 2'b11;  // Permutation 3: 0213
            end
            5'd3: begin
                numbers[0] = 2'b00; numbers[1] = 2'b10; numbers[2] = 2'b11; numbers[3] = 2'b01;  // Permutation 4: 0231
            end
            5'd4: begin
                numbers[0] = 2'b00; numbers[1] = 2'b11; numbers[2] = 2'b01; numbers[3] = 2'b10;  // Permutation 5: 0312
            end
            5'd5: begin
                numbers[0] = 2'b00; numbers[1] = 2'b11; numbers[2] = 2'b10; numbers[3] = 2'b01;  // Permutation 6: 0321
            end
            5'd6: begin
                numbers[0] = 2'b01; numbers[1] = 2'b00; numbers[2] = 2'b10; numbers[3] = 2'b11;  // Permutation 7: 1023
            end
            5'd7: begin
                numbers[0] = 2'b01; numbers[1] = 2'b00; numbers[2] = 2'b11; numbers[3] = 2'b10;  // Permutation 8: 1032
            end
            5'd8: begin
                numbers[0] = 2'b01; numbers[1] = 2'b10; numbers[2] = 2'b00; numbers[3] = 2'b11;  // Permutation 9: 1203
            end
            5'd9: begin
                numbers[0] = 2'b01; numbers[1] = 2'b10; numbers[2] = 2'b11; numbers[3] = 2'b00;  // Permutation 10: 1230
            end
            5'd10: begin
                numbers[0] = 2'b01; numbers[1] = 2'b11; numbers[2] = 2'b00; numbers[3] = 2'b10;  // Permutation 11: 1302
            end
            5'd11: begin
                numbers[0] = 2'b01; numbers[1] = 2'b11; numbers[2] = 2'b10; numbers[3] = 2'b00;  // Permutation 12: 1320
            end
            5'd12: begin
                numbers[0] = 2'b10; numbers[1] = 2'b00; numbers[2] = 2'b01; numbers[3] = 2'b11;  // Permutation 13: 2013
            end
            5'd13: begin
                numbers[0] = 2'b10; numbers[1] = 2'b00; numbers[2] = 2'b11; numbers[3] = 2'b01;  // Permutation 14: 2031
            end
            5'd14: begin
                numbers[0] = 2'b10; numbers[1] = 2'b01; numbers[2] = 2'b00; numbers[3] = 2'b11;  // Permutation 15: 2103
            end
            5'd15: begin
                numbers[0] = 2'b10; numbers[1] = 2'b01; numbers[2] = 2'b11; numbers[3] = 2'b00;  // Permutation 16: 2130
            end
            5'd16: begin
                numbers[0] = 2'b10; numbers[1] = 2'b11; numbers[2] = 2'b00; numbers[3] = 2'b01;  // Permutation 17: 2301
            end
            5'd17: begin
                numbers[0] = 2'b10; numbers[1] = 2'b11; numbers[2] = 2'b01; numbers[3] = 2'b00;  // Permutation 18: 2310
            end
            5'd18: begin
                numbers[0] = 2'b11; numbers[1] = 2'b00; numbers[2] = 2'b01; numbers[3] = 2'b10;  // Permutation 19: 3012
            end
            5'd19: begin
                numbers[0] = 2'b11; numbers[1] = 2'b00; numbers[2] = 2'b10; numbers[3] = 2'b01;  // Permutation 20: 3021
            end
            5'd20: begin
                numbers[0] = 2'b11; numbers[1] = 2'b01; numbers[2] = 2'b00; numbers[3] = 2'b10;  // Permutation 21: 3102
            end
            5'd21: begin
                numbers[0] = 2'b11; numbers[1] = 2'b01; numbers[2] = 2'b10; numbers[3] = 2'b00;  // Permutation 22: 3120
            end
            5'd22: begin
                numbers[0] = 2'b11; numbers[1] = 2'b10; numbers[2] = 2'b00; numbers[3] = 2'b01;  // Permutation 23: 3201
            end
            5'd23: begin
                numbers[0] = 2'b11; numbers[1] = 2'b10; numbers[2] = 2'b01; numbers[3] = 2'b00;  // Permutation 24: 3210
            end
            default: begin
                numbers[0] = 2'b00; numbers[1] = 2'b00; numbers[2] = 2'b00; numbers[3] = 2'b00;  // Default case 
            end
        endcase
    end
    
    reg [2:0] index = 0;
    reg [2:0] number = 7;                                                 
    
    assign an = 4'b1110;
    assign dp = 1;
    
    always @ (*) begin
        case(number) 
            2'd0: seg <= 7'b1001110;
            2'd1: seg <= 7'b1000010;
            2'd2: seg <= 7'b0000011;
            2'd3: seg <= 7'b0010001;
            default: seg <= 7'b1111111; //debug purposes
        endcase
    end
    
    wire c1hz; 
    reg done_prev;
    adjustable_clock clock_1hz (.hertz(1),.basys_clock(clk),.output_clock(c1hz));
    
    
    always @(posedge clk) begin
        done_prev <= done;  // Update 'done_prev' on every clock edge
    end
    
    always @ (posedge clk) begin 
        if (done && !done_prev) begin
            index <= 0;  // Reset 'index' to 0 when 'done' becomes true
        end else if (done) begin
            if (index == 7) 
                index <= 0;
            else if (index > 3 && index <= 6) begin
                number <= 7;
                index <= index + 1;
            end else begin
                number <= numbers[index];
                index <= index + 1;
            end
        end else 
            number <= 7;
    end


    
endmodule
