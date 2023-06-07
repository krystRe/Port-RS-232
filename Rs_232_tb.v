`timescale 1ns / 1ps

module Rs_232_tb();

reg clk_tb;
reg rst_tb;
reg RXD_tb;
wire TXD_tb;

RS_232_top UUT(clk_tb, rst_tb, RXD_tb, TXD_tb);

always
    #5 clk_tb = ~clk_tb;

initial
    begin
        clk_tb = 1'b0;
        RXD_tb = 1'b1;
        rst_tb = 1'b1;
        #100
        rst_tb = 1'b0;
        #200000
        RXD_tb = 1'b0; // start
        #104167
        RXD_tb = 1'b1; // data 0
        #104167
        RXD_tb = 1'b1; // data 1
        #104167
        RXD_tb = 1'b0; // data 2
        #104167
        RXD_tb = 1'b0; // data 3
        #104167
        RXD_tb = 1'b1; // data 4
        #104167
        RXD_tb = 1'b0; // data 5
        #104167
        RXD_tb = 1'b1; // data 6
        #104167
        RXD_tb = 1'b0; // data 7
        #104167
        RXD_tb = 1'b1; // STOP
        #50000
        rst_tb = 1'b1;
        #1000
        rst_tb = 1'b0;
        #30000000
        RXD_tb = 1'b0; // start
        #104167
        RXD_tb = 1'b1; // data 0
        #104167
        RXD_tb = 1'b1; // data 1
        #104167
        RXD_tb = 1'b0; // data 2
        #104167
        RXD_tb = 1'b0; // data 3
        #104167
        RXD_tb = 1'b1; // data 4
        #104167
        RXD_tb = 1'b0; // data 5
        #104167
        RXD_tb = 1'b1; // data 6
        #104167
        RXD_tb = 1'b0; // data 7
        #104167
        RXD_tb = 1'b1; // STOP
    end

endmodule
