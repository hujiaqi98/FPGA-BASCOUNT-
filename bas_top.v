//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:52:53 06/05/2020 
// Design Name: 
// Module Name:    bas_top 
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
module bas_top(CLOCK,RST,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,
              OUT_DATA,C_PIN);
input CLOCK,RST;
input KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8;
output [7:0]OUT_DATA;
//reg [7:0]OUT_DATA;
output [5:0]C_PIN;
//reg [2:0]C_PIN;
wire one_time;
wire [7:0]time24_a,time24_b;
wire [7:0]time12_a,time12_b,time12_c,time12_d;
wire [7:0]mark_ab,mark_as,mark_ag,mark_bb,mark_bs,mark_bg;
frequency_divider uut(
							  .clk(CLOCK),
							  .rst(RST),
							  .out(one_time)
                       );
attack_time uut2(
						.clock(one_time),
						.key2(KEY2),
						.q(time24_a),//24s计时十分位
						.b(time24_b)//24s计时个分位
					  );
subsec_time uut3(
					   .clock(one_time),
						.rst(RST),
						
						.a(time12_a),//12m计时十分钟   1
						.s(time12_b),//12m计时分钟位   2
						.d(time12_c),//12m计时十分秒   0 
						.f(time12_d)//12m计时秒钟位    0
					  );
mark uut4(
          .rst(RST),
			 .key3(KEY3),
			 .key4(KEY4),
			 .key5(KEY5),
			 .key6(KEY6),
			 .key7(KEY7),
			 .key8(KEY8),
			 .a1(mark_ag),
			 .a2(mark_as),
			 .a3(mark_ab),
			 .b1(mark_bg),
			 .b2(mark_bs),
			 .b3(mark_bb)
          );
digital_screen uut5(
                     .clock(CLOCK),
							.key1(KEY1),
							.time1(time24_a),
							.time2(time24_b),
							.time3(time12_a),
							.time4(time12_b),
							.time5(time12_c),
							.time6(time12_d),
							.mark_a1(mark_ag),
							.mark_a2(mark_as),
							.mark_a3(mark_ab),
							.mark_b1(mark_bg),
							.mark_b2(mark_bs),
							.mark_b3(mark_bb),
							.out_data(OUT_DATA),
							.c_pin(C_PIN)
						  );
		 
endmodule
