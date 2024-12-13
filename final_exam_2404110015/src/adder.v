`timescale 1ns/1ps

module adder(
	clk,
	rst_n,
	in1,
	in2,
	in3,
	in4,
	out
);

input wire clk;
input wire rst_n;
input wire [12:0] in1;
input wire [12:0] in2;
input wire [12:0] in3;
input wire [12:0] in4;
output reg [14:0] out;

//First add ready add1 = (in1 + in2) ready add2 = (in3 + in4)//
reg [13:0] temp_add1;
always @(posedge clk, negedge rst_n)
begin
	if( ~rst_n ) begin
		temp_add1 <= 14'b0;
	end	
	else begin
		temp_add1 <= {1'b0, in1} + {1'b0, in2}; 
	end
end

reg [13:0] temp_add2;
always @(posedge clk, negedge rst_n)
begin
	if( ~rst_n ) begin
		temp_add2 <= 14'b0;
	end	
	else begin
		temp_add2 <= {1'b0, in3} + {1'b0, in4}; 
	end	
end
//First add end//

//Second add add1 + add2//
always @(posedge clk, negedge rst_n)
begin
	if( ~rst_n ) begin
		out <= 15'b0;
	end	
	else begin
		out <= {1'b0, temp_add1} + {1'b0, temp_add2}; 
	end
end
//Second add end//

endmodule
