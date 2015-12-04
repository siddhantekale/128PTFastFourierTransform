// $Id: $
// File name:   adc_module.sv
// Created:     11/22/2015
// Author:      Siddhant Ekale
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: sends data to the buffer - 128 * 8bits of data

`timescale 1ns / 100ps

module adc_module
(
	input logic generate_value,
	output wire shift_in,
	output reg[7:0] output_val
	//output [31:0] = 		
);

parameter CLK_PERIOD = 3.68ns;
parameter CHK_DELAY = 2;

	reg tb_clk;
	//reg tb_rst;
	//reg keep_count; //keeps the bit counter ticking; ideally never has to be zero
	//reg check_byte; //one byte has been received
	//reg check_128_byte; //flag to check all 128 bytes have been received by the data buffer
	bit[11:0] twelve_bit_val;
	//reg next_generate_value;


	always 
	begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
	end

	//randomly generate a vector on every positive clock edge
	//number of assertions depends on how many data bytes wee need per clock cycle
	always
	begin
	if(tb_clk == 1'b1)
	begin
		  	assert(std::randomize(twelve_bit_val)); //one assertion generates one 8 bit value
	end



	end
	assign output_val = eight_bit_val;
endmodule




