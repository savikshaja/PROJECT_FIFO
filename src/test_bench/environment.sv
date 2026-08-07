class environment extends uvm_env;

	`uvm_component_utils(environment)

	input_agent  i_agent;
	output_agent o_agent;
	scoreboard   score_h;
	subscriber   sub_h;

	function new(string name="environment", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		i_agent = input_agent::type_id::create("i_agent", this);
		o_agent = output_agent::type_id::create("o_agent", this);
		score_h = scoreboard::type_id::create("score_h", this);
		sub_h   = subscriber::type_id::create("sub_h", this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		i_agent.im.ap.connect(score_h.input_seq.analysis_export);
		o_agent.op_mon.op.connect(score_h.output_seq.analysis_export);
		i_agent.im.ap.connect(sub_h.analysis_export);
	endfunction

endclass
