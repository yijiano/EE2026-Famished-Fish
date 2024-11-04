`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2024 12:39:07
// Design Name: 
// Module Name: Top_Control
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


module Top_Control(
    input basys_clk,
    input btnU,
    input btnD,
    input btnC,
    input btnL,
    input btnR,
    input [6:0] sw,
    input sw15,
    inout PS2Clk, PS2Data,
    output [15:0] led,
    output [7:0] JB,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    wire select_shark;
    wire select_hammer;
    wire [15:0] oled_jiali;
    wire [15:0] oled_brian;
    wire [15:0] oled_final;
    wire [15:0] oled_lose;
    wire [15:0] oled_pause;
    wire [12:0] pixel_index;
    wire my_6_25mhz_clock, c1000hz; 
    wire select_start;
    wire lose, restart, exit;
    reg start = 0;
    reg reset = 0;
    reg [4:0] scene = 0;
    reg start_flag = 0;
    reg lose_flag = 0;
    reg pause_flag = 0;
    
    reg lose_page_active;
    reg pause_page_active;
    reg game_active = 0;
    
    wire restart_lose;
    wire exit_lose;
    wire restart_pause;
    wire exit_pause;
    wire resume;
    
    assign exit = exit_lose || exit_pause;
    assign restart = restart_lose || restart_pause;
     
    adjustable_clock clock_1hz (
        .hertz(1000),
        .basys_clock(basys_clk),
        .output_clock(c1000hz)
    );
    
    clk_6p25M clock_gen(
        .basys_clock(basys_clk),
        .my_6_25mhz_clock(my_6_25mhz_clock)
    );
    
    //Scene 0: Main menu, Scene 1: Game, Scene 2: Losing screen, Scene 3: Pause Screen
    
    always @(posedge c1000hz) begin
        // Reset pulse logic
        if (reset == 1) begin
            reset <= 0;
        end else begin
            // Scene 0: Main menu
            if (scene == 0) begin
                game_active <= 0; //Deactivate Game
                if (select_start && !start_flag) begin
                    reset <= 1;
                    scene <= 1;
                    start_flag <= 1;
                end
            end
    
            // Scene 1: Game active
            else if (scene == 1) begin
                game_active <= 1; //Activate Game
                if (btnR && !pause_flag) begin //Switch to Pause Screen
                    scene <= 3;
                    pause_flag <= 1;
                    pause_page_active <= 1;
                    lose_page_active <= 0;
                end
                else if (lose && !lose_flag) begin //Switch to Lose Screen
                    scene <= 2;
                    lose_flag <= 1;
                    pause_page_active <= 0;
                    lose_page_active <= 1;
                end
            end
    
            // Scene 2: Losing screen
            else if (scene == 2 || scene == 3) begin
                game_active <= 0;
                if (exit) begin
                    reset <= 1;  // Trigger reset
                    start_flag <= 0;
                    lose_flag <= 0;
                    pause_flag <= 0;
                    scene <= 0;  // Go back to main menu
                    pause_page_active <= 0; //Deactive Pause
                    lose_page_active <= 0; //Deactive Lose
                end else if (restart) begin
                    reset <= 1;  // Trigger reset
                    start_flag <= 0;
                    lose_flag <= 0;
                    pause_flag <= 0;
                    scene <= 1;  // Restart the game
                    pause_page_active <= 0; //Deactivate Pause
                    lose_page_active <= 0; //Deactivate Lose
                end else if (resume) begin
                    scene <= 1;
                    pause_page_active <= 0; //Deactivate Pause
                    lose_page_active <= 0;  //Deactivate Lose
                    lose_flag <= 0; 
                    pause_flag <= 0;
                end
            end
        end
    end


    Top_Student_B Top_Studnet_B_inst( //Main Menu
        .basys_clk(basys_clk),
        .btnU(btnU),
        .btnD(btnD),
        .btnC(btnC),
        .btnL(btnL),
        .sw(sw),
        .sw15(sw15),
        //.led(led),
        .select_shark(select_shark),
        .select_hammer(select_hammer),
        .oled_colour(oled_brian),
        .pixel_index(pixel_index),
        .select_start(select_start),
        .reset(reset)
    );
    
    
    Top_Student_C Top_Student_C_inst( //Main Game
        .clk(basys_clk),
        .select_hammer(select_hammer),
        .select_shark(select_shark),
        .select_start(select_start),
        .btnU(btnU),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .sw(sw),
        .pixel_index(pixel_index),
        .oled_color(oled_jiali),
        .PS2Clk(PS2Clk),
        .PS2Data(PS2Data),
        .lose(lose),
        .main_reset(reset),
        .an(an),
        .seg(seg),
        .dp(dp),
        .led(led),
        .main_active(game_active)
    );
        
    lose_page lose_page_inst( //Lose Page
        .clk(my_6_25mhz_clock),
        .btnU(btnU),
        .btnC(btnC),
        .btnD(btnD),
        .pixel_index(pixel_index),
        .oled_colour(oled_lose), //output 
        .reset(reset),
        .restart(restart_lose), //output
        .exit(exit_lose), //output 
        .active(lose_page_active)
    );
    
    pause_page pause_page_inst ( //Pause Page
        .clk(my_6_25mhz_clock),
        .btnU(btnU),
        .btnC(btnC),
        .btnD(btnD),
        .pixel_index(pixel_index),
        .oled_colour(oled_pause),
        .restart(restart_pause),
        .exit(exit_pause),
        .resume(resume),
        .reset(reset),
        .active(pause_page_active)
    );
    
    
    

    assign oled_final = (scene == 1) ? oled_jiali :
                        (scene == 2) ? oled_lose :
                        (scene == 3) ? oled_pause :
                        oled_brian;


//Peripherals 
    Oled_Display oled_display (
    .clk(my_6_25mhz_clock),
    .reset(0),
    .pixel_index(pixel_index),
    .pixel_data(oled_final),
    .cs(JB[0]),
    .sdin(JB[1]),
    .sclk(JB[3]),
    .d_cn(JB[4]),
    .resn(JB[5]),
    .vccen(JB[6]),
    .pmoden(JB[7])
    );
    
    
endmodule
