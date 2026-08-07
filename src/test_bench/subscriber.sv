class subscriber extends uvm_subscriber #(seq_item);

	`uvm_component_utils(subscriber)

	seq_item drv;

	covergroup input_cg;

		wr_cs_cp: coverpoint drv.wr_cs {
			bins low  = {0};
			bins high = {1};
		}

		wr_en_cp: coverpoint drv.wr_en {
			bins low  = {0};
			bins high = {1};
		}

		rd_cs_cp: coverpoint drv.rd_cs {
			bins low  = {0};
			bins high = {1};
		}

		rd_en_cp: coverpoint drv.rd_en {
			bins low  = {0};
			bins high = {1};
		}

		data_in_cp: coverpoint drv.data_in {
			bins low[]  = {[8'h00:8'h3F]};
			bins mid[]  = {[8'h40:8'h7F]};
			bins high[] = {[8'h80:8'hBF]};
			bins max[]  = {[8'hC0:8'hFF]};
		}

		wr_csXwr_en: cross wr_cs_cp, wr_en_cp;
		rd_csXrd_en: cross rd_cs_cp, rd_en_cp;
		wr_rd_cross: cross wr_en_cp, rd_en_cp;

	endgroup

	function new(string name="subscriber", uvm_component parent=null);
		super.new(name, parent);
		input_cg = new();
	endfunction

	virtual function void write(seq_item t);
		drv = t;
		input_cg.sample();
		`uvm_info(get_name(), "INPUT TRANSACTION RECEIVED", UVM_HIGH)
	endfunction

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info(get_name(),
			$sformatf("INPUT COVERAGE = %0.2f %%", input_cg.get_coverage()),
			UVM_NONE)
	endfunction

endclass
