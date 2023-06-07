`timescale 1ns / 1ps
module RS_232_top(
    input clk_i, 
    input rst_i, 
    input RXD_i, 
    output TXD_o
    );

    wire state;
    wire [7:0] data;

    Receiver odbiornik(.clk_i(clk_i), .rst_i(rst_i), .RXD_i(RXD_i), .data(data), .state(state));
    Transceiver nadajnik(.clk_i(clk_i), .rst_i(rst_i), .TXD_o(TXD_o), .data(data), .state(state));
endmodule
