`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 11:21:39
// Design Name: 
// Module Name: password_logic
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


module password_logic(
    input clk,                   
    input reset,                 
    input [3:0] switches,     
    //output reg [3:0] leds,    
    output reg password_correct

);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
           // leds <= 4'b0000;
            password_correct <= 0;  // Reset password_correct signal

        end else begin
           
            if (switches == 4'b0001) begin
               // leds <= 4'b0001;         
                end
                else if (switches == 4'b0011) begin 
              //  leds <= 4'b0011;
                end
                else if  (switches == 4'b0111) begin 
                //leds <= 4'b0111;
                end 
                else if (switches == 4'b1111) begin 
               // leds <= 4'b1111;
                password_correct <= 1;    // Indicate that the password is correct

            end else begin
                //leds <= 4'b0000;          // Turn OFF LEDs if password is incorrect
                password_correct <= 0;   
         
            end
        end
    end
endmodule
