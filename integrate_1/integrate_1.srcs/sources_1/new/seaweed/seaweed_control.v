module seaweed_control(input [12:0] pixel_index, input clk_6_25MHz, input [6:0] i, input [5:0] j, input [17:0] numOfSeaweed, output reg[15:0] oled_color = 16'b00000_000000_00000);
    
    wire [15:0] seaweed1_oled_color;
    wire [15:0] seaweed2_oled_color;
    wire [15:0] seaweed3_oled_color;
    wire [15:0] seaweed4_oled_color;
    wire [15:0] seaweed5_oled_color;
    wire [15:0] seaweed6_oled_color;
    wire [15:0] seaweed7_oled_color;
    wire [15:0] seaweed8_oled_color;
    wire [15:0] seaweed9_oled_color;
    wire [15:0] seaweed10_oled_color;
    wire [15:0] seaweed11_oled_color;
    wire [15:0] seaweed12_oled_color;
    wire [15:0] seaweed13_oled_color;
    wire [15:0] seaweed14_oled_color;
    wire [15:0] seaweed15_oled_color;
    wire [15:0] seaweed16_oled_color;
    wire [15:0] seaweed17_oled_color;
    wire [15:0] seaweed18_oled_color;
    
    seaweed1_display seaweed_inst1(pixel_index, clk_6_25MHz, i, j, seaweed1_oled_color);
    seaweed2_display seaweed_inst2(pixel_index, clk_6_25MHz, i, j, seaweed2_oled_color);
    seaweed3_display seaweed_inst3(pixel_index, clk_6_25MHz, i, j, seaweed3_oled_color);
    seaweed4_display seaweed_inst4(pixel_index, clk_6_25MHz, i, j, seaweed4_oled_color);
    seaweed5_display seaweed_inst5(pixel_index, clk_6_25MHz, i, j, seaweed5_oled_color);
    seaweed6_display seaweed_inst6(pixel_index, clk_6_25MHz, i, j, seaweed6_oled_color);
    seaweed7_display seaweed_inst7(pixel_index, clk_6_25MHz, i, j, seaweed7_oled_color);
    seaweed8_display seaweed_inst8(pixel_index, clk_6_25MHz, i, j, seaweed8_oled_color);
    seaweed9_display seaweed_inst9(pixel_index, clk_6_25MHz, i, j, seaweed9_oled_color);
    seaweed10_display seaweed_inst10(pixel_index, clk_6_25MHz, i, j, seaweed10_oled_color);
    seaweed11_display seaweed_inst11(pixel_index, clk_6_25MHz, i, j, seaweed11_oled_color);
    seaweed12_display seaweed_inst12(pixel_index, clk_6_25MHz, i, j, seaweed12_oled_color);
    seaweed13_display seaweed_inst13(pixel_index, clk_6_25MHz, i, j, seaweed13_oled_color);
    seaweed14_display seaweed_inst14(pixel_index, clk_6_25MHz, i, j, seaweed14_oled_color);
    seaweed15_display seaweed_inst15(pixel_index, clk_6_25MHz, i, j, seaweed15_oled_color);
    seaweed16_display seaweed_inst16(pixel_index, clk_6_25MHz, i, j, seaweed16_oled_color);
    seaweed17_display seaweed_inst17(pixel_index, clk_6_25MHz, i, j, seaweed17_oled_color);
    seaweed18_display seaweed_inst18(pixel_index, clk_6_25MHz, i, j, seaweed18_oled_color);
    
    always@(posedge clk_6_25MHz) begin
        // Default color
        oled_color <= 16'b00000_000000_00000;
            
        if(numOfSeaweed[17]&&seaweed1_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed1_oled_color;
        if(numOfSeaweed[16]&&seaweed2_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed2_oled_color;
        if(numOfSeaweed[15]&&seaweed3_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed3_oled_color;
        if(numOfSeaweed[14]&&seaweed4_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed4_oled_color;
        if(numOfSeaweed[13]&&seaweed5_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed5_oled_color;
        if(numOfSeaweed[12]&&seaweed6_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed6_oled_color;
        if(numOfSeaweed[11]&&seaweed7_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed7_oled_color;
        if(numOfSeaweed[10]&&seaweed8_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed8_oled_color;
        if(numOfSeaweed[9]&&seaweed9_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed9_oled_color;
        if(numOfSeaweed[8]&&seaweed10_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed10_oled_color;
        if(numOfSeaweed[7]&&seaweed11_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed11_oled_color;
        if(numOfSeaweed[6]&&seaweed12_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed12_oled_color;
        if(numOfSeaweed[5]&&seaweed13_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed13_oled_color;
        if(numOfSeaweed[4]&&seaweed14_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed14_oled_color;
        if(numOfSeaweed[3]&&seaweed15_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed15_oled_color;
        if(numOfSeaweed[2]&&seaweed16_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed16_oled_color;
        if(numOfSeaweed[1]&&seaweed17_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed17_oled_color;
        if(numOfSeaweed[0]&&seaweed18_oled_color!=16'b1000_0000_0000_0000) oled_color <= seaweed18_oled_color;
    end
endmodule