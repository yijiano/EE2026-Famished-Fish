`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 22:43:57
// Design Name: 
// Module Name: health_led
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

module health_led(
    input wire clk,    
    input nitro,              // 1 if nitro is on
    input wire main_reset,    // Main reset signal
    input wire main_active, 
    input wire y_pixel,       // Y-coordinate to vary countdown speed
    input wire select_start,  // Reset signal
    input wire shark_eat_trigger, // Signal when a fish is consumed
    output reg lose = 0,      // Indicates game over
    output reg [15:0] led     // LED output
);

    reg [4:0] led_index = 0;  
    reg [26:0] counter = 0; 
    reg shark_eat_trigger_prev = 0; // For detecting rising edge

    wire blink_clk;
    clock_module blink_clk_module(
        .clk(clk),
        .f_out(5),
        .out(blink_clk));
    

    always @(posedge clk) begin
        // Reset logic
        if (main_reset) begin //if game not active, dont run 
            led <= 16'b1111111111111111; // All LEDs on initially
            led_index <= 0;
            lose <= 0;
            counter <= 0;
        end 
        
        else if (main_active) begin

        
            counter <= counter + 1;
     end
        
        
        if (select_start || !lose) begin 
            // Increment logic for led_index based on y_pixel and counter
            if (y_pixel > 42 && ((!nitro && counter >= 150_000_000) || (nitro && counter >= 100_000_000))) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1;
            end else if (y_pixel > 27 && y_pixel <= 42 && ((!nitro && counter >= 88_888_888) || (nitro && counter >= 66_666_666))) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1;
            end else if (y_pixel <= 27 && ((!nitro && counter >= 44_444_444) || (nitro && counter >= 33_333_333))) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1;
            end
            
            // Detect rising edge of shark_eat_trigger
            if (shark_eat_trigger && !shark_eat_trigger_prev && led_index > 0) begin
                led_index <= led_index - 1; // Decrease led_index by one for each fish consumed
            end

            // Update previous shark_eat_trigger state
            shark_eat_trigger_prev <= shark_eat_trigger;

            // Update LED states based on led_index
            if (!lose) begin
                case (led_index)
                    4'd0: led <= 16'b1111111111111111; // All LEDs on
                    4'd1: led <= 16'b0111111111111111;
                    4'd2: led <= 16'b0011111111111111;
                    4'd3: led <= 16'b0001111111111111;
                    4'd4: led <= 16'b0000111111111111;
                    4'd5: led <= 16'b0000011111111111;
                    4'd6: led <= 16'b0000001111111111;
                    4'd7: led <= 16'b0000000111111111;
                    4'd8: led <= 16'b0000000011111111;
                    4'd9: led <= blink_clk ? 16'b0000000001111111 : 16'b0000000000000000;
                    4'd10: led <= blink_clk ? 16'b0000000000111111 : 16'b0000000000000000;
                    4'd11: led <= blink_clk ? 16'b0000000000011111 : 16'b0000000000000000;
                    4'd12: led <= blink_clk ? 16'b0000000000001111 : 16'b0000000000000000;
                    4'd13: led <= blink_clk ? 16'b0000000000000111 : 16'b0000000000000000;
                    4'd14: led <= blink_clk ? 16'b0000000000000011 : 16'b0000000000000000;
                    4'd15: led <= blink_clk ? 16'b0000000000000001 : 16'b0000000000000000;
                    default: begin
                        led <= 16'b0000000000000000; // All LEDs off
                        lose <= 1;                  // Game over
                    end
                endcase
            end
            
        end
    end 
    

endmodule 


/*
module health_led(
    input wire clk,    
    input wire y_pixel, //take from top student c, shark_j
    input wire select_start,
  //  input wire sw15, // Reset signal, put 0 first 
 //   input wire btnU, 
    input wire shark_eat, // To indicate fish consumed //shark eat trigger in top student c
    output reg lose = 0, //indicate that game has lost 
    
//    input wire btnD, // To indicate poisonous fish eaten
    output reg [15:0] led        
);


   // reg lose; 
    reg [4:0] led_index;  
    reg [26:0] counter; 

    always @(posedge clk) begin
        // Reset logic
        if (0) begin
            led <= 16'b1111111111111111; // All LEDs on initially
            led_index <= 0;
            counter <= 0;
            lose <= 0;
        end else begin
            counter <= counter + 1;

            // Increment logic for the led_index based on y_pixel and counter
            if (y_pixel > 42 && counter >= 150_000_000) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1; // Prevent overflow
                
            end else if (y_pixel > 27 && y_pixel <= 42 && counter >= 100_000_000) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1; 
                
            end else if (y_pixel <= 27 && counter >= 75_000_000) begin
                counter <= 0;
                if (led_index < 16) led_index <= led_index + 1; 
            end
            
// Update LED states based on led_index using a case statement
if (!lose && select_start) begin 
    case (led_index)
        4'd0: led <= 16'b1111111111111111; // All LEDs on
        4'd1: led <= 16'b0111111111111111; // Turn off LED 0
        4'd2: led <= 16'b0011111111111111; // Turn off LED 1
        4'd3: led <= 16'b0001111111111111; // Turn off LED 2
        4'd4: led <= 16'b0000111111111111; // Turn off LED 3
        4'd5: led <= 16'b0000011111111111; // Turn off LED 4
        4'd6: led <= 16'b0000001111111111; // Turn off LED 5
        4'd7: led <= 16'b0000000111111111; // Turn off LED 6
        4'd8: led <= 16'b0000000011111111; // Turn off LED 7
        4'd9: led <= 16'b0000000001111111; // Turn off LED 8
        4'd10: led <= 16'b0000000000111111; // Turn off LED 9
        4'd11: led <= 16'b0000000000011111; // Turn off LED 10
        4'd12: led <= 16'b0000000000001111; // Turn off LED 11
        4'd13: led <= 16'b0000000000000111; // Turn off LED 12
        4'd14: led <= 16'b0000000000000011; // Turn off LED 13
        4'd15: led <= 16'b0000000000000001; // Turn off LED 14
        default: begin 
            led <= 16'b0000000000000000; // All LEDs off
            lose <= 1; // Indicate a loss
         end  
    endcase
end 


            // Button handling
            if (shark_eat && led_index > 0) begin 
                led_index <= led_index - 1; 
            end 
         /*   else if (btnD) begin 
            if (led_index - 4 < 0) begin 
                led_index <= 4'd0; 
                end 
            else begin 
                led_index <= led_index + 4; 
        end  
            end */
/*        end
    end 
endmodule */
