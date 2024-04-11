`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2022 10:33:07 PM
// Design Name: 
// Module Name: assignment_tb
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


module assignment_tb;
reg clk;
reg [3:0] btn;
reg [1:0] control;
wire [6:0] a0,a1,a2,a3,a4,a5;
wire newclk;
wire red, green;
wire led;
sportstopwatch uut(.btn(btn),.clk(clk),.control(control),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.newclk(newclk),.red(red),.green(green));
//sportstopwatch uut(.clk(clk),.control(control),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.led(led));
initial begin
clk = 0;control = 2'b00;
btn = 4'b0000;

end
always #4 clk = ~clk;

initial begin
#30 btn = 4'b1000;
#30 btn = 4'b0100;
#30 btn = 4'b0010;
#30 btn = 4'b0001;
#30 btn = 4'b0000;
#100 control = 2'b10;
#150 control = 2'b11;
#150 control = 2'b01;
btn = 4'b1000;
#190 control = 2'b10;
btn = 4'b0000;
#100 control = 2'b00;
#30 btn = 4'b1000;
#50 btn = 4'b0000;
#1 control = 2'b10;
#50 $stop;
end
endmodule
