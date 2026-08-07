class driver extends uvm_driver #(seq_item);

	`uvm_component_utils(driver)

	seq_item req;
	virtual fifo_inf.DRV_MOD vif;

	function new(string name="driver", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual fifo_inf.DRV_MOD)::get(this, "", "vif", vif))
			`uvm_fatal("DRV", "virtual not found");
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			$display("[%0t]driver get item", $time);
			drive(req);
			seq_item_port.item_done();
		end
	endtask

	task drive(seq_item req);
		@(vif.drv_cb);
		$display("[%0t]inside task ", $time);
		vif.drv_cb.wr_cs   <= req.wr_cs;
		vif.drv_cb.wr_en   <= req.wr_en;
		vif.drv_cb.rd_cs   <= req.rd_cs;
		vif.drv_cb.rd_en   <= req.rd_en;
		vif.drv_cb.data_in <= req.data_in;

		`uvm_info("DRIVER",
			$sformatf("[%0t] Driving : wr_cs=%0b wr_en=%0b rd_cs=%0b rd_en=%0b data_in=%0h", $time, req.wr_cs, req.wr_en, req.rd_cs, req.rd_en, req.data_in), UVM_LOW)
	endtask

endclass
