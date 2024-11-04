`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2024 13:09:50
// Design Name: 
// Module Name: Top_Student
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

module Top_Student_B(
    input basys_clk,
    input btnU,
    input btnD,
    input btnC,
    input btnL,
    input [3:0] sw,
    input sw15,
    output select_start,
   // output [3:0] led,
    output [15:0] oled_colour,
    output select_hammer,
    output select_shark,
    input [12:0] pixel_index,
    input reset
);

    // Internal signals
    wire my_6_25mhz_clock;
    wire [6:0] pixel_x;
    wire [5:0] pixel_y;
    wire loading_complete;
    wire [15:0] loading_oled_colour;
    wire [15:0] menu_oled_colour;
    wire password_correct;
    wire [15:0] bubbling_oled;
    wire in_settings;  // New signal to track if in settings screen

    // Clock generation
    clk_6p25M clock_gen(
        .basys_clock(basys_clk),
        .my_6_25mhz_clock(my_6_25mhz_clock)
    );

    // Loading screen + animation
    loading_screen loading (
        .clk(my_6_25mhz_clock),
        .reset(1'b0),
        .start_loading(password_correct),
        .pixel_index(pixel_index),
        .oled_colour(loading_oled_colour),
        .loading_complete(loading_complete)
    );
    // Password logic
    password_logic password (
        .clk(my_6_25mhz_clock),
        .reset(1'b0),
        .switches(sw),
       // .leds(led),
        .password_correct(password_correct)
    );

    // Menu display
    menu_display menu_inst (
        .clk(my_6_25mhz_clock),
        .reset(reset),
        .btnU(btnU),
        .btnD(btnD),
        .btnC(btnC),
        .btnL(btnL),
        .oled_colour(menu_oled_colour),
        .pixel_index(pixel_index),
        .select_start(select_start),
        .select_shark(select_shark),
        .select_hammer(select_hammer),
        .in_settings_reg(in_settings)
    );

  assign oled_colour = (loading_complete) ? menu_oled_colour : loading_oled_colour; 


    
endmodule
