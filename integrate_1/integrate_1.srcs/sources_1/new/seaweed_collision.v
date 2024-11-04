`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 15:34:25
// Design Name: 
// Module Name: seaweed_collision
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


module seaweed_collision(
    input [12:0] pix_index,
    input active,
    input [11:0] x_mouse, 
    input [11:0] y_mouse,
    input clk,
    input reset,
    input major_reset,
    output reg hit = 0,
    output reg [17:0] numOfSeaweed = 18'b111111_111111_111111
);

wire [6:0] x;
wire [6:0] y;
assign x = pix_index % 96;
assign y = pix_index / 96;


wire [6:0] i = 0;
wire [5:0] j = 48;
reg [7:0] seaweed_hit = 8'b00000000; // 8-bit register for 8 seaweed hit flags
wire [15:0] seaweed_oled;

//numOfSeaweed 18 bits. 1 - seaweed exists 0 - seaweed gone 
//wire [17:0] seaweednumber;
//assign seaweednumber = numOfSeaweed;

//seaweed_control(
//    .pixel_index(pix_index),
//    .clk_6_25MHz(clk),
//    .i(0),
//    .j(47),
//    .numOfSeaweed(seaweednumber),
//    .oled_color(seaweed_oled)
//);

always @ (posedge clk) begin
    if (major_reset) begin
        hit <= 0;
        numOfSeaweed <= 18'b111111_111111_111111;
    end
    if (reset) begin
        hit <= 0;
    end
    
    if (active) begin
//         if ( ((2 * x == y - (y_mouse - 2 * x_mouse)) || (2 * x == (y_mouse + 2 * x_mouse) - y)) && (x <= x_mouse + 5 && x >= x_mouse -5 && y <= y_mouse + 5 && y >= y_mouse - 5) )
//             oled_data <= left ? 16'b01111_011111_01111 : 16'b11111_111111_11111;             
//        //Drawing the seaweeds 
//        else if (seaweed_oled != 16'b00000_000000_00000)
//            oled_data <= seaweed_oled;
//        else 
//            oled_data <= 16'b00000_000000_00000;
            
            
            
        //Seaweed shark collision logic
        
        if (y_mouse >= 48) begin
            if(x_mouse >= 1 && x_mouse <= 3 && numOfSeaweed[17]) begin
                hit <= 1;
                numOfSeaweed[17] <= 0;
            end
            else if (x_mouse >= 6 && x_mouse <= 9 && numOfSeaweed[16]) begin
                hit <= 1;
                numOfSeaweed[16] <= 0;
            end
            else if (x_mouse >= 11 && x_mouse <= 14 && numOfSeaweed[15]) begin
                hit <= 1;
                numOfSeaweed[15] <= 0;
            end
            else if (x_mouse >= 16 && x_mouse <= 18 && numOfSeaweed[14]) begin
                hit <= 1;
                numOfSeaweed[14] <= 0;
            end
            else if (x_mouse >= 22 && x_mouse <= 25 && numOfSeaweed[13]) begin
                hit <= 1;
                numOfSeaweed[13] <= 0;
            end
            else if (x_mouse >= 27 && x_mouse <= 30 && numOfSeaweed[12]) begin
                hit <= 1;
                numOfSeaweed[12] <= 0;
            end
            else if (x_mouse >= 31 && x_mouse <= 36 && numOfSeaweed[11]) begin
                hit <= 1;
                numOfSeaweed[11] <= 0;
            end
            else if (x_mouse >= 38 && x_mouse <= 40 && numOfSeaweed[10]) begin
                hit <= 1;
                numOfSeaweed[10] <= 0;
            end
            else if (x_mouse >= 43 && x_mouse <= 46 && numOfSeaweed[9]) begin
                hit <= 1;
                numOfSeaweed[9] <= 0;
            end
            else if (x_mouse >= 48 && x_mouse <= 51 && numOfSeaweed[8]) begin
                hit <= 1;
                numOfSeaweed[8] <= 0;
            end
            else if (x_mouse >= 53 && x_mouse <= 56 && numOfSeaweed[7]) begin
                hit <= 1;
                numOfSeaweed[7] <= 0;
            end
            else if (x_mouse >= 58 && x_mouse <= 60 && numOfSeaweed[6]) begin
                hit <= 1;
                numOfSeaweed[6] <= 0;
            end
            else if (x_mouse >= 64 && x_mouse <= 67 && numOfSeaweed[5]) begin
                hit <= 1;
                numOfSeaweed[5] <= 0;
            end
            else if (x_mouse >= 69 && x_mouse <= 71 && numOfSeaweed[4]) begin
                hit <= 1;
                numOfSeaweed[4] <= 0;
            end
            else if (x_mouse >= 73 && x_mouse <= 78 && numOfSeaweed[3]) begin
                hit <= 1;
                numOfSeaweed[3] <= 0;
            end
            else if (x_mouse >= 80 && x_mouse <= 82 && numOfSeaweed[2]) begin
                hit <= 1;
                numOfSeaweed[2] <= 0;
            end
            else if (x_mouse >= 85 && x_mouse <= 88 && numOfSeaweed[1]) begin
                hit <= 1;
                numOfSeaweed[1] <= 0;
            end
            else if (x_mouse >= 90 && x_mouse <= 93 && numOfSeaweed[0]) begin
                hit <= 1;
                numOfSeaweed[0] <= 0;
            end
        end
    end
end
          
endmodule
