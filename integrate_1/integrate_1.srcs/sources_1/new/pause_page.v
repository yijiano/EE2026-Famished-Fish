`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 10:50:24
// Design Name: 
// Module Name: pause_page
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


//can make it such that assign oled_colour = btnR ? : 



 /*  In parent module  
 always @(posedge clk) begin
        case (game_state)
            0: begin
                if (btnR) game_state <= 1;  // Switch to pause on right button
            end
            1: begin
                if (btnL) game_state <= 0;  // Return to game on left button
            end
        endcase
    end 
    
    assign JB = (game_state == 1) ? oled_colour : 8'h00; // Use pause output only in pause state
    
    
    
    
    
        always @(posedge basys_clk) begin
        if (btnR) begin
            game_paused <= 1; // Pause game when right button is pressed
        end
        else if (resume) begin
            game_paused <= 0; // Resume game when "Resume" option is selected
        end
        else if (restart) begin
            // Reset game logic, depending on your reset conditions
            game_paused <= 0; // Restart also returns to the game
        end
        else if (exit) begin
            // Handle exit logic, depending on what you want exit to do
            game_paused <= 0; // Example: exit could lead back to main screen
        end
    end
    */
    
    
module pause_page(
    input clk,
    input btnU, btnC, btnD, 
    input [12:0] pixel_index,
    input reset,
    input active,
    output reg [15:0] oled_colour,
    output reg restart = 0,
    output reg exit = 0,
    output reg resume = 0
    );
    
    reg [1:0] active_box; // 2-bit value to track three states: 00 = resume, 01 = restart, 10 = exit
    reg state;

    // Placeholder for x and y coordinates based on pixel_index
    wire [6:0] x = pixel_index % 96;
    wire [5:0] y = pixel_index / 96;

    reg [3:0] btnU_count, btnD_count, btnC_count;
    wire btnU_debounced, btnD_debounced, btnC_debounced;
    parameter DEBOUNCE_THRESHOLD = 4'd10; //Count to ensure that anything below this value will not change
    
    // Debounce 
    always @(posedge clk) begin

        if (btnU) begin
            btnU_count <= (btnU_count < DEBOUNCE_THRESHOLD) ? btnU_count + 1 : btnU_count;
        end else begin
            btnU_count <= 0;
        end
    

        if (btnD) begin
            btnD_count <= (btnD_count < DEBOUNCE_THRESHOLD) ? btnD_count + 1 : btnD_count;
        end else begin
            btnD_count <= 0;
        end
    
  
        if (btnC) begin
            btnC_count <= (btnC_count < DEBOUNCE_THRESHOLD) ? btnC_count + 1 : btnC_count;
        end else begin
            btnC_count <= 0;
        end
    end
    
    // Generate debounced signals
    assign btnU_debounced = (btnU_count == DEBOUNCE_THRESHOLD);
    assign btnD_debounced = (btnD_count == DEBOUNCE_THRESHOLD);
    assign btnC_debounced = (btnC_count == DEBOUNCE_THRESHOLD);
    
    // Edge detection
    reg btnU_debounced_prev, btnD_debounced_prev, btnC_debounced_prev;
    wire btnU_edge, btnD_edge, btnC_edge;
    
    always @(posedge clk) begin
        btnU_debounced_prev <= btnU_debounced;
        btnD_debounced_prev <= btnD_debounced;
        btnC_debounced_prev <= btnC_debounced;
    end
    
    assign btnU_edge = btnU_debounced && !btnU_debounced_prev;
    assign btnD_edge = btnD_debounced && !btnD_debounced_prev;
    assign btnC_edge = btnC_debounced && !btnC_debounced_prev;
    


    always @(posedge clk) begin
        if (reset) begin
            active_box <= 0;
            resume <= 0;
            restart <= 0;
            exit <= 0;
        end else if (active) begin
    
            // Navigation control for boxes
            if (btnU_edge) begin
                // Move up, wrapping around from 0 to 2
                active_box <= (active_box == 0) ? 2 : active_box - 1;
            end else if (btnD_edge) begin
                // Move down, wrapping around from 2 to 0
                active_box <= (active_box == 2) ? 0 : active_box + 1;
            end
            
            // Confirm action with btnC
            if (btnC) begin
                case (active_box)
                    2'b00: begin
                        resume <= 1; // Action for resume
                        restart <= 0;
                        exit <= 0;
                    end
                    2'b01: begin
                        resume <= 0;
                        restart <= 1; // Action for restart
                        exit <= 0;
                    end
                    2'b10: begin
                        resume <= 0;
                        restart <= 0;
                        exit <= 1;    // Action for exit
                    end
                endcase
                end else begin
                // Reset all outputs when btnC is not pressed
                resume <= 0;
                restart <= 0;
                exit <= 0;
            end
            
        end
    end
    
    wire [15:0] pause_screen_oled;
    
    pause pause_inst (.clka(clk),.addra(pixel_index),.douta(pause_screen_oled));
    
    

        
    always @ (*) begin 
     // Set default color based on image data, fallback to black
    //oled_colour = image_data_fin[pixel_index] != 16'h0000 ? image_data_fin[pixel_index] : 16'h0000;

    // Bounding box and color logic for "Resume" option (topmost box)
    if ((x >= 33 && x <= 66 && y == 20) || (x >= 33 && x <= 66 && y == 30) || (x == 33 && y >= 20 && y <= 30) || (x == 66 && y >= 20 && y <= 30)) begin
        if (active_box == 2'b00) begin
            // Cursor is on Resume
            oled_colour = resume ? 16'h07E0 : 16'hF800; // Green if selected, red if not
        end else begin
            oled_colour = resume ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
        end
    end

    // Bounding box and color logic for "Shark" option
    else if ((x >= 36 && x <= 63 && y == 33) || (x >= 36 && x <= 63 && y == 43) || (x == 36 && y >= 33 && y <= 43) || (x == 63 && y >= 33 && y <= 43)) begin
        if (active_box == 2'b01) begin
            // Cursor is on Shark
            oled_colour = restart ? 16'h07E0 : 16'hF800; // Green if selected, red if not
        end else begin
            oled_colour = restart ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
        end
    end

    // Bounding box and color logic for "Hammer" option
    else if ((x >= 36 && x <= 63 && y == 46) || (x >= 36 && x <= 63 && y == 56) || (x == 36 && y >= 46 && y <= 56) || (x == 63 && y >= 46 && y <= 56)) begin
        if (active_box == 2'b10) begin
            // Cursor is on Hammer
            oled_colour = exit ? 16'h07E0 : 16'hF800; // Green if selected, red if not
        end else begin
            oled_colour = exit ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
        end
    end
    
    else oled_colour <= pause_screen_oled;
    
    end 
    
endmodule 