`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 21:48:32
// Design Name: 
// Module Name: wire_order_logic
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


module wire_order_logic(input reset, input clk, input [4:0] randnum, input red_cut, green_cut, blue_cut, yellow_cut, output reg win = 0,output reg lose = 0);
    
//0-red, 1-green, 2-blue, 3-yellow

reg [2:0] step = 1;
reg red_done = 0;
reg green_done = 0;
reg blue_done = 0;
reg yellow_done = 0;

always @(posedge clk) begin
if (reset) begin
    step <= 1;
    red_done <= 0;
    green_done <= 0;
    blue_done <= 0;
    yellow_done <=0;
    win <= 0;
    lose <= 0;
end else if (!lose) begin
       case (randnum)
           5'd0: begin
// Permutation 1: 0123
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end
           end
           5'd1: begin
  // Permutation 2: 0132
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end
           end
           5'd2: begin
// Permutation 3: 0213
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end              
           end
           5'd3: begin
// Permutation 4: 0231
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end 

           end
           5'd4: begin
// Permutation 5: 0312
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end 
           end
           5'd5: begin
// Permutation 6: 0321
               if (red_cut && !red_done) begin
                    if(step == 1)
                        step <= step + 1;
                    else 
                        lose <= 1;
                        
                    red_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                    if(step == 4)
                        win <= 1;
                    else
                        lose <= 1;
                        
                    green_done <= 1;
               end 
               
               if (blue_cut && !blue_done) begin
                    if(step == 3)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    blue_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                    if(step == 2)
                        step <= step + 1;
                    else
                        lose <= 1;
                        
                    yellow_done <= 1;
               end 
           end
           5'd6: begin
// Permutation 7: 1023
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end
           end
           5'd7: begin
// Permutation 8: 1032
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end
           end
           5'd8: begin
// Permutation 9: 1203
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end
           end
           5'd9: begin
// Permutation 10: 1230
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end
           end
           5'd10: begin
// Permutation 11: 1302
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end
           end
           5'd11: begin
// Permutation 12: 1320
               if (green_cut && !green_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end
           end
           5'd12: begin
// Permutation 13: 2013
               if (blue_cut && !blue_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end
           end
           5'd13: begin
// Permutation 14: 2031
               if (blue_cut && !blue_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end
           end
           5'd14: begin
// Permutation 15: 2103
               if (blue_cut && !blue_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end
           end
           5'd15: begin
// Permutation 16: 2130
                       if (blue_cut && !blue_done) begin
                   if(step == 1)
                       step <= step + 1;
                   else 
                       lose <= 1;
                       
                   blue_done <= 1;
               end 
               
               if (green_cut && !green_done) begin
                   if(step == 2)
                       step <= step + 1;
                   else
                       lose <= 1;
                       
                   green_done <= 1;
               end 
               
               if (yellow_cut && !yellow_done) begin
                   if(step == 3)
                       step <= step + 1;
                   else
                       lose <= 1;
                       
                   yellow_done <= 1;
               end 
               
               if (red_cut && !red_done) begin
                   if(step == 4)
                       win <= 1;
                   else
                       lose <= 1;
                       
                   red_done <= 1;
               end
           end
           5'd16: begin
// Permutation 17: 2301
               if (blue_cut && !blue_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end
           end
           5'd17: begin
// Permutation 18: 2310
               if (blue_cut && !blue_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (yellow_cut && !yellow_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end
           end
           5'd18: begin
// Permutation 19: 3012
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end
           end
           5'd19: begin
// Permutation 20: 3021
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end
           end
           5'd20: begin
// Permutation 21: 3102
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end
           end
           5'd21: begin
// Permutation 22: 3120
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end
           end
           5'd22: begin
// Permutation 23: 3201
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end
           end
           5'd23: begin
// Permutation 24: 3210
               if (yellow_cut && !yellow_done) begin
                           if(step == 1)
                               step <= step + 1;
                           else 
                               lose <= 1;
                               
                           yellow_done <= 1;
                       end 
                       
                       if (blue_cut && !blue_done) begin
                           if(step == 2)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           blue_done <= 1;
                       end 
                       
                       if (green_cut && !green_done) begin
                           if(step == 3)
                               step <= step + 1;
                           else
                               lose <= 1;
                               
                           green_done <= 1;
                       end 
                       
                       if (red_cut && !red_done) begin
                           if(step == 4)
                               win <= 1;
                           else
                               lose <= 1;
                               
                           red_done <= 1;
                       end
           end
           default: begin
                step <= 1;
           end
       endcase
    end
end
       
       
endmodule
