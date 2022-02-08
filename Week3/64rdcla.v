`include "kpg.v"
`include "DFF.v"

module rdcla(sum, cout, a, b, cin, clk);

	input [63:0] a, b;
	input cin;
	output [63:0] sum;
	output cout;
	input wire clk;

	wire [64:0] partial_sum;
	wire [64:0] carry0, carry1;
	wire [64:0] carry0_1, carry1_1, carry0_2, carry1_2, carry0_4, carry1_4, carry0_8, carry1_8, carry0_16, carry1_16, carry0_32, carry1_32;
	wire [64:0] carry0_1_in, carry1_1_in, carry0_2_in, carry1_2_in, carry0_4_in, carry1_4_in, carry0_8_in, carry1_8_in, carry0_16_in, carry1_16_in, carry0_32_in, carry1_32_in;

	assign carry0[0] = cin;
	assign carry1[0] = cin;
	
	kpg_init init [64:1] (carry1[64:1], carry0[64:1], a[63:0], b[63:0], clk);

	assign carry1_1[0] = cin;
	assign carry0_1[0] = cin;
	assign carry1_2[1:0] = carry1_1[1:0];
	assign carry0_2[1:0] = carry0_1[1:0];
	assign carry1_4[3:0] = carry1_2[3:0];
	assign carry0_4[3:0] = carry0_2[3:0];
	assign carry1_8[7:0] = carry1_4[7:0];
	assign carry0_8[7:0] = carry0_4[7:0];
	assign carry1_16[15:0] = carry1_8[15:0];
	assign carry0_16[15:0] = carry0_8[15:0];
	assign carry1_32[31:0] = carry1_16[31:0];
	assign carry0_32[31:0] = carry0_16[31:0];

	kpg itr_1 [64:1] (carry1[64:1], carry0[64:1], carry1[63:0], carry0[63:0], carry1_1_in[64:1], carry0_1_in[64:1], clk);
	DFF itr_1_dff_1 [64:1] (carry1_1_in[64:1], carry1_1[64:1], clk);
	DFF itr_1_dff_0 [64:1] (carry0_1_in[64:1], carry0_1[64:1], clk);

	kpg itr_2 [64:2] (carry1_1[64:2], carry0_1[64:2], carry1_1[62:0], carry0_1[62:0], carry1_2_in[64:2], carry0_2_in[64:2], clk);
	DFF itr_2_dff_1 [64:2] (carry1_2_in[64:2], carry1_2[64:2], clk);
	DFF itr_2_dff_0 [64:2] (carry0_2_in[64:2], carry0_2[64:2], clk);
	
	kpg itr_4 [64:4] (carry1_2[64:4], carry0_2[64:4], carry1_2[60:0], carry0_2[60:0], carry1_4_in[64:4], carry0_4_in[64:4], clk);
	DFF itr_4_dff_1 [64:4] (carry1_4_in[64:4], carry1_4[64:4], clk);
	DFF itr_4_dff_0 [64:4] (carry0_4_in[64:4], carry0_4[64:4], clk);

	kpg itr_8 [64:8] (carry1_4[64:8], carry0_4[64:8], carry1_4[56:0], carry0_4[56:0], carry1_8_in[64:8], carry0_8_in[64:8], clk);
	DFF itr_8_dff_1 [64:8] (carry1_8_in[64:8], carry1_8[64:8], clk);
	DFF itr_8_dff_0 [64:8] (carry0_8_in[64:8], carry0_8[64:8], clk);

	kpg itr_16 [64:16] (carry1_8[64:16], carry0_8[64:16], carry1_8[48:0], carry0_8[48:0], carry1_16_in[64:16], carry0_16_in[64:16], clk);
	DFF itr_16_dff_1 [64:16] (carry1_16_in[64:16], carry1_16[64:16], clk);
	DFF itr_16_dff_0 [64:16] (carry0_16_in[64:16], carry0_16[64:16], clk);

	kpg itr_32 [64:32] (carry1_16[64:32], carry0_16[64:32], carry1_16[32:0], carry0_16[32:0], carry1_32_in[64:32], carry0_32_in[64:32], clk);
	DFF itr_32_dff_1 [64:32] (carry1_32_in[64:32], carry1_32[64:32], clk);
	DFF itr_32_dff_0 [64:32] (carry0_32_in[64:32], carry0_32[64:32], clk);

	assign partial_sum[63:0] = a^b;
	assign sum[63:0] = (partial_sum[63:0]^carry0_32[63:0]);
	assign cout = carry0_32[64];

endmodule