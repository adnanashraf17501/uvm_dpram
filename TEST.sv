class dpsram_test extends uvm_test;
`uvm_component_utils(dpsram_test)
dpsram_env env;


function new(string name="dpsram_test",uvm_component parent);
		super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=dpsram_env::type_id::create("env",this);
endfunction

task run_phase(uvm_phase phase);
dpsram_seq seq;
seq=dpsram_seq::type_id::create("seq",this);

phase.raise_objection(this);
seq.start(env.agent1.seqr);
#50;
phase.drop_objection(this);
endtask
endclass
