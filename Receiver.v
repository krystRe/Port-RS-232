`timescale 1ns / 1ps

module Receiver(
    input clk_i,
    input rst_i,
    input RXD_i,
    output [7:0] data,
    output state
    );

    reg [7:0] data_buff;
    reg state_buff = 0;
    reg transmission = 0;

    parameter baud = 9600;
    
    integer cycle_time = 100000000/baud;
    integer counter = 0;
    
    always @(posedge clk_i or posedge rst_i)
        begin
            if(rst_i) 
                begin
                    counter = 0;
                    data_buff = 8'b00000000;
                    transmission = 0;
                end
            else 
                begin
                    if(RXD_i == 0 && transmission == 0)
                        transmission = 1;  
                    else if(transmission == 1)
                        begin
                            if(counter == cycle_time*3/2)
                                data_buff[0] <= RXD_i;
                            else if (counter == cycle_time*5/2)
                                data_buff[1] <= RXD_i;
                            else if (counter == cycle_time*7/2)
                                data_buff[2] <= RXD_i;
                            else if (counter == cycle_time*9/2)
                                data_buff[3] <= RXD_i;
                            else if (counter == cycle_time*11/2)
                                data_buff[4] <= RXD_i;
                            else if (counter == cycle_time*13/2)
                                data_buff[5] <= RXD_i;
                            else if (counter == cycle_time*15/2)
                                data_buff[6] <= RXD_i;
                            else if (counter == cycle_time*17/2)
                                data_buff[7] <= RXD_i;            
                            else if (counter > cycle_time*17/2 && RXD_i == 1)
                                begin
                                    state_buff <= !state_buff;
                                    counter = 0;
                                    transmission = 0;
                                end
                            counter = counter + 1;
                        end
                end
        end
    assign data = data_buff;
    assign state = state_buff;
endmodule