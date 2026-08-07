`timescale 1ns/1ps

`include "syn_fifo.v"
`include "ram_dp_ar_aw.v"

`include "interface.sv"
`include "fifo_pkg.sv"

module top;

	import uvm_pkg::*;
	import fifo_pkg::*;

	parameter DATA_WIDTH = 8;
	parameter ADDR_WIDTH = 8;

	bit clk;
	bit rst;

	fifo_inf #(DATA_WIDTH) fifo_if(clk, rst);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1'b1;
		#10;
		rst = 1'b0;
	end

	syn_fifo #(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH)
	) dut (
		.clk(clk),
		.rst(rst),
		.wr_cs(fifo_if.wr_cs),
		.rd_cs(fifo_if.rd_cs),
		.wr_en(fifo_if.wr_en),
		.rd_en(fifo_if.rd_en),
		.data_in(fifo_if.data_in),
		.data_out(fifo_if.data_out),
		.full(fifo_if.full),
		.empty(fifo_if.empty)
	);

	initial begin
		uvm_config_db #(virtual fifo_inf.DRV_MOD)::set(null, "*", "vif", fifo_if);
		uvm_config_db #(virtual fifo_inf.IM_MOD)::set(null, "*", "vif", fifo_if);
		uvm_config_db #(virtual fifo_inf.OM_MOD)::set(null, "*", "vif", fifo_if);
		run_test("random_test");
	end

endmodule
