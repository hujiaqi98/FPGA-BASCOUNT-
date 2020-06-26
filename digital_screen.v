//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:22 06/04/2020 
// Design Name: 
// Module Name:    digital_screen 
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
module digital_screen(clock,key1,time1,time2,time3,time4,time5,time6,
                      mark_a1,mark_a2,mark_a3,mark_b1,mark_b2,mark_b3,out_data,c_pin);
input clock,key1;
input [7:0]time1,time2,time3,time4,time5,time6;
input [7:0]mark_a1,mark_a2,mark_a3,mark_b1,mark_b2,mark_b3;
output [7:0]out_data;
reg [7:0]out_data;
output [5:0]c_pin;
reg [5:0]c_pin;
reg [5:0]state;
reg [5:0]state1;
			initial 
			begin
			state1=6'b000001;
			state=6'b000001;
			end
			//always @ (posedge clock or negedge key8)
			always @ (posedge clock)
			if(!key1)//按键按下，运行时间显示选择模块
				begin
						case(state1)
					  6'b000001:begin
						       out_data<=time6;
								 c_pin<=6'b000001;
								 state1<=6'b000010;
						       end
					  6'b000010:begin
						       out_data<=time5;
								 c_pin<=6'b000010;
								 state1<=6'b000100;
						       end
					  6'b000100:begin
						       out_data<=time4;
								 c_pin<=6'b000100;
								 state1<=6'b001000;
						       end
					  6'b001000:begin
						       out_data<=time3;
								 c_pin<=6'b001000;
								 state1<=6'b010000;
						       end
					  6'b010000:begin
						       out_data<=time2;
								 c_pin<=6'b010000;
								 state1<=6'b100000;
						       end
					  6'b100000:begin
						       out_data<=time1;
								 c_pin<=6'b100000;
								 state1<=6'b000001;
						       end
						default:begin
						       out_data<=8'b11111111;
								 c_pin<=6'b111111;
								 state1<=6'b000001;
								 end
						endcase
				end
			else
				begin
					   case(state)
						6'b000001:begin
						       out_data<=mark_b1;
								 c_pin<=6'b000001;
								 state<=6'b000010;
						       end
					   6'b000010:begin
						       out_data<=mark_b2;
								 c_pin<=6'b000010;
								 state<=6'b000100;
						       end
						6'b000100:begin
						       out_data<=mark_b3;
								 c_pin<=6'b000100;
								 state<=6'b001000;
						       end
						6'b001000:begin
						       out_data<=mark_a1;
								 c_pin<=6'b001000;
								 state<=6'b010000;
						       end
						6'b010000:begin
						       out_data<=mark_a2;
								 c_pin<=6'b010000;
								 state<=6'b100000;
						       end
						6'b100000:begin
						       out_data<=mark_a3;
								 c_pin<=6'b100000;
								 state<=6'b000001;
						       end
						default:begin
						       out_data<=8'b11111111;
								 c_pin<=6'b111111;
								 state<=6'b000001;
								 end
						endcase
				end


endmodule
