class output_monitor extends uvm_monitor;
`uvm_component_utils(output_monitor)

//analysis port for secoreboard
uvm_analysis_port#(seq_item) op;

//virtual interface
virtual fifo_inf.OM_MOD vif;

//seq_item
seq_item req;

function new(string name="output_monitor",uvm_component parent);
super.new(name,parent);
op=new("op",this);
endfunction

//buildphase

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_inf.OM_MOD)::get(this,"","vif",vif))
`uvm_fatal("OUTPUT MON","virtual interface failed");
endfunction

task run_phase(uvm_phase phase);
@(vif.om_cb);
forever begin
req=seq_item::type_id::create("req");
@(vif.om_cb);
req.full=vif.om_cb.full;
req.empty=vif.om_cb.empty;
req.data_out=vif.om_cb.data_out;
/*`uvm_info("OUTPUT_MON",
$sformatf("[%0t] Captured : data_out=%0h full=%0b empty=%0b",
$time,
req.data_out,
req.full,
req.empty),
UVM_LOW)
*/
op.write(req);

`uvm_info("OUTPUT_MON",
$sformatf("[%0t] Captured : data_out=%0h full=%0b empty=%0b",
$time,
req.data_out,
req.full,
req.empty),
UVM_LOW)
end
endtask
endclass
