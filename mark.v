//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:56 06/03/2020 
// Design Name: 
// Module Name:    mark 
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
module mark(rst,key3,key4,key5,key6,key7,key8,a1,a2,a3,b1,b2,b3
              );
input rst,key3,key4;
input key5,key6,key7,key8;
output [7:0]a1,a2,a3;
reg [7:0]a1,a2,a3;
output [7:0]b1,b2,b3;
reg [7:0]b1,b2,b3;
reg [7:0]a,b,c;//数据中介寄存器
	//reg [2:0]a_all;
	//reg [2:0]b_all;
reg [3:0]a_all_b,a_all_s,a_all_g;
reg [3:0]b_all_b,b_all_s,b_all_g;
integer i;
integer j;

          initial 
			 begin
			 a=8'b00000000;
			 b=8'b00000000;
			 c=8'b00000001;
			 end
			always @ (negedge rst or negedge key8)
	begin
			//always @ (negedge key5 or negedge key6 or negedge 7 or negedge rst)
			if(!rst)
			   begin
			 /*a1<=8'b11000000;//0
            a2<=8'b11000000;//0
				a3<=8'b11000000;//0
				b1<=8'b11000000;//0
				b2<=8'b11000000;//0
				b3<=8'b11000000;//0*/
				a<=8'b00000000;
				b<=8'b00000000;
				c<=8'b00000000;
				end
			else	
            begin
						if(key3)//a方数据变更
								begin
								if(key4)//数据上拉
								    begin
									      if(!key5)//上拉一分
												a<=a+2'b01;
											else if(!key6)//上拉两分
												  a<=a+2'b10;
											  	  else//上拉三分
												  a<=a+2'b11;
									 end
									 
								else//数据下拉
								     begin
									       if(!key5)//下拉一分
												a<=a-2'b01;
											else if(!key6)//下拉两分
												  a<=a-2'b10;
												  else//下拉三分
												  a<=a-2'b11;
									  end
								end
						else//b方数据变更
						      begin 
								if(key4)//数据上拉
								    begin
									      if(!key5)//上拉一分
											     b<=b+2'b01;
											else if(!key6)//上拉两分
											     b<=b+2'b10;
											  	  else//上拉三分
												  b<=b+2'b11;
									     
									 end
								else//数据下拉
								     begin
									       if(!key5)//下拉一分
												 b<=b-2'b01;
										 	else if(!key6)//下拉两分
											    b<=b-2'b10;
												  else//下拉三分
												 b<=b-2'b11;
									  end
					        end
					end
							
		end					
							always@(a or b or c)
							begin
                        a_all_b=4'd0;
                    		a_all_s=4'd0;
								a_all_g=4'd0;
								for (i=4'd7;i>=0;i=i-1)
								begin 
								    if(a_all_b>=4'd5)
									    a_all_b=a_all_b+4'd3;
									 if(a_all_s>=4'd5)
									    a_all_s=a_all_s+4'd3;
									 if(a_all_g>=4'd5)
									    a_all_g=a_all_g+4'd3;
									a_all_b=a_all_b<<1;
									a_all_b[0]=a_all_s[3];
									a_all_s=a_all_s<<1;
									a_all_s[0]=a_all_g[3];
									a_all_g=a_all_g<<1;
									a_all_g[0]=a[i];
								end
								b_all_b=4'd0;
                    		b_all_s=4'd0;
								b_all_g=4'd0;
								for (j=4'd7;j>=0;j=j-1)
								begin 
								    if(b_all_b>=4'd5)
									    b_all_b=b_all_b+4'd3;
									 if(b_all_s>=4'd5)
									    b_all_s=b_all_s+4'd3;
									 if(b_all_g>=4'd5)
									    b_all_g=b_all_g+4'd3;
									b_all_b=b_all_b<<1;
									b_all_b[0]=b_all_s[3];
									b_all_s=b_all_s<<1;
									b_all_s[0]=b_all_g[3];
									b_all_g=b_all_g<<1;
									b_all_g[0]=b[j];
								end
								
									
								
				/*
				//阶段一 加权十进制化
				a_all<=(a[9]*3'd512)+(a[8]*3'd256)+(a[7]*3'd128)+(a[6]*2'd64)+(a[5]*2'd32)+(a[4]*2'd16)+(a[3]*1'd8)+(a[2]*1'd4)+(a[1]*1'd2)+(a[0]*1'd1);
				b_all<=(b[9]*3'd512)+(b[8]*3'd256)+(b[7]*3'd128)+(b[6]*2'd64)+(b[5]*2'd32)+(b[4]*2'd16)+(b[3]*1'd8)+(b[2]*1'd4)+(b[1]*1'd2)+(b[0]*1'd1);
				//阶段二 位分割
				a_all_b<=a_all[2];
				a_all_s<=a_all[1];
				a_all_g<=a_all[0];
				b_all_b<=b_all[2];
				b_all_s<=b_all[1];
				b_all_g<=b_all[0];*/
				//阶段三 七段数码管显示转换


           
		   	case(a_all_b)
				4'd0:a3<=8'b11000000;//0
				4'd1:a3<=8'b11111001;//1
				4'd2:a3<=8'b10100100;//2
				4'd3:a3<=8'b10110000;//3
            4'd4:a3<=8'b10011001;//4
				4'd5:a3<=8'b10010010;//5
				4'd6:a3<=8'b10000010;//6
				4'd7:a3<=8'b11111000;//7
				4'd8:a3<=8'b10000000;//8
				4'd9:a3<=8'b10010000;//9
				default:a3<=8'b11111111;
				endcase
				case(a_all_s)
				4'd0:a2<=8'b11000000;//0
				4'd1:a2<=8'b11111001;//1
				4'd2:a2<=8'b10100100;//2
				4'd3:a2<=8'b10110000;//3
            4'd4:a2<=8'b10011001;//4
				4'd5:a2<=8'b10010010;//5
				4'd6:a2<=8'b10000010;//6
				4'd7:a2<=8'b11111000;//7
				4'd8:a2<=8'b10000000;//8
				4'd9:a2<=8'b10010000;//9
				default:a2<=8'b11111111;
				endcase
				case(a_all_g)
				4'd0:a1<=8'b11000000;//0
				4'd1:a1<=8'b11111001;//1
				4'd2:a1<=8'b10100100;//2
				4'd3:a1<=8'b10110000;//3
            4'd4:a1<=8'b10011001;//4
				4'd5:a1<=8'b10010010;//5
				4'd6:a1<=8'b10000010;//6
				4'd7:a1<=8'b11111000;//7
				4'd8:a1<=8'b10000000;//8
				4'd9:a1<=8'b10010000;//9
				default:a1<=8'b11111111;
				endcase
				case(b_all_b)
				4'd0:b3<=8'b11000000;//0
				4'd1:b3<=8'b11111001;//1
				4'd2:b3<=8'b10100100;//2
				4'd3:b3<=8'b10110000;//3
            4'd4:b3<=8'b10011001;//4
				4'd5:b3<=8'b10010010;//5
				4'd6:b3<=8'b10000010;//6
				4'd7:b3<=8'b11111000;//7
				4'd8:b3<=8'b10000000;//8
				4'd9:b3<=8'b10010000;//9
				default:b3<=8'b11111111;
				endcase
				case(b_all_s)
				4'd0:b2<=8'b11000000;//0
				4'd1:b2<=8'b11111001;//1
				4'd2:b2<=8'b10100100;//2
				4'd3:b2<=8'b10110000;//3
            4'd4:b2<=8'b10011001;//4
				4'd5:b2<=8'b10010010;//5
				4'd6:b2<=8'b10000010;//6
				4'd7:b2<=8'b11111000;//7
				4'd8:b2<=8'b10000000;//8
				4'd9:b2<=8'b10010000;//9
				default:b2<=8'b11111111;
				endcase
				case(b_all_g)
				4'd0:b1<=8'b11000000;//0
				4'd1:b1<=8'b11111001;//1
				4'd2:b1<=8'b10100100;//2
				4'd3:b1<=8'b10110000;//3
            4'd4:b1<=8'b10011001;//4
				4'd5:b1<=8'b10010010;//5
				4'd6:b1<=8'b10000010;//6
				4'd7:b1<=8'b11111000;//7
				4'd8:b1<=8'b10000000;//8
				4'd9:b1<=8'b10010000;//9
				default:b1<=8'b11111111;
				endcase
				
				
				
				
				end

endmodule
