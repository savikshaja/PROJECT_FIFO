//class output agent

class output_agent extends uvm_agent;
`uvm_component_utils(output_agent)

//passive component
output_monitor op_mon;

function new(string name="output_agent",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
//if(is_active==UVM_PASSIVE)
op_mon=output_monitor::type_id::create("op_mon",this);
endfunction


endclass
