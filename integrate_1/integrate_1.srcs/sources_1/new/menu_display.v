`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 23:17:40
// Design Name: 
// Module Name: menu_display
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


module menu_display(
    input clk,                    
    input reset,                  
    input btnU,                   
    input btnD,                   
    input btnC,                 
    input btnL,
    output led15, // for debug
    output reg [15:0] oled_colour, 
    input [15:0] pixel_index, 
    output reg select_start,        //Indicates we game start
    output reg in_settings_reg,     // Indicates if we are in the settings menu
    output reg in_guide_reg,        // Indicates in guide
    output reg select_hammer,       // Indicates if "Hammer Shark" is selected
    output reg select_shark         // Indicates if "Normal Shark" is selected
);

    assign led15 = select_shark;
        // Pixel dimensions
    wire [6:0] x;                 
    wire [5:0] y;                 
    
    
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;


    wire [15:0] main_oled_color;
    wire [15:0] settings_oled_color;
    wire [15:0] guide_oled_color;

    main_menu main_inst (.clka(clk), .addra(pixel_index), .douta(main_oled_color));
    settings settings_inst (.clka(clk), .addra(pixel_index), .douta(settings_oled_color));
    guide guide_inst (.clka(clk), .addra(pixel_index), .douta(guide_oled_color));
        
        
    reg shark_selection;
    reg [1:0] menu_selection; // Selection: 0 = Instructions, 1 = Start, 2 = Settings
        
    reg btnU_edge, btnD_edge, btnC_edge; 
    parameter DEBOUNCE_THRESHOLD = 16'd5000; 
    parameter RELEASE_THRESHOLD = 16'd5000;  

    reg [15:0] btnU_count = 0, btnD_count = 0, btnC_count = 0;
    reg [15:0] btnU_release_count = 0, btnD_release_count = 0, btnC_release_count = 0;
    reg btnU_stable = 0, btnD_stable = 0, btnC_stable = 0;
    reg btnU_last = 0, btnD_last = 0, btnC_last = 0;

    always @(posedge clk) begin

        if (btnU) begin
            if (btnU_count < DEBOUNCE_THRESHOLD) begin
                btnU_count <= btnU_count + 1;
            end else begin
                btnU_stable <= 1;
            end
            btnU_release_count <= 0;
        end else begin
            if (btnU_release_count < RELEASE_THRESHOLD) begin
                btnU_release_count <= btnU_release_count + 1;
            end else begin
                btnU_stable <= 0;
            end
            btnU_count <= 0;
        end


        if (btnD) begin
            if (btnD_count < DEBOUNCE_THRESHOLD) begin
                btnD_count <= btnD_count + 1;
            end else begin
                btnD_stable <= 1;
            end
            btnD_release_count <= 0;
        end else begin
            if (btnD_release_count < RELEASE_THRESHOLD) begin
                btnD_release_count <= btnD_release_count + 1;
            end else begin
                btnD_stable <= 0;
            end
            btnD_count <= 0;
        end


        if (btnC) begin
            if (btnC_count < DEBOUNCE_THRESHOLD) begin
                btnC_count <= btnC_count + 1;
            end else begin
                btnC_stable <= 1;
            end
            btnC_release_count <= 0;
        end else begin
            if (btnC_release_count < RELEASE_THRESHOLD) begin
                btnC_release_count <= btnC_release_count + 1;
            end else begin
                btnC_stable <= 0;
            end
            btnC_count <= 0;
        end


        btnU_edge <= btnU_stable && !btnU_last;
        btnD_edge <= btnD_stable && !btnD_last;
        btnC_edge <= btnC_stable && !btnC_last;


        btnU_last <= btnU_stable;
        btnD_last <= btnD_stable;
        btnC_last <= btnC_stable;
    end
    
    // Main logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            menu_selection <= 0;
            in_settings_reg <= 0;
            in_guide_reg <= 0;
            select_start <= 0; // Start initially set to 0, but won't reset once set
        end else begin
            if (!in_settings_reg && !in_guide_reg) begin
                // Main menu navigation with debounced signals
                if (btnU_edge) begin
                    menu_selection <= (menu_selection > 0) ? menu_selection - 1 : 2; // Wrap around up
                end else if (btnD_edge) begin
                    menu_selection <= (menu_selection < 2) ? menu_selection + 1 : 0; // Wrap around down
                end
    
                // Confirm selection with btnC
                if (btnC_edge) begin
                    case (menu_selection)
                        0: in_guide_reg <= 1;   // Enter guide
                        1: select_start <= 1;   // Set select_start permanently to 1
                        2: in_settings_reg <= 1; // Enter settings
                    endcase
                end
            end else if (in_settings_reg) begin
                // Character selection in settings menu
                if (btnU_edge) begin
                    shark_selection <= 0; // Move to Shark option
                end else if (btnD_edge) begin
                    shark_selection <= 1; // Move to Hammer option
                end
    
                // Toggle selection with btnC in settings
                if (btnC_edge) begin
                    if (shark_selection == 0) begin
                        select_shark <= 1;
                        select_hammer <= 0;
                    end else if (shark_selection == 1) begin
                        select_shark <= 0;
                        select_hammer <= 1;
                    end
                end
    
                // Exit settings with btnL
                if (btnL) begin
                    in_settings_reg <= 0;
                end
            end else if (in_guide_reg) begin
                // Exit guide with btnL
                if (btnL) begin
                    in_guide_reg <= 0;
                end
            end
        end
    end


    integer i;

                always @(*) begin
                    oled_colour = 16'h0000; // Default color: black background
                
                    if (in_settings_reg) begin
                        // Settings screen display
                        
                
                        // Bounding box and color logic for "Shark" option
                        if ((x >= 33 && x <= 64 && y == 17) || (x >= 33 && x <= 64 && y == 33) || (x == 33 && y >= 17 && y <= 33) || (x == 64 && y >= 17 && y <= 33)) begin
                            if (shark_selection == 0) begin
                                // Cursor is on Shark
                                oled_colour = select_shark ? 16'h07E0 : 16'hF800; // Green if selected, red if not
                            end else begin
                                oled_colour = select_shark ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
                            end
                        end
                
                        // Bounding box and color logic for "Hammer" option
                        else if ((x >= 33 && x <= 64 && y == 37) || (x >= 33 && x <= 64 && y == 53) || (x == 33 && y >= 37 && y <= 53) || (x == 64 && y >= 37 && y <= 53)) begin
                            if (shark_selection == 1) begin
                                // Cursor is on Hammer
                                oled_colour = select_hammer ? 16'h07E0 : 16'hF800; // Green if selected, red if not
                            end else begin
                                oled_colour = select_hammer ? 16'h07E0 : 16'hFFFF; // Green if selected, white if not
                            end
                        end
                        
                        else oled_colour <= settings_oled_color; // settings_oled_data[pixel_index] != 16'h0000 ? settings_oled_data[pixel_index] : 16'h0000;
            

    
            end else if (in_guide_reg) begin
                // Guide screen display
                oled_colour <= guide_oled_color; // guide_oled_data[pixel_index] != 16'h0000 ? guide_oled_data[pixel_index] : 16'h0000;
    
            end else begin
                // Main menu display
                
                // Bounding boxes for main menu options
                if ((x >= 29 && x <= 66 && y == 7) || (x >= 29 && x <= 66 && y == 19) || (x == 29 && y >= 7 && y <= 19) || (x == 66 && y >= 7 && y <= 19)) begin
                    oled_colour = (menu_selection == 0) ? 16'h07E0 : 16'hFFFF; // Instructions: Green if selected, white if not
                end else if ((x >= 29 && x <= 66 && y == 25) || (x >= 29 && x <= 66 && y == 36) || (x == 29 && y >= 25 && y <= 36) || (x == 66 && y >= 25 && y <= 36)) begin
                    oled_colour = (menu_selection == 1) ? 16'h07E0 : 16'hFFFF; // Start: Green if selected, white if not
                end else if ((x >= 29 && x <= 66 && y == 44) || (x >= 29 && x <= 66 && y == 56) || (x == 29 && y >= 44 && y <= 56) || (x == 66 && y >= 44 && y <= 56)) begin
                    oled_colour = (menu_selection == 2) ? 16'h07E0 : 16'hFFFF; // Settings: Green if selected, white if not
                end
                else  oled_colour <= main_oled_color; // oled_data[pixel_index] != 16'h0000 ? oled_data[pixel_index] : 16'h0000;
            end
        end
    endmodule
