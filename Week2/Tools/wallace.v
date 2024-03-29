`include "Tools/FA.v"

module FullAdder(A,B,Cin, Sum);
	input A,B, Cin;
	output Sum;
	assign Sum= A^B^Cin;
endmodule

module partial_products (
	input [63:0]a,
	input [63:0]b,
	output reg [63:0][127:0]p_prods
);

	integer i;
	always @(a or b)
	begin
		for(i=0; i<64; i=i+1)begin
			if(b[i] == 1)begin
				p_prods[i] <= a << i;
			end
			else
				p_prods[i] = 128'h00000000;
		end
	end

endmodule

module FA (
	input [127:0] x,
	input [127:0] y,
	input [127:0] z,
	output[127:0] u,
	output[127:0] v);

assign u = x^y^z;
assign v[0] = 0;
assign v[127:1] = (x&y) | (y&z) | (z&x);

endmodule

module wallace (
	input [63:0] a,
	input [63:0] b,
	output[127:0] out
);

	wire [63:0][127:0]p_prods;
	integer i;
	
	partial_products pp (a, b, p_prods);

	
	//The following is for level 1 of wallace tree
	wire [127:0] u_l11, v_l11, u_l12, v_l12, u_l13, v_l13, u_l14, v_l14, u_l15, v_l15, u_l16, v_l16, u_l17, v_l17, u_l18, v_l18, u_l19, v_l19, u_l110, v_l110 ,
				 u_l111 ,v_l111 ,u_l112 ,v_l112 ,u_l113 ,v_l113 ,u_l114 ,v_l114 ,u_l115 ,v_l115 ,u_l116 ,v_l116 ,u_l117 ,v_l117 ,u_l118 ,v_l118 ,u_l119 ,v_l119 ,u_l120 ,v_l120,u_l121 ,v_l121 ;

	FA l11  (p_prods[0 ][127:0], p_prods[1 ][127:0], p_prods[2 ][127:0], u_l11[127:0],   v_l11[127:0]);
	FA l12  (p_prods[3 ][127:0], p_prods[4 ][127:0], p_prods[5 ][127:0], u_l12[127:0],   v_l12[127:0]);
	FA l13  (p_prods[6 ][127:0], p_prods[7 ][127:0], p_prods[8 ][127:0], u_l13[127:0],   v_l13[127:0]);
	FA l14  (p_prods[9 ][127:0], p_prods[10][127:0], p_prods[11][127:0], u_l14[127:0],   v_l14[127:0]);
	FA l15  (p_prods[12][127:0], p_prods[13][127:0], p_prods[14][127:0], u_l15[127:0],   v_l15[127:0]);
	FA l16  (p_prods[15][127:0], p_prods[16][127:0], p_prods[17][127:0], u_l16[127:0],   v_l16[127:0]);
	FA l17  (p_prods[18][127:0], p_prods[19][127:0], p_prods[20][127:0], u_l17[127:0],   v_l17[127:0]);
	FA l18  (p_prods[21][127:0], p_prods[22][127:0], p_prods[23][127:0], u_l18[127:0],   v_l18[127:0]);
	FA l19  (p_prods[24][127:0], p_prods[25][127:0], p_prods[26][127:0], u_l19[127:0],   v_l19[127:0]);
	FA l110 (p_prods[27][127:0], p_prods[28][127:0], p_prods[29][127:0], u_l110[127:0], v_l110[127:0]);
	FA l111 (p_prods[30][127:0], p_prods[31][127:0], p_prods[32][127:0], u_l111[127:0], v_l111[127:0]);
	FA l112 (p_prods[33][127:0], p_prods[34][127:0], p_prods[35][127:0], u_l112[127:0], v_l112[127:0]);
	FA l113 (p_prods[36][127:0], p_prods[37][127:0], p_prods[38][127:0], u_l113[127:0], v_l113[127:0]);
	FA l114 (p_prods[39][127:0], p_prods[40][127:0], p_prods[41][127:0], u_l114[127:0], v_l114[127:0]);
	FA l115 (p_prods[42][127:0], p_prods[43][127:0], p_prods[44][127:0], u_l115[127:0], v_l115[127:0]);
	FA l116 (p_prods[45][127:0], p_prods[46][127:0], p_prods[47][127:0], u_l116[127:0], v_l116[127:0]);
	FA l117 (p_prods[48][127:0], p_prods[49][127:0], p_prods[50][127:0], u_l117[127:0], v_l117[127:0]);
	FA l118 (p_prods[51][127:0], p_prods[52][127:0], p_prods[53][127:0], u_l118[127:0], v_l118[127:0]);
	FA l119 (p_prods[54][127:0], p_prods[55][127:0], p_prods[56][127:0], u_l119[127:0], v_l119[127:0]);
	FA l120 (p_prods[57][127:0], p_prods[58][127:0], p_prods[59][127:0], u_l120[127:0], v_l120[127:0]);
	FA l121 (p_prods[60][127:0], p_prods[61][127:0], p_prods[62][127:0], u_l121[127:0], v_l121[127:0]);

	//p_prods[63][127:0]---->left over

	//The following is for level 2 of wallace tree
	wire [127:0] u_l21, v_l21, u_l22, v_l22, u_l23, v_l23, u_l24, v_l24, u_l25, v_l25, u_l26, v_l26, u_l27, v_l27, u_l28, v_l28, u_l29, v_l29, u_l210, v_l210 ,
				 u_l211 ,v_l211 ,u_l212 ,v_l212 ,u_l213 ,v_l213 ,u_l214 ,v_l214 ;

	FA l21 (u_l11 [127:0], v_l11[127:0],  u_l12[127:0],  u_l21[127:0],  v_l21[127:0]);
	FA l22 (v_l12 [127:0], u_l13[127:0],  v_l13[127:0],  u_l22[127:0],  v_l22[127:0]);
	FA l23 (u_l14 [127:0], v_l14[127:0],  u_l15[127:0],  u_l23[127:0],  v_l23[127:0]);
	FA l24 (v_l15 [127:0], u_l16[127:0],  v_l16[127:0],  u_l24[127:0],  v_l24[127:0]);
	FA l25 (u_l17 [127:0], v_l17[127:0],  u_l18[127:0],  u_l25[127:0],  v_l25[127:0]);
	FA l26 (v_l18 [127:0], u_l19[127:0],  v_l19[127:0],  u_l26[127:0],  v_l26[127:0]);
	FA l27 (u_l110[127:0], v_l110[127:0], u_l111[127:0], u_l27[127:0],  v_l27[127:0]);
	FA l28 (v_l111[127:0], u_l112[127:0], v_l112[127:0], u_l28[127:0],  v_l28[127:0]);
	FA l29 (u_l113[127:0], v_l113[127:0], u_l114[127:0], u_l29[127:0],  v_l29[127:0]);
	FA l210(v_l114[127:0], u_l115[127:0], v_l115[127:0], u_l210[127:0], v_l210[127:0]);
	FA l211(u_l116[127:0], v_l116[127:0], u_l117[127:0], u_l211[127:0], v_l211[127:0]);
	FA l212(v_l117[127:0], u_l118[127:0], v_l118[127:0], u_l212[127:0], v_l212[127:0]);
	FA l213(u_l119[127:0], v_l119[127:0], u_l120[127:0], u_l213[127:0], v_l213[127:0]);
	FA l214(v_l120[127:0], u_l121[127:0], v_l121[127:0], u_l214[127:0], v_l214[127:0]);

	//The following is for level 3 of wallace tree
	wire [127:0] u_l31, v_l31, u_l32, v_l32, u_l33, v_l33, u_l34, v_l34, u_l35, v_l35, u_l36, v_l36, u_l37, v_l37, u_l38, v_l38, u_l39, v_l39;

	FA l31 (u_l21[127:0],  v_l21[127:0],   u_l22[127:0], u_l31[127:0], v_l31[127:0]);
	FA l32 (v_l22[127:0],  u_l23[127:0],   v_l23[127:0], u_l32[127:0], v_l32[127:0]);
	FA l33 (u_l24[127:0],  v_l24[127:0],   u_l25[127:0], u_l33[127:0], v_l33[127:0]);
	FA l34 (v_l25[127:0],  u_l26[127:0],   v_l26[127:0], u_l34[127:0], v_l34[127:0]);
	FA l35 (u_l27[127:0],  v_l27[127:0],   u_l28[127:0], u_l35[127:0], v_l35[127:0]);
	FA l36 (v_l28[127:0],  u_l29[127:0],   v_l29[127:0], u_l36[127:0], v_l36[127:0]);
	FA l37 (u_l210[127:0], v_l210[127:0], u_l211[127:0], u_l37[127:0], v_l37[127:0]);
	FA l38 (v_l211[127:0], u_l212[127:0], v_l212[127:0], u_l38[127:0], v_l38[127:0]);
	FA l39 (u_l213[127:0], v_l213[127:0], u_l214[127:0], u_l39[127:0], v_l39[127:0]);

	//v_l214[127:0]---->left over

	// The following is for level 4 of wallace tree
	wire [127:0] u_l41, v_l41, u_l42, v_l42, u_l43, v_l43, u_l44, v_l44, u_l45, v_l45, u_l46, v_l46;

	FA l41 (u_l31[127:0], v_l31[127:0], u_l32[127:0], u_l41[127:0], v_l41[127:0]);
	FA l42 (v_l32[127:0], u_l33[127:0], v_l33[127:0], u_l42[127:0], v_l42[127:0]);
	FA l43 (u_l34[127:0], v_l34[127:0], u_l35[127:0], u_l43[127:0], v_l43[127:0]);
	FA l44 (v_l35[127:0], u_l36[127:0], v_l36[127:0], u_l44[127:0], v_l44[127:0]);
	FA l45 (u_l37[127:0], v_l37[127:0], u_l38[127:0], u_l45[127:0], v_l45[127:0]);
	FA l46 (v_l38[127:0], u_l39[127:0], v_l39[127:0], u_l46[127:0], v_l46[127:0]);
	

	// The following is for level 5 of wallace tree
	wire [127:0] u_l51, v_l51, u_l52, v_l52, u_l53, v_l53, u_l54, v_l54, u_l55, v_l55;

	FA l51 (u_l41[127:0], v_l41[127:0], u_l42[127:0], u_l51[127:0], v_l51[127:0]);
	FA l52 (v_l42[127:0], u_l43[127:0], v_l43[127:0], u_l52[127:0], v_l52[127:0]);
	FA l53 (u_l44[127:0], v_l44[127:0], u_l45[127:0], u_l53[127:0], v_l53[127:0]);
	FA l54 (v_l45[127:0], u_l46[127:0], v_l46[127:0], u_l54[127:0], v_l54[127:0]);

	// The following is for level 6 of wallace tree
	wire [127:0] u_l61, v_l61, u_l62, v_l62, u_l63, v_l63, u_l64, v_l64;

	FA l61 (u_l51[127:0], v_l51[127:0], u_l52[127:0], u_l61[127:0], v_l61[127:0]);
	FA l62 (v_l52[127:0], u_l53[127:0], v_l53[127:0], u_l62[127:0], v_l62[127:0]);
	FA l63(u_l54[127:0],v_l54[127:0],p_prods[63][127:0],u_l63[127:0],v_l63[127:0]);

	//u_l54[127:0] and v_l54[127:0] are left over

	// The following is for level 7 of wallace tree
	wire [127:0] u_l71, v_l71, u_l72, v_l72;

	FA l71 (u_l61[127:0], v_l61[127:0], u_l62[127:0], u_l71[127:0], v_l71[127:0]);
	FA l72 (v_l62[127:0], u_l63[127:0], v_l63[127:0], u_l72[127:0], v_l72[127:0]);

	// The following is for level 8 of wallace tree
	wire [127:0] u_l81, v_l81 , u_l82, v_l82,u;
	
	FA l81 (u_l71[127:0],v_l71[127:0], u_l72[127:0], u_l81[127:0], v_l81[127:0]);

	// The following is for level 9 of wallace tree
	wire [127:0] u_l91, v_l91;
	FA l91 (u_l81[127:0], v_l81[127:0], v_l72[127:0], u_l91[127:0], v_l91[127:0]);

    wire [127:0] u_l101, v_l101;
	FA l101 (u_l91[127:0], v_l91[127:0], v_l214[127:0], u_l101[127:0], v_l101[127:0]);

	// The following is for level 11 of wallace tree
	wire c;
	RPA l1111 (u_l101[63:0]  , v_l101[63:0], 1'b0,out[63:0],  c);
	RPA l1112 (u_l101[127:64], v_l101[127:64],c,out[127:64],  );

endmodule