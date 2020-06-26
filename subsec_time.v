//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:07 06/03/2020 
// Design Name: 
// Module Name:    subsec_time 
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
module subsec_time(clock,rst,a,s,d,f
    );
input clock,rst;
output reg [7:0]a,s,d,f;
//reg [7:0]a,s,d,f;
reg [4:0]state,state2,state3;
    
          //always @ (posedge clock)
			always @ (posedge clock or negedge rst)

			if(!rst)
			  begin
			  a<=8'b11111001;//1
			  s<=8'b10100100;//2
			  d<=8'b11000000;//0
			  f<=8'b11000000;//0
			  state3<=5'b00000;
			  state2<=5'b00000;
			  state<=5'b00000;
			  end
			else
			  begin
					case(state)
					5'b00000:begin
					         a<=8'b11111001;//1
								s<=8'b11111001;//1
								d<=8'b10010010;//5
								f<=8'b10010000;//9
								state<=5'b00001;
								end
			      5'b00001:begin
								f<=8'b10000000;//8
								state<=5'b00010;
	                     end
					5'b00010:begin
								f<=8'b11111000;//7
								state<=5'b00011;
	                     end
					5'b00011:begin
								f<=8'b10000010;//6
								state<=5'b00100;
	                     end
					5'b00100:begin
								f<=8'b10010010;//5
								state<=5'b00101;
	                     end
					5'b00101:begin
								f<=8'b10011001;//4
								state<=5'b00110;
	                     end
					5'b00110:begin
								f<=8'b10110000;//3
								state<=5'b00111;
	                     end
					5'b00111:begin
								f<=8'b10100100;//2
								state<=5'b01000;
	                     end
					5'b01000:begin
								f<=8'b11111001;//1
								state<=5'b01001;
	                     end
					5'b01001:begin
								f<=8'b11000000;//0
								state<=5'b01010;
	                     end
					5'b01010:begin
								f<=8'b10010000;//9
								state<=5'b00001;
												case(state2)
												5'b00000:begin
												         d<=8'b10011001;//4
															state2<=5'b00001;
												         end
												5'b00001:begin
												         d<=8'b10110000;//3
															state2<=5'b00010;
												         end
												5'b00010:begin
												         d<=8'b10100100;//2
															state2<=5'b00011;
												         end
												5'b00011:begin
												         d<=8'b11111001;//1
															state2<=5'b00100;
												         end
												5'b00100:begin
												         d<=8'b11000000;//0
															state2<=5'b00101;
												         end
												5'b00101:begin
												         d<=8'b10010010;//5
															state2<=5'b00000;
																		case(state3)
																		5'b00000:begin
																		         s<=8'b11000000;//0
																					state3<=5'b00001;
																		         end
																		5'b00001:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10010000;//9
																					state3<=5'b00010;
																		         end
																		5'b00010:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10000000;//8
																					state3<=5'b00011;
																		         end
																		5'b00011:begin
																		         a<=8'b11000000;//0
																		         s<=8'b11111000;//7
																					state3<=5'b00100;
																		         end
																		5'b00100:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10000010;//6
																					state3<=5'b00101;
																		         end
																		5'b00101:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10010010;//5
																					state3<=5'b00110;
																		         end
																		5'b00110:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10011001;//4
																					state3<=5'b00111;
																		         end
																		5'b00111:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10110000;//3
																					state3<=5'b01000;
																		         end
																		5'b01000:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10100100;//2
																					state3<=5'b01001;
																		         end
																		5'b01001:begin
																		         a<=8'b11000000;//0
																		         s<=8'b11111001;//1
																					state3<=5'b01010;
																		         end
																		5'b01010:begin
																		         a<=8'b11000000;//0
																		         s<=8'b11000000;//0
																					state3<=5'b01011;
																		         end
																		5'b01011:begin
																		         a<=8'b11000000;//0
																		         s<=8'b10110000;//3
																					state3<=5'b00000;
																					state2<=5'b00000;
																					state<=5'b00000;
																		         end
																		default:begin
																		         a<=8'b11111111;
																				   s<=8'b11111111;
																					d<=8'b11111111;
																				   f<=8'b11111111;
																				   state3<=5'b00000;
																		        end
																		endcase
												         end
												default:begin
												        d<=8'b11111111;
														  state2<=5'b00000;
												        end
												endcase
	                     end
					default:begin
					         a<=8'b11111111;
								s<=8'b11111111;
								d<=8'b11111111;
								f<=8'b11111111;
								state<=5'b00001;
					        end
					endcase
			  end




endmodule
