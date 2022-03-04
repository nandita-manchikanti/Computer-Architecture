module reg_file(read_addr1,read_addr2,write_addr,data,read_out1,read_out2,clk);
input [4:0] read_addr1,read_addr2,write_addr;  // 2 read addresses and 1 write address where the new data should be written
input [63:0] data; //  data to be written into the register at write address
output [63:0] read_out1,read_out2; //  read data at 2 read_address is stored in read_out1 and read_out2
input clk;
integer i;
reg [31:0] register[63:0]; 

// initially assigning zero to the register file
initial begin
    for(i=0;i<32;i=i+1)
    register[i] = 64'h0000000000000000;
end

assign read_out1 = register[read_addr1];
assign read_out2 = register[read_addr2];

// write operation happens during the rising edge of clock signal
always@(posedge clk)
    begin
        register[write_addr] <= data;
    end
endmodule

module top;
reg [4:0] read_addr1,read_addr2,write_addr;
reg [63:0] data;
wire [63:0] read_out1,read_out2;
reg clk;

reg_file reg1(read_addr1,read_addr2,write_addr,data,read_out1,read_out2,clk);
always #1 clk = ~clk;
    initial
    begin
        clk =0; 
        #1 data=64'd101010; write_addr=5'd15;read_addr1=5'd15;read_addr2=5'd28;  
        #2 write_addr=5'd28; data=64'd5400;
        #2 read_addr1=5'd1; read_addr2=5'd20;data = 64'd34567;write_addr = 5'd1;
        #2 write_addr=5'd20; data=64'd265;

        #1 $finish;
    end

    initial
    begin
        $monitor($time,"\nread_addr1 = %d\nread_addr2 = %d\nwrite_addr = %d\ndata = %d\nread_out1 = %d\nread_out2 = %d\nclk\n",read_addr1,read_addr2,write_addr,data,read_out1,read_out2,clk);
    end
endmodule