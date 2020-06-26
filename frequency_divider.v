//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:35 06/03/2020 
// Design Name: 
// Module Name:    frequency_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module frequency_divider(clk,rst,out);
input clk,rst;
output out;
reg out;
reg [25:0]count;

always @ (posedge clk or negedge rst)
begin
if(!rst)
begin
out <= 1'b0;
count <= 26'b00_0000_0000_0000_0000_0000_0000; 
end
else if(count==26'b10_1111_1010_1111_0000_1000_0000)
begin
out<=~out;
count<=26'b00_0000_0000_0000_0000_0000_0000;
end
else count<=count+26'b00_0000_0000_0000_0000_0000_0001;
end
endmodule
