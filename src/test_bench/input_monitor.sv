class input_monitor extends uvm_monitor;

	`uvm_component_utils(input_monitor)

	uvm_analysis_port#(seq_item) ap;
	virtual fifo_inf.IM_MOD vif;
	seq_item req;

	function new(string name="input_monitor", uvm_component parent);
		super.new(name, parent);
		ap = new("ap", this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual fifo_inf.IM_MOD)::get(this, "", "vif", vif))
			`uvm_fatal("DRV", "virtual interface failed");
	endfunction

	task run_phase(uvm_phase phase);
		@(vif.im_cb);
		forever begin
			req = seq_item::type_id::create("req");
			@(vif.im_cb);

			req.wr_cs   = vif.im_cb.wr_cs;
			req.wr_en   = vif.im_cb.wr_en;
			req.rd_cs   = vif.im_cb.rd_cs;
			req.rd_en   = vif.im_cb.rd_en;
			req.data_in = vif.im_cb.data_in;

			ap.write(req);
			`uvm_info("INPUT_MON",
				$sformatf("[%0t] Captured : wr_cs=%0b wr_en=%0b rd_cs=%0b rd_en=%0b data_in=%0h",
					$time,
					req.wr_cs,
					req.wr_en,
					req.rd_cs,
					req.rd_en,
					req.data_in),
				UVM_LOW)
		end
	endtask

endclass
