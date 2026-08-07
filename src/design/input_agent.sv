class input_agent extends uvm_agent;

	`uvm_component_utils(input_agent)

	sequencer seqr;
	driver drv;
	input_monitor im;

	function new(string name="input_agent", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(get_is_active() == UVM_ACTIVE) begin
			seqr = sequencer::type_id::create("seqr", this);
			drv  = driver::type_id::create("drv", this);
		end
		im = input_monitor::type_id::create("im", this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if(get_is_active() == UVM_ACTIVE)
			drv.seq_item_port.connect(seqr.seq_item_export);
	endfunction

endclass
