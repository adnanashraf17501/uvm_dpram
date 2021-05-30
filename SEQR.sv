class dpsram_seqr extends uvm_sequencer #(dpsram_seq_item);

`uvm_component_utils(dpsram_seqr)

function new(string name="dpsram_seqr",uvm_component parent);
super.new(name,parent);
endfunction

endclass