module FA_Structural(a,b,cin,sum,cout);
	input a,b,cin;
    output sum,cout;
    wire x,y,z;

    xor(x,a,b);
    xor(sum,x,cin);
    and(y,cin,x);
    and(z,a,b);
    or(cout,y,z);
endmodule

//64 bit addition
module RPA(a,b,cin,sum,cout);
	input [63:0] a,b;
    input cin;

    output wire [63:0] sum;
    output wire cout;
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,c61,c62;

	
	FA_Structural fa1(a[0],b[0],cin,sum[0],c0);
	FA_Structural fa2(a[1],b[1],c0,sum[1],c1);
	FA_Structural fa3(a[2],b[2],c1,sum[2],c2);
	FA_Structural fa4(a[3],b[3],c2,sum[3],c3);
    FA_Structural fa5(a[4],b[4],c3,sum[4],c4);
    FA_Structural fa6(a[5],b[5],c4,sum[5],c5);
    FA_Structural fa7(a[6],b[6],c5,sum[6],c6);
    FA_Structural fa8(a[7],b[7],c6,sum[7],c7);
    FA_Structural fa9(a[8],b[8],c7,sum[8],c8);
    FA_Structural fa10(a[9],b[9],c8,sum[9],c9);
    FA_Structural fa11(a[10],b[10],c9,sum[10],c10);
    FA_Structural fa12(a[11],b[11],c10,sum[11],c11);
    FA_Structural fa13(a[12],b[12],c11,sum[12],c12);
    FA_Structural fa14(a[13],b[13],c12,sum[13],c13);
    FA_Structural fa15(a[14],b[14],c13,sum[14],c14);
    FA_Structural fa16(a[15],b[15],c14,sum[15],c15);
    FA_Structural fa17(a[16],b[16],c15,sum[16],c16);
    FA_Structural fa18(a[17],b[17],c16,sum[17],c17);
    FA_Structural fa19(a[18],b[18],c17,sum[18],c18);
    FA_Structural fa20(a[19],b[19],c18,sum[19],c19);
    FA_Structural fa21(a[20],b[20],c19,sum[20],c20);
    FA_Structural fa22(a[21],b[21],c20,sum[21],c21);
    FA_Structural fa23(a[22],b[22],c21,sum[22],c22);
    FA_Structural fa24(a[23],b[23],c22,sum[23],c23);
    FA_Structural fa25(a[24],b[24],c23,sum[24],c24);
    FA_Structural fa26(a[25],b[25],c24,sum[25],c25);
    FA_Structural fa27(a[26],b[26],c25,sum[26],c26);
    FA_Structural fa28(a[27],b[27],c26,sum[27],c27);
    FA_Structural fa29(a[28],b[28],c27,sum[28],c28);
    FA_Structural fa30(a[29],b[29],c28,sum[29],c29);
    FA_Structural fa31(a[30],b[30],c29,sum[30],c30);
    FA_Structural fa32(a[31],b[31],c30,sum[31],c31);
    FA_Structural fa33(a[32],b[32],c31,sum[32],c32);
    FA_Structural fa34(a[33],b[33],c32,sum[33],c33);
    FA_Structural fa35(a[34],b[34],c33,sum[34],c34);
    FA_Structural fa36(a[35],b[35],c34,sum[35],c35);
    FA_Structural fa37(a[36],b[36],c35,sum[36],c36);	
    FA_Structural fa38(a[37],b[37],c36,sum[37],c37);
    FA_Structural fa39(a[38],b[38],c37,sum[38],c38);
    FA_Structural fa40(a[39],b[39],c38,sum[39],c39);
    FA_Structural fa41(a[40],b[40],c39,sum[40],c40);
    FA_Structural fa42(a[41],b[41],c40,sum[41],c41);
    FA_Structural fa43(a[42],b[42],c41,sum[42],c42);
    FA_Structural fa44(a[43],b[43],c42,sum[43],c43);
    FA_Structural fa45(a[44],b[44],c43,sum[44],c44);
    FA_Structural fa46(a[45],b[45],c44,sum[45],c45);
    FA_Structural fa47(a[46],b[46],c45,sum[46],c46);
    FA_Structural fa48(a[47],b[47],c46,sum[47],c47);
    FA_Structural fa49(a[48],b[48],c47,sum[48],c48);
    FA_Structural fa50(a[49],b[49],c48,sum[49],c49);
    FA_Structural fa51(a[50],b[50],c49,sum[50],c50);
    FA_Structural fa52(a[51],b[51],c50,sum[51],c51);
    FA_Structural fa53(a[52],b[52],c51,sum[52],c52);
    FA_Structural fa54(a[53],b[53],c52,sum[53],c53);
    FA_Structural fa55(a[54],b[54],c53,sum[54],c54);
    FA_Structural fa56(a[55],b[55],c54,sum[55],c55);
    FA_Structural fa57(a[56],b[56],c55,sum[56],c56);
    FA_Structural fa58(a[57],b[57],c56,sum[57],c57);
    FA_Structural fa59(a[58],b[58],c57,sum[58],c58);
    FA_Structural fa60(a[59],b[59],c58,sum[59],c59);
    FA_Structural fa61(a[60],b[60],c59,sum[60],c60);
    FA_Structural fa62(a[61],b[61],c60,sum[61],c61);
    FA_Structural fa63(a[62],b[62],c61,sum[62],c62);
    FA_Structural fa64(a[63],b[63],c62,sum[63],cout);

endmodule
