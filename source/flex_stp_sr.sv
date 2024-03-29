// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/20/2015
// Author:      Siddhant Ekale
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_stp_sr
#(

	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)

(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output wire [NUM_BITS - 1 : 0]parallel_out
);

	reg [NUM_BITS - 1 : 0]tmp_store;
	//reg i;
always @(posedge clk, negedge n_rst)
begin

	if(n_rst == 0)
	begin 	
	tmp_store[NUM_BITS - 1 : 0] <= {NUM_BITS{1'b0}};
	//for(i = 0; i < NUM_BITS; i = i+1)
	//begin
	//tmp_store[i] <= 1'b1;
	//end
	end

	else
		begin

	if(shift_enable == 1)
	begin
	
	if(SHIFT_MSB == 1)
	begin
	tmp_store[NUM_BITS - 1 : 0] <= {tmp_store[NUM_BITS - 2:0],serial_in};
	end else begin
	tmp_store[NUM_BITS - 1 : 0] <= {serial_in,tmp_store[NUM_BITS - 1:1]};
	end

	end else begin
	tmp_store[NUM_BITS - 1 : 0] <= tmp_store[NUM_BITS - 1:0];
	end
		end



end

assign parallel_out[NUM_BITS - 1: 0]  = tmp_store[NUM_BITS - 1: 0];
endmodule
	
	
