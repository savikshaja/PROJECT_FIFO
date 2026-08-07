//seq_item 
class seq_item extends uvm_sequence_item;
//inputs declared
rand bit wr_cs,wr_en,rd_cs,rd_en;
rand bit [7:0]data_in;
//outputs declared
bit full,empty;
bit [7:0]data_out;

function new(string name="seq_item");
super.new(name);
endfunction

constraint c1{solve wr_cs before wr_en;}
constraint c2{solve rd_cs before rd_en;}
constraint c0{
wr_cs ==1 <-> wr_en==1;
rd_cs==1 <-> rd_en==1;
}

`uvm_object_utils_begin(seq_item)
`uvm_field_int(wr_cs,UVM_DEFAULT)
`uvm_field_int(rd_cs,UVM_DEFAULT)
`uvm_field_int(wr_en,UVM_DEFAULT)
`uvm_field_int(rd_en,UVM_DEFAULT)
`uvm_field_int(data_in,UVM_DEFAULT)
`uvm_field_int(empty,UVM_DEFAULT)
`uvm_field_int(full,UVM_DEFAULT)
`uvm_field_int(data_out,UVM_DEFAULT)
`uvm_object_utils_end

endclass
