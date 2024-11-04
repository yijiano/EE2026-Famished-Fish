`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 15:09:25
// Design Name: 
// Module Name: seaweed_cutting_minigame
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


module seaweed_cutting_minigame (
    input c6p26mhz,
    input active,
    input left,
    input [11:0] x_mouse, 
    input [11:0] y_mouse,
    output reg [15:0] oled_data, 
    input [12:0] pix_index,
    input reset, 
    input rng_reset,
    input sw, 
    input basys_clock, 
    output win,
    output lose
);

wire [6:0] x;
wire [6:0] y;
assign x = pix_index % 96;
assign y = pix_index / 96;

wire c17hz, c1hz, fb, sending_pix, sample_pix;
wire [4:0] randnum;
reg red_cut = 0;
reg green_cut = 0;
reg blue_cut = 0;
reg yellow_cut = 0;

wire [15:0] seaweed_strand_one, seaweed_strand_two, seaweed_strand_three, seaweed_strand_four;
wire [6:0] seaweed_seg;

seaweed_strand strandone (
    .seg(seaweed_seg),
    .compare(7'b1001110),
    .clk(c6p26mhz),
    .x(x),
    .y(y),
    .i(0),
    .j(0),
    .oled_color(seaweed_strand_one)
);

seaweed_strand strandtwo (
    .seg(seaweed_seg),
    .compare(7'b1000010),
    .clk(c6p26mhz),
    .x(x),
    .y(y),
    .i(24),
    .j(0),
    .oled_color(seaweed_strand_two)
);

seaweed_strand strandthree (
    .seg(seaweed_seg),
    .compare(7'b0000011),
    .clk(c6p26mhz),
    .x(x),
    .y(y),
    .i(48),
    .j(0),
    .oled_color(seaweed_strand_three)
);

seaweed_strand strandfour (
    .seg(seaweed_seg),
    .compare(7'b0010001),
    .clk(c6p26mhz),
    .x(x),
    .y(y),
    .i(72),
    .j(0),
    .oled_color(seaweed_strand_four)
);

wire hover_one, hover_two, hover_three, hover_four;

seaweed_strand_mouse first_strand (
    .x_mouse(x_mouse),
    .y_mouse(y_mouse),
    .clk(c6p26mhz),
    .hover(hover_one),
    .i(0),
    .j(0)
);

seaweed_strand_mouse second_strand (
    .x_mouse(x_mouse),
    .y_mouse(y_mouse),
    .clk(c6p26mhz),
    .hover(hover_two),
    .i(24),
    .j(0)
);

seaweed_strand_mouse third_strand (
    .x_mouse(x_mouse),
    .y_mouse(y_mouse),
    .clk(c6p26mhz),
    .hover(hover_three),
    .i(48),
    .j(0)
);

seaweed_strand_mouse four_strand (
    .x_mouse(x_mouse),
    .y_mouse(y_mouse),
    .clk(c6p26mhz),
    .hover(hover_four),
    .i(72),
    .j(0)
);

reg [22:0] delay_counter = 0;
reg cutting_delay_active = 0;


always @ (posedge c6p26mhz) begin
    if (reset) begin
        red_cut <= 0;
        green_cut <= 0;
        blue_cut <= 0;
        yellow_cut <= 0;
        cutting_delay_active <= 0;
    end
            
    else if (active) begin
            //draw the mouse cursor 
//            if ( ((2 * x == y - (y_mouse - 2 * x_mouse)) || (2 * x == (y_mouse + 2 * x_mouse) - y)) && (x <= x_mouse + 5 && x >= x_mouse -5 && y <= y_mouse + 5 && y >= y_mouse - 5) )
//                oled_data <= left ? 16'b01111_011111_01111 : 16'b11111_111111_11111;  
//            else begin
            // Draw uncut seaweed strands 
                    if (!red_cut && seaweed_strand_one != 16'b0)
                        oled_data <= seaweed_strand_one;
                    else if (!green_cut && seaweed_strand_two != 16'b0)
                        oled_data <= seaweed_strand_two;
                    else if (!blue_cut && seaweed_strand_three != 16'b0)
                        oled_data <= seaweed_strand_three;
                    else if (!yellow_cut && seaweed_strand_four != 16'b0)
                        oled_data <= seaweed_strand_four;
                    else
                        oled_data <= 16'b00000_000000_00000; // Default background color
//            end
                
            //mouse cutting logic
            if (!cutting_delay_active) begin
                cutting_delay_active <= 1;
                delay_counter <= 0;
            end  
            else if (cutting_delay_active) begin
                if(delay_counter < 3125000) begin
                    delay_counter <= delay_counter + 1;
                end else begin
                    if (hover_one && left) 
                        red_cut <= 1;
                    else if (hover_two && left)
                        green_cut <= 1;
                    else if (hover_three && left)
                        blue_cut <= 1;
                    else if (hover_four && left) 
                        yellow_cut <= 1;
                end
            end
    end
end

//Clocks
adjustable_clock clock_1hz (.hertz(2),.basys_clock(basys_clock),.output_clock(c1hz));
adjustable_clock clock_17hz (.hertz(17),.basys_clock(basys_clock),.output_clock(c17hz));


//Random order generator
random_number rng (.reset(rng_reset), .clk(c17hz), .stop(sw), .random_out(randnum));
shuffle rand_order (.randnum(randnum),.clk(c1hz),.seg(seaweed_seg),.an(0),.dp(0),.done(sw));

//Wire Order Logic
wire module_win;
wire module_lose;
assign win = module_win;
assign lose = module_lose;
wire_order_logic wire_order (.reset(reset),.clk(c6p26mhz),.randnum(randnum), .red_cut(red_cut),.green_cut(green_cut), .blue_cut(blue_cut), .yellow_cut(yellow_cut), .win(module_win), .lose(module_lose));




endmodule
