`ifndef FIFO_PKG_SV
`define FIFO_PKG_SV

package fifo_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "seq_item.sv"
`include "sequences.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "input_agent.sv"
`include "output_agent.sv"
`include "scoreboard.sv"
`include "subscriber.sv"
`include "environment.sv"
`include "test.sv"

endpackage

`endif
