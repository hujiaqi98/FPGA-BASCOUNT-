//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:27 06/03/2020 
// Design Name: 
// Module Name:    attack_time 
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
module attack_time(clock, key2,q,b
    );
input clock,key2;
output [7:0]q,b;
reg [7:0]q,b;
reg [4:0]state;
always @(posedge clock or negedge key2)
begin
if(!key2)
	begin
	q<=8'b10100100;
	b<=8'b10011001;
	state<=5'b00000;
	end
else
	begin
	case(state)
    5'b00000:begin
	      q<=8'b10100100;//2
			b<=8'b10110000;//3
			state<=5'b00001;
			end
    5'b00001:begin
	      q<=8'b10100100;//2
			b<=8'b10100100;//2
			state<=5'b00010;
			end
    5'b00010:begin
	      q<=8'b10100100;//2
			b<=8'b11111001;//1
			state<=5'b00011;
			end
    5'b00011:begin
	      q<=8'b10100100;//2
			b<=8'b11000000;//0
			state<=5'b00100;
			end
    5'b00100:begin
	      q<=8'b11111001;//1
			b<=8'b10010000;//9
			state<=5'b00101;
			end
    5'b00101:begin
	      q<=8'b11111001;//1
			b<=8'b10000000;//8
			state<=5'b00110;
			end
    5'b00110:begin
	      q<=8'b11111001;//1
			b<=8'b11111000;//7
			state<=5'b00111;
			end
    5'b00111:begin
	      q<=8'b11111001;//1
			b<=8'b10000010;//6
			state<=5'b01000;
			end
    5'b01000:begin
	      q<=8'b11111001;//1
			b<=8'b10010010;//5
			state<=5'b01001;
			end
    5'b01001:begin
	      q<=8'b11111001;//1
			b<=8'b10011001;//4
			state<=5'b01010;
			end	
    5'b01010:begin
	      q<=8'b11111001;//1
			b<=8'b10110000;//3
			state<=5'b01011;
			end
    5'b01011:begin
	      q<=8'b11111001;//1
			b<=8'b10100100;//2
			state<=5'b01100;
			end
    5'b01100:begin
	      q<=8'b11111001;//1
			b<=8'b11111001;//1
			state<=5'b01101;
			end
    5'b01101:begin
	      q<=8'b11111001;//1
			b<=8'b11000000;//0
			state<=5'b01110;
			end
    5'b01110:begin
	      q<=8'b11000000;//0
			b<=8'b10010000;//9
			state<=5'b01111;
			end
    5'b01111:begin
	      q<=8'b11000000;//0
			b<=8'b10000000;//8
			state<=5'b10000;
			end
    5'b10000:begin
	      q<=8'b11000000;//0
			b<=8'b11111000;//7
			state<=5'b10001;
			end
    5'b10001:begin
	      q<=8'b11000000;//0
			b<=8'b10000010;//6
			state<=5'b10010;
			end
    5'b10010:begin
	      q<=8'b11000000;//0
			b<=8'b10010010;//5
			state<=5'b10011;
			end
    5'b10011:begin
	      q<=8'b11000000;//0
			b<=8'b10011001;//4
			state<=5'b10100;
			end
    5'b10100:begin
	      q<=8'b11000000;//0
			b<=8'b10110000;//3
			state<=5'b10101;
			end
    5'b10101:begin
	      q<=8'b11000000;//0
			b<=8'b10100100;//2
			state<=5'b10110;
			end
    5'b10110:begin
	      q<=8'b11000000;//0
			b<=8'b11111001;//1
			state<=5'b10111;
			end
    5'b10111:begin
	      q<=8'b11000000;//0
			b<=8'b11000000;//0
			state<=5'b00000;
			end
	default:begin
	      q<=8'b11111111;//0
			b<=8'b11111111;//0
			state<=5'b00000;
	      end
    endcase
	end
end

endmodule

