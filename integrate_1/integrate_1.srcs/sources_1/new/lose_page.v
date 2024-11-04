`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 11:30:55
// Design Name: 
// Module Name: top_student
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


module lose_page(
    input clk, //6.25mhz input
    input btnU, btnC, btnD,
    input [12:0] pixel_index,
    input reset,
    input active,
    output reg restart,
    output reg exit,
   // input if_lose,
   // output reg restart,
    //output reg exit,
    output reg [15:0] oled_colour
    );
    
    wire my_6_25mhz_clock;
    
    //can split into another module
    reg active_box;
    reg [15:0] image_data [0:6143]; // 96 * 64 = 6144 pixels
    wire [6:0] x;
    wire [5:0] y;
    
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
    
    always @(posedge clk /*or posedge 0*/) begin
        if (reset) begin
            active_box <= 0; // Start with the top box selected
            exit <= 0;
            restart <= 0;
        end else if (active) begin
            // Navigation control for boxes
            if (btnU) begin
                active_box <= 0; // Select top box
            end else if (btnD) begin
                active_box <= 1; // Select bottom box
            end
            
            // Confirm action with btnC
            if (btnC) begin
                if (active_box == 0) begin
                    restart <= 1; // Restart action for top box
                    exit <= 0;
                end else begin
                    restart <= 0;
                    exit <= 1;    // Exit action for bottom box
                end
            end else begin
                restart <= 0; // Reset outputs after the action
                exit <= 0;
            end
        end
    end
    

    
   wire [15:0] lose_oled_color;
    
   lose lsoe_inst (.clka(clk), .addra(pixel_index), .douta(lose_oled_color));
    
    always @ (*) begin 
    oled_colour = lose_oled_color; // image_data[pixel_index] != 16'h0000 ? image_data[pixel_index] : 16'h0000;

    // Bounding box and color logic for "Shark" option
    if ((x >= 34 && x <= 61 && y == 33) || (x >= 34 && x <= 61 && y == 43) || (x == 34 && y >= 33 && y <= 43) || (x == 61 && y >= 33 && y <= 43)) begin
        if (active_box == 0) begin
            // Cursor is on Shark
            oled_colour = restart ? 16'h07E0 : 16'hF800; // Green if selected, red if not
        end else begin
            oled_colour = restart ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
        end
    end

    // Bounding box and color logic for "Hammer" option
    else if ((x >= 34 && x <= 61 && y == 46) || (x >= 34 && x <= 61 && y == 56) || (x == 34 && y >= 46 && y <= 56) || (x == 61 && y >= 46 && y <= 56)) begin
        if (active_box) begin
            // Cursor is on Hammer
            oled_colour = exit ? 16'h07E0 : 16'hF800; // Green if selected, red if not
        end else begin
            oled_colour = exit ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
        end
    end


    
    
    end 
    
    
endmodule
