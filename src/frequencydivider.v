`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2022 10:23:49 PM
// Design Name: 
// Module Name: frequencydivider
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


module frequencydivider(rst, clk, newclk);
input[1 : 0] rst;
input clk;
output reg newclk;
reg[19 : 0] count = 0;

always @(posedge clk)begin
    count = count + 1;
    if (rst == 2 'b01)
        count = 0;
    else 
        begin
            newclk = count[19]; //19
        end 
    end 
endmodule
