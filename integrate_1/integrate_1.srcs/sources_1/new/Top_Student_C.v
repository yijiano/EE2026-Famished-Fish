`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 12:56:46
// Design Name: 
// Module Name: Top_Student_C
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


module Top_Student_C (
    input clk, btnU, btnD, btnL, btnR,
    inout PS2Clk, PS2Data,
    input [6:0] sw,
    input select_start,
    input select_shark,
    input select_hammer,
    input main_reset,
    input [12:0] pixel_index,
    input main_active,
    output reg [15:0] oled_color,
    output [15:0] led, 
    output lose,
    output [3:0] an,
    output [6:0] seg,
    output dp
);

    colour_constants colour();

    parameter SHARK_SIZE_I = 24;
    parameter SHARK_SIZE_J = 14;

    parameter SHARK_EAT_TIMER = 150_000_000;

    reg [1:0] map = 1;
    reg shark_direction = 1;
    reg [6:0] shark_i = 96 / 2;
    reg [5:0] shark_j = 64 / 2;

    wire [15:0] shark_oled_color;
    wire [15:0] bubble_oled_color;
    wire [15:0] static_seaweed_oled_color;
    reg internal_active = 1;

    wire clk_6_25MHz; 
    clk_6p25M clock_gen(
        .basys_clock(clk),
        .my_6_25mhz_clock(clk_6_25MHz)
    );
    
    wire clk_1000Hz;
    adjustable_clock clock_1000hz (.hertz(1000),.basys_clock(clk),.output_clock(clk_1000Hz));
    
    reg shark_eat;
    wire shark_eat_clk;
    assign shark_eat_clk = nitro ? clk_8Hz : clk_4Hz;

    always @ (posedge shark_eat_clk) begin
    shark_eat <= ~shark_eat;
    end
    
    shark_display shark_inst(
        .pixel_index(pixel_index), 
        .clk_6_25MHz(clk_6_25MHz), 
        .middle_i(shark_i), 
        .middle_j(shark_j), 
        .direction(shark_direction),
        .sharkBlue(select_shark), // On for blue shark, off for black shark
        .eating(shark_eat), // On for eating state and off for normal state
        .oled_color(shark_oled_color)); 
        
   // seaweed_control seaweed_inst(pixel_index, clk_6_25MHz, 0, 0, numOfSeaweed, seaweed_oled_color);

    bubble_display bubble_inst1(.pixel_index(pixel_index), .clk_6_25MHz(clk_6_25MHz), .i(50), .input_j(50), .oled_color(bubble_oled_color));
    

    reg shark_eat_trigger;
    wire health_lose; 
    wire select_start_final;
    assign select_start_final = main_reset || select_start; 
    health_led(.main_active(main_active), 
        .main_reset(main_reset), 
        .select_start(select_start_final), 
        .clk(clk), .y_pixel(shark_j), 
        .shark_eat_trigger(shark_eat_trigger), 
        .lose(health_lose), 
        .nitro(nitro),
        .led(led));

    
    //Mouse Peripheral
    wire [6:0] x_mouse; 
    wire [5:0] y_mouse; 
    wire mouse_click;
    wire nitro;
    wire draw_cursor;
    wire [6:0] x;
    wire [5:0] y;
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
    
    cursor_handler cursor_handler_inst(
        .clk(clk),
        .pixel_x(x),
        .pixel_y(y),
        .ps2_clk(PS2Clk),
        .ps2_data(PS2Data),
        .cursor_x(x_mouse),
        .cursor_y(y_mouse),
        .is_cursor_pixel(draw_cursor),
        .is_cursor_clicked(mouse_click),
        .is_scroll_wheel(nitro)
    );
                            
    //Seawead Collision and minigame start
    
    reg reset = 0;
    reg cutting_active = 0;
    reg seaweed_active = 1;
    wire seaweed_hit, win, seaweed_lose;
    reg order_switch = 0;
    reg rng_reset;
    wire [17:0] numOfSeaweed;
    reg major_reset = 0;
 
    //If win reset cutting minigame 
    always @ (posedge clk_1000Hz) begin
        if (win || main_reset) begin
            reset <= 1;
            if (main_reset)
                major_reset <= 1;
        end else begin
            reset <= 0;
            major_reset <= 0;
        end
    end
    
    wire [15:0] cutting_oled;
    wire [15:0] seaweed_oled;
    
    assign lose = seaweed_lose || health_lose; 
    
    seaweed_cutting_minigame (
        .c6p26mhz(clk_6_25MHz),
        .rng_reset(rng_reset),
        .active(cutting_active),
        .left(mouse_click),
        .x_mouse(x_mouse),
        .y_mouse(y_mouse),
        .pix_index(pixel_index),
        .reset(reset),
        .sw(order_switch),
        .basys_clock(clk),
        .oled_data(cutting_oled),
        .win(win),
        .lose(seaweed_lose)
    );
    
    seaweed_collision(
        .pix_index(pixel_index),
        .active(seaweed_active),
        .x_mouse(shark_i),
        .y_mouse(shark_j),
        .clk(clk_6_25MHz),
        .reset(reset),
        .hit(seaweed_hit),
        .numOfSeaweed(numOfSeaweed),
        .major_reset(major_reset)
    );
    
    seaweed_control(
        .pixel_index(pixel_index),
        .clk_6_25MHz(clk_6_25MHz),
        .i(0),
        .j(47),
        .numOfSeaweed(numOfSeaweed),
        .oled_color(seaweed_oled)
    );

        
    //Seawead Collision and minigame end

    /////////////////////////////////////////////////////////////////////////////////////
    // SHARK CONTROL

    reg [13:0] score = 0;
    score_display display(
        .clk(clk),
        .reg_value(score),
        .an(an),
        .seg(seg)
    );

    wire fish_drop_clk;
    clock_module fish_drop_clock_module(
        .clk(clk),
        .f_out(35),
        .out(fish_drop_clk));
    
    wire fish_spawn_clk;
    clock_module_m fish_spawn_clock_module(
        .clk(clk),
        .m(15_999_999),
        .out(fish_spawn_clk));

    // Synchronize clock domain crossings
    reg fish_drop_clk_reg;
    reg fish_spawn_clk_reg;

    // Clock domain synchronization egisters
    reg fish_spawn_clk_prev;
    reg fish_drop_clk_prev;
    
    always @(posedge clk) begin
        fish_spawn_clk_prev <= fish_spawn_clk;
        fish_drop_clk_prev <= fish_drop_clk;
        fish_spawn_clk_reg <= fish_spawn_clk;
        fish_drop_clk_reg <= fish_drop_clk;
    end

    // Detect clock edges
    wire fish_spawn_posedge = fish_spawn_clk && !fish_spawn_clk_prev;
    wire fish_drop_posedge = fish_drop_clk && !fish_drop_clk_prev;

    wire clk_4Hz;
    clock_module clk_4Hz_module(
        .clk(clk),
        .f_out(4),
        .out(clk_4Hz));

    wire clk_8Hz;
    clock_module clk_8Hz_module(
        .clk(clk),
        .f_out(8),
        .out(clk_8Hz));
        
    wire clk_40Hz;
    clock_module clk_40Hz_module(
        .clk(clk),
        .f_out(40),
        .out(clk_40Hz));

    wire clk_60Hz;
    clock_module clk_60Hz_module(
        .clk(clk),
        .f_out(60),
        .out(clk_60Hz));

    wire clk_90Hz;
    clock_module clk_90Hz_module(
        .clk(clk),
        .f_out(90),
        .out(clk_90Hz));

    // Fish xy-Coordinates Handler
    reg signed [1:0] shark_dx = 0;
    reg signed [1:0] shark_dy = 0;

    wire [15:0] bg1_oled_color;
    wire [15:0] bg2_oled_color;
    wire [15:0] bg3_oled_color;

    // Instantiate background modules
    bg1st bg11_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg1_oled_color));
    bg2nd bg22_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg2_oled_color));
    bg3rd bg33_inst (.clka(clk_6_25MHz), .addra(pixel_index), .douta(bg3_oled_color));

    // Target xy-Coordinates Handler
    reg [6:0] target_x = 96 / 2;
    reg [5:0] target_y = 64 / 2;

    always @ (*) begin
        if (main_reset) begin
            target_x <= 96 / 2;
            target_y <= 64 / 2;
        end

        else begin
            target_x <= mouse_click ? x_mouse : target_x;
            target_y <= mouse_click ? y_mouse : target_y;
        end
    end

    wire draw_target;
    target_handler target(  
        .pixel_x(x),
        .pixel_y(y),
        .target_x(target_x),
        .target_y(target_y),
        .shark_i(shark_i),
        .shark_j(shark_j),
        .is_target(draw_target)
    );

    // Shark Movement Handler
    always @ (posedge clk) begin
        shark_dx <= (shark_i == target_x)
            ? 0
            : (shark_i > target_x
                ? -1
                : 1);

        shark_dy <= (shark_j == target_y)
        ? 0
        : (shark_j > target_y
            ? -1
            : 1);
    end

    // shark_i controller
    wire shark_i_clk = nitro ? clk_90Hz : clk_60Hz;
    always @ (posedge shark_i_clk) begin
            if (main_reset || !main_active) begin
                shark_i <= 96 / 2;
                map <= 1;
            end
            
            else if (main_active) begin
            if (shark_i <= SHARK_SIZE_I / 2) begin
                case (map)
                    1 : map <= 0;
                    2 : map <= 1;
                    default : map <= map;
                endcase
            end

            else if (shark_i >= 95 - SHARK_SIZE_I / 2) begin
                case (map)
                    0 : map <= 1;
                    1 : map <= 2;
                    default : map <= map;
                endcase
            end

            else begin
                map <= map;
            end

            case(shark_dx)
                -1  : begin
                    shark_i <= (shark_i <= SHARK_SIZE_I / 2)
                        ? (map != 0
                            ? 95 - (SHARK_SIZE_I / 2 + 2) : shark_i)
                        : shark_i - 1;
                    shark_direction <= 0;
                end

                0   : begin
                    shark_i <= shark_i;
                    shark_direction <= shark_direction;
                end

                1   : begin
                    shark_i <= (shark_i >= 95 - SHARK_SIZE_I / 2)
                        ? (map != 2
                            ? 0 + (SHARK_SIZE_I / 2 + 2) : shark_i)
                        : shark_i + 1;
                    shark_direction <= 1;
                end
            endcase
        end
    end


    // shark_j controller
    wire shark_j_clk = nitro ? clk_60Hz : clk_40Hz;
    always @ (posedge shark_j_clk) begin
        if (main_reset || !main_active) begin
            shark_j <= 64 / 2;
        end
        
        else if (main_active) begin
            case(shark_dy)
                -1  : shark_j <= (shark_j == 0 + (SHARK_SIZE_J / 2)) ? shark_j : shark_j - 1;
                0   : shark_j <= shark_j;
                1   : shark_j <= (shark_j == 63 - (SHARK_SIZE_J / 2)) ? shark_j : shark_j + 2;
            endcase
        end
    end

    wire draw_line;
    line_drawer target_to_shark_line(   
        .pixel_x(x),
        .pixel_y(y),
        .shark_i(shark_i),
        .shark_j(shark_j),
        .target_x(target_x),
        .target_y(target_y),
        .is_line(draw_line)
    );

    // Fish locations as a single 3D array [map][y][x]
    reg [5:0] fish_locations [2:0][63:0];

        // Calculate shark bounds
    wire [6:0] shark_left = (shark_i >= SHARK_SIZE_I / 2) ? shark_i - SHARK_SIZE_I / 2 : 0;
    wire [6:0] shark_right = (shark_i <= 95 - SHARK_SIZE_I / 2) ? shark_i + SHARK_SIZE_I / 2 : 95;
    wire [5:0] shark_top = (shark_j >= SHARK_SIZE_J / 2) ? shark_j - SHARK_SIZE_J / 2 : 0;
    wire [5:0] shark_bottom = (shark_j <= 63 - SHARK_SIZE_J / 2) ? shark_j + SHARK_SIZE_J / 2 : 63;

    // Fish column range for checking
    wire [5:0] check_col_start = shark_left >> 4;
    wire [5:0] check_col_end = shark_right >> 4;

    // Register to track if any fish is hit
    reg fish_hit;
    reg [5:0] hit_row;
    reg [5:0] hit_col;

    // Fish hit detection - sequential logic for scanning the area
    reg [5:0] scan_row;
    reg [5:0] scan_col;

    // Fish center coordinates
    wire [6:0] fish_center_x = {scan_col, 4'b1000}; // scan_col * 16 + 8
    wire [5:0] fish_center_y = scan_row;

    wire [3:0] x_fish_generator [2:0];
    wire [3:0] y_fish_generator [2:0];

    four_bit_lfsr x_fish_generator_0_module(.clk(fish_spawn_clk), .seed(4'b1011), .lfsr(x_fish_generator[0]));
    four_bit_lfsr y_fish_generator_0_module(.clk(fish_spawn_clk), .seed(4'b1101), .lfsr(y_fish_generator[0]));
    four_bit_lfsr x_fish_generator_1_module(.clk(fish_spawn_clk), .seed(4'b1101), .lfsr(x_fish_generator[1]));
    four_bit_lfsr y_fish_generator_1_module(.clk(fish_spawn_clk), .seed(4'b0101), .lfsr(y_fish_generator[1]));
    four_bit_lfsr x_fish_generator_2_module(.clk(fish_spawn_clk), .seed(4'b1011), .lfsr(x_fish_generator[2]));
    four_bit_lfsr y_fish_generator_2_module(.clk(fish_spawn_clk), .seed(4'b1101), .lfsr(y_fish_generator[2]));

    integer i, j;
    always @(posedge clk) begin
        if (main_reset) begin
            score = 0;
        end
        
        else if (main_active && internal_active) begin
            // Fish Hit-Scan
            fish_hit <= 0;
            
            // Scan through potential columns
            if (scan_col <= check_col_end) begin
                // Calculate fish center position
                if (fish_locations[map][scan_row][scan_col]) begin
                    
                    // Check if fish center is within shark bounds
                    if (fish_center_x >= shark_left && 
                        fish_center_x <= shark_right && 
                        scan_row >= shark_top && 
                        scan_row <= shark_bottom) begin
                        fish_hit <= 1;
                        hit_row <= scan_row;
                        hit_col <= scan_col;
                    end
                end
                
                // Update scan position
                if (scan_row < shark_bottom) begin
                    scan_row <= scan_row + 1;
                end else begin
                    scan_row <= shark_top;
                    scan_col <= scan_col + 1;
                end
            end else begin
                // Reset scan position for next cycle
                scan_row <= shark_top;
                scan_col <= check_col_start;
            end

            // Fish Eating
            if (fish_hit && !main_reset) begin
                fish_locations[map][hit_row][hit_col] <= 0;
                shark_eat_trigger <= 1;
                score <= score + 1;
            end
            else begin
                shark_eat_trigger <= 0;
            end


            // Fish spawning logic
            if (fish_spawn_posedge) begin
                if (x_fish_generator[0] % 6 != 0) begin
                    fish_locations[0][y_fish_generator[0]][x_fish_generator[0] % 6] <= 1;
                end

                if (x_fish_generator[1] % 6 != 0) begin
                    fish_locations[1][y_fish_generator[1]][x_fish_generator[1] % 6] <= 1;
                end

                if (x_fish_generator[2] % 6 != 0) begin
                    fish_locations[2][y_fish_generator[2]][x_fish_generator[2] % 6] <= 1;
                end
            end

            // Fish dropping logic
            if (fish_drop_posedge) begin

                for (i = 63; i >= 1; i = i - 1) begin
                    for (j = 0; j < 6; j = j + 1) begin
                        if (fish_locations[0][i-1][j] == 1) begin
                            fish_locations[0][i][j] <= 1;
                            fish_locations[0][i-1][j] <= 0;
                        end
                        if (fish_locations[1][i-1][j] == 1) begin
                            fish_locations[1][i][j] <= 1;
                            fish_locations[1][i-1][j] <= 0;
                        end
                        if (fish_locations[2][i-1][j] == 1) begin
                            fish_locations[2][i][j] <= 1;
                            fish_locations[2][i-1][j] <= 0;
                        end
                    end
                end
                
                // Clear top row after dropping
                for (j = 0; j < 6; j = j + 1) begin
                    fish_locations[0][63][j] <= 0;
                    fish_locations[1][63][j] <= 0;
                    fish_locations[2][63][j] <= 0;
                end
            end
        end
    end

    /////////////////////////////////////////////////////////////////////////////////////
    // DISPLAY

    always @(posedge clk_6_25MHz) begin
        if (seaweed_hit) begin
            if (draw_cursor) 
                oled_color <= mouse_click ? colour.GREEN : colour.WHITE; 
            else if (cutting_oled != 16'b00000_000000_00000)
                oled_color <= cutting_oled;
            else begin
                case(map)
                    0: oled_color <= bg1_oled_color;
                    1: oled_color <= bg2_oled_color;
                    2: oled_color <= bg3_oled_color;
                endcase
            end
                
            cutting_active <= 1;
            seaweed_active <= 0;
            internal_active <= 0; //Deactivate Fish Counter
            order_switch <= 1;
            rng_reset <= 0;  
        end 
        
        else begin
            cutting_active <= 0;
            seaweed_active <= 1;
            internal_active <= 1; //Activate Fish Counter 
            order_switch <= 0;
            rng_reset <= 1;

            if (draw_cursor) 
                oled_color <= mouse_click ? colour.GREEN : colour.WHITE;

            else if(shark_oled_color != 16'b10000_000000_00000) 
                oled_color <= shark_oled_color;
            
            // Target-Fish Line Drawer
            else if (draw_line) begin
                oled_color <= nitro ? colour.YELLOW : colour.WHITE;
            end
            
            // Target Drawer
            else if (draw_target) begin
                oled_color <= colour.RED;
            end

            // Fish Display - check if current pixel is part of a fish	
            else if (
                ((x + 2) % 16 == 0 && fish_locations[map][y - 1][(x + 2) >> 4]) ||
                ((x + 2) % 16 == 0 && fish_locations[map][y][(x + 2) >> 4]) ||
                ((x + 1) % 16 == 0 && fish_locations[map][y][(x + 1) >> 4]) ||
                (x % 16 == 0 && fish_locations[map][y + 1][x >> 4]) ||
                (x % 16 == 0 && fish_locations[map][y][x >> 4]) ||
                (x % 16 == 0 && fish_locations[map][y - 1][x >> 4]) ||
                ((x - 1) % 16 == 0 && fish_locations[map][y][(x - 1) >> 4])              
            ) begin

                case (map)
                    0 : oled_color <= colour.MAGENTA;
                    1 : oled_color <= colour.ORANGE;
                    2 : oled_color <= colour.PINK;
                endcase
            end

            else if(bubble_oled_color != 16'b10000_000000_00000) 
                oled_color <= bubble_oled_color;

            else if(seaweed_oled != 16'b00000_000000_00000)
                oled_color <= seaweed_oled;

            else begin
                case(map)
                    0: oled_color <= bg1_oled_color;
                    1: oled_color <= bg2_oled_color;
                    2: oled_color <= bg3_oled_color;
                endcase
            end
        end
    end  
endmodule