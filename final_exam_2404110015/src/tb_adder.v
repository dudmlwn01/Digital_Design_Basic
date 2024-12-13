`timescale 1ns/1ps

module tb_adder();

reg		  clk;
reg	        rst_n;
reg  [12:0]   	  in1;	//13bit
reg  [12:0] 	  in2;
reg  [12:0] 	  in3;
reg  [12:0] 	  in4;
wire [14:0] adder_out;

always #5 clk = ~clk;

initial begin
	clk   =  1'b0;
	rst_n =  1'b0;
	in1   = 13'd0;
	in2   = 13'd0;
	in3   = 13'd0;
	in4   = 13'd0;
	
	#10
	rst_n = 1'b1;
	
	#30
	in1 = 13'd1111; in2 = 13'd1111; in3 = 13'd1111; in4 = 13'd1111;

	#10
	in1 = 13'd3333; in2 = 13'd3333; in3 = 13'd3333; in4 = 13'd3333;

	#10
	in1 = 13'd5555; in2 = 13'd5555; in3 = 13'd5555; in4 = 13'd5555;

	#140
	rst_n = 1'b0;

	#100
	$finish;
end

adder DUT(
	.clk(clk),
	.rst_n(rst_n),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.in4(in4),
	.out(adder_out)
);

endmodule

	
	
	

