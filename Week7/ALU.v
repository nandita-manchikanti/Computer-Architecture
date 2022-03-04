//CED19I056
//Nandita M
/*Design 64-bit Logic unit.
Which can perform
1) bitwise AND
2) bitwise XOR
3) bitwise NAND
4) bitwise OR
5) bitwise NOT
6) bitwise NOR
7) 2's Complement
8) bitwise XNOR*/

module alu(a,b,select,out);
input [63:0] a,b;
input [2:0]select;
output reg[63:0] out;

parameter[2:0] AND=3'b000,XOR=3'b001,NAND=3'b010,OR=3'b011,NOT=3'b100,NOR=3'b101,XNOR=3'b111,TWOCOMP=3'b110;
always@(a,b,select)
    begin
        case(select)
            AND: 
            begin
                out=a&b;
            end
            XOR:
            begin
                out=a^b;
            end
            NAND:
            begin
                out=~(a&b);
            end
            OR:
            begin
                out=a|b;
            end
            NOT:
            begin
                out=~a;
            end
            NOR:
            begin
                out=~(a|b);
            end
            XNOR:
            begin
                out=~(a^b);
            end
            TWOCOMP:
            begin
                out=(~a)+1;
            end
        endcase
    end
endmodule

module tb_alu;
input clk;  
reg[63:0] a,b;
reg[2:0] select;
wire[63:0] out;

alu alu(a,b,select,out);
    initial begin
        #0 a=64'd1232;  b=64'd89454;  select=3'b000;
        #1 a=64'd1232;  b=64'd89454;  select=3'b001;
        #2 a=64'd1232;  b=64'd89454;  select=3'b010;
        #3 a=64'd1232;  b=64'd89454;  select=3'b011;
        #4 a=64'd1232;  b=64'd89454;  select=3'b100;
        #5 a=64'd1232;  b=64'd89454;  select=3'b101;    
        #6 a=64'd1232;  b=64'd89454;  select=3'b110;
        #7 a=64'd1232;  b=64'd89454;  select=3'b111;
    end
    initial begin
        $monitor("a=%d b=%d out=%d",a,b,out);
    end

endmodule
