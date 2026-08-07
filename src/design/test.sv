class test extends uvm_test;

	`uvm_component_utils(test)

	environment e_h;

	function new(string name="test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		e_h = environment::type_id::create("e_h", this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
	endfunction

endclass

class random_test extends test;

	`uvm_component_utils(random_test)

	random_sequence seq;

	function new(string name="random_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = random_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class idle_test extends test;

	`uvm_component_utils(idle_test)

	idle_sequence seq;

	function new(string name="idle_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = idle_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class write_only_test extends test;

	`uvm_component_utils(write_only_test)

	write_only_sequence seq;

	function new(string name="write_only_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = write_only_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class read_only_test extends test;

	`uvm_component_utils(read_only_test)

	read_only_sequence seq;

	function new(string name="read_only_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = read_only_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class write_read_test extends test;

	`uvm_component_utils(write_read_test)

	write_read_sequence seq;

	function new(string name="write_read_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = write_read_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class read_write_test extends test;

	`uvm_component_utils(read_write_test)

	read_write_sequence seq;

	function new(string name="read_write_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = read_write_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class mixed_test extends test;

	`uvm_component_utils(mixed_test)

	mixed_sequence seq;

	function new(string name="mixed_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = mixed_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class simultaneous_wr_rd_test extends test;

	`uvm_component_utils(simultaneous_wr_rd_test)

	simul_wr_rd_sequence seq;

	function new(string name="simultaneous_wr_rd_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = simul_wr_rd_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class fifo_full_test extends test;

	`uvm_component_utils(fifo_full_test)

	fifo_full_sequence seq;

	function new(string name="fifo_full_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = fifo_full_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class fifo_empty_test extends test;

	`uvm_component_utils(fifo_empty_test)

	fifo_empty_sequence seq;

	function new(string name="fifo_empty_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = fifo_empty_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class full_empty_max_test extends test;

	`uvm_component_utils(full_empty_max_test)

	full_empty_max_sequence seq;

	function new(string name="full_empty_max_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = full_empty_max_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class write_idle_read_test extends test;

	`uvm_component_utils(write_idle_read_test)

	write_idle_read_sequence seq;

	function new(string name="write_idle_read_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq = write_idle_read_sequence::type_id::create("seq");
		phase.phase_done.set_drain_time(this, 500);
		phase.raise_objection(this);
		seq.start(e_h.i_agent.seqr);
		phase.drop_objection(this);
	endtask

endclass

class regression_test extends test;

	`uvm_component_utils(regression_test)

	random_sequence          ram_seq;
	idle_sequence            idle_seq;
	write_only_sequence      wr_seq;
	read_only_sequence       rd_seq;
	write_read_sequence      wr_rd_seq;
	read_write_sequence      rd_wr_seq;
	mixed_sequence           mix_seq;
	simul_wr_rd_sequence     sim_seq;
	fifo_full_sequence       full_seq;
	fifo_empty_sequence      empty_seq;
	full_empty_max_sequence  max_seq;
	write_idle_read_sequence w_idel_r;

	function new(string name="regression_test", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);

		ram_seq  = random_sequence::type_id::create("ram_seq");
		idle_seq = idle_sequence::type_id::create("idle_seq");
		wr_seq   = write_only_sequence::type_id::create("wr_seq");
		rd_seq   = read_only_sequence::type_id::create("rd_seq");
		wr_rd_seq = write_read_sequence::type_id::create("wr_rd_seq");
		rd_wr_seq = read_write_sequence::type_id::create("rd_wr_seq");
		mix_seq  = mixed_sequence::type_id::create("mix_seq");
		sim_seq  = simul_wr_rd_sequence::type_id::create("sim_seq");
		full_seq = fifo_full_sequence::type_id::create("full_seq");
		empty_seq = fifo_empty_sequence::type_id::create("empty_seq");
		max_seq  = full_empty_max_sequence::type_id::create("max_seq");
		w_idel_r = write_idle_read_sequence::type_id::create("w_idel_r");

		ram_seq.start(e_h.i_agent.seqr);
		idle_seq.start(e_h.i_agent.seqr);
		wr_seq.start(e_h.i_agent.seqr);
		rd_seq.start(e_h.i_agent.seqr);
		wr_rd_seq.start(e_h.i_agent.seqr);
		rd_wr_seq.start(e_h.i_agent.seqr);
		mix_seq.start(e_h.i_agent.seqr);
		sim_seq.start(e_h.i_agent.seqr);
		full_seq.start(e_h.i_agent.seqr);
		empty_seq.start(e_h.i_agent.seqr);
		max_seq.start(e_h.i_agent.seqr);
		w_idel_r.start(e_h.i_agent.seqr);

		phase.drop_objection(this);
	endtask

endclass
