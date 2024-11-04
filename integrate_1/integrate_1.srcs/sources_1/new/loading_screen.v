`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 11:19:00
// Design Name: 
// Module Name: loading_screen
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

    
    module loading_screen(
    input clk,                   
    input reset,                 
    input start_loading,        
    input [15:0] pixel_index,    // OLED pixel index
    output reg [15:0] oled_colour, // Output color for the OLED pixel
    output reg loading_complete  // Signal indicating when loading is complete
);

  
    wire [6:0] x;
    wire [5:0] y;

    
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;

    reg [3:0] loading_state;
    reg [31:0] counter;
    reg [1:0] image_counter;

    localparam BLACK = 16'b00000_000000_00000;  

    reg [15:0] oled_data [0:6143]; // 6144 pixels total (96 * 64)
    integer i;
    
    // Initialize the text data for the display
    initial begin
    
        for (i = 0; i < 6144; i = i + 1) begin
            oled_data[i] = BLACK;
        end
    end

    reg [21:0] frame_counter = 0;  // Frame counter (22 bits to count up to 3,125,000)
    parameter some_threshold = 3125000; // Threshold for 0.5 seconds at 6.25 MHz clock

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            frame_counter <= 0;
            image_counter <= 2'b00;
        end else begin
            // Increment the frame counter
            if (frame_counter < some_threshold) begin
                frame_counter <= frame_counter + 1;
            end else begin
                frame_counter <= 0;  // Reset frame counter when threshold is reached
                image_counter <= image_counter + 1; // Move to the next image

                if (image_counter == 2'b01) begin
                    image_counter <= 2'b10;  // Loop back after two images
                end
                else if (image_counter == 2'b10) begin
                    image_counter <= 2'b11; 
                end
                
                else if (image_counter == 2'b11) begin
                    image_counter <= 2'b00;
                end 
            end
        end
    end
    
    reg [15:0] bg_oled_colour;
    wire [15:0] load1_oled_color;
    wire [15:0] load2_oled_color;
    wire [15:0] load3_oled_color;
    wire [15:0] load4_oled_color;
    
    load1 load1_inst (.clka(clk), .addra(pixel_index), .douta(load1_oled_color));
    load2 load2_inst (.clka(clk), .addra(pixel_index), .douta(load2_oled_color));
    load3 load3_inst (.clka(clk), .addra(pixel_index), .douta(load3_oled_color));
    load4 load4_inst (.clka(clk), .addra(pixel_index), .douta(load4_oled_color));
    
    always @(posedge clk) begin
        case(image_counter)
            2'b00: begin
                bg_oled_colour <= load1_oled_color;
            end
            
            2'b01: begin
                bg_oled_colour <= load2_oled_color; 
            end
            
            2'b10: begin 
                bg_oled_colour <= load3_oled_color;
            end
            
            2'b11: begin 
                bg_oled_colour <= load4_oled_color;
            end
        endcase
    end
        
        
        
        
    // Loading state machine
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            loading_state <= 0;
            counter <= 0;
            loading_complete <= 0;
        end else if (start_loading) begin
            counter <= counter + 1;
            if (counter == 500000) begin  
                loading_state <= loading_state + 1;
                counter <= 0;
            end
            if (loading_state == 5) begin  
                loading_complete <= 1;
            end
        end
    end

        
        
        always @(*) begin
            oled_colour = 16'h0000;  // Default to black
            
            // Check if we are within the loading bar vertical range
            if (y >= 55 && y <= 60) begin
                // Show the green part of the loading bar depending on loading_state
                case (loading_state)
                    0: oled_colour = bg_oled_colour;  // Stage 0: No loading bar, show original background
                    1: if (x >= 40 && x <= 55) oled_colour = 16'h07E0;  // Stage 1
                        else oled_colour <= bg_oled_colour; // Show original background
                    2: if (x >= 30 && x <= 65) oled_colour = 16'h07E0;  // Stage 2
                        else oled_colour <= bg_oled_colour; 
                    3: if (x >= 20 && x <= 75) oled_colour = 16'h07E0;  // Stage 3
                        else oled_colour <= bg_oled_colour; 
                    4: if (x >= 10 && x <= 85) oled_colour = 16'h07E0;  // Full bar
                        else oled_colour <= bg_oled_colour;
                endcase
            end
            else begin
                oled_colour <= bg_oled_colour;
            end
        end
 
    endmodule
