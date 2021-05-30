class dpsram_agent1 extends uvm_agent;
`uvm_component_utils(dpsram_agent1)


dpsram_seqr seqr;
dpsram_drv drv;
dpsram_mon1 mon1;

function new(string name="dpsram_agent1",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
seqr=dpsram_seqr::type_id::create("seqr1",this);
drv=dpsram_drv::type_id::create("drv",this);
mon1=dpsram_mon1::type_id::create("mon1",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export);
endfunction

endclass