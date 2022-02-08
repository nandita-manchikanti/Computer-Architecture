`include "64rdcla.v"

module top;
reg [63:0] a, b;
wire [63:0] s;
wire cout;
reg cin;
reg clk;

rdcla test (s, cout, a, b, cin, clk);

initial
begin

	a = 64'd123;
	b = 64'd127;
	cin = 1'b0;
	#30 $finish;
end

initial begin
	clk = 0;
	forever begin
		#1 clk = ~clk;
	end
end

initial
begin
	$monitor("# a = %d; b = %d; carry_in = %d; sum = %d; sum=%b carry_out = %d;", a, b,cin,s,s,cout);
end
endmodule