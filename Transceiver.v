`timescale 1ns / 1ps
module Transceiver(
    input clk_i,
    input rst_i, 
    output reg TXD_o, 
    input state, 
    input [7:0] data
    );


    reg transmission = 0;
    reg [7:0] data_buff;
    reg new_state = 0;
    
    parameter baud = 9600;
    
    integer counter =0;   
    integer cycle_time = 100000000/baud;
    
    always @(posedge clk_i or posedge rst_i)
        begin
            if(rst_i)
               begin
                   transmission = 0;
                   TXD_o = 1;
               end
            else
                begin
                    if(state!=new_state)
                        begin
                            new_state=state;
                            transmission = 1;
                        end
                    else if (transmission == 1)
                        begin
                            if(counter < cycle_time)
                                begin
                                    TXD_o <= 0;
                                  data_buff = data + 32;
                                end
                            else if (counter == cycle_time)
                                TXD_o <= data_buff[0];
                            else if (counter == cycle_time * 2)
                                TXD_o <= data_buff[1];
                            else if (counter == cycle_time * 3)
                                TXD_o <= data_buff[2];
                            else if (counter == cycle_time * 4)
                                TXD_o <= data_buff[3];
                            else if (counter == cycle_time * 5)
                                TXD_o <= data_buff[4];
                            else if (counter == cycle_time * 6)
                                TXD_o <= data_buff[5];
                            else if (counter == cycle_time * 7)
                                TXD_o <= data_buff[6];
                            else if (counter == cycle_time * 8)
                                TXD_o <= data_buff[7];
                            else if (counter > cycle_time * 9)
                                begin
                                    TXD_o <= 1;
                                    transmission = 0;
                                    counter = 0;
                                end	
                            counter = counter +1;			
                        end
                end
        end
endmodule