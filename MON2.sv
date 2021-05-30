class dpsram_mon2 extends uvm_monitor;

`uvm_component_utils(dpsram_mon2)

dpsram_seq_item pkt1;

virtual intif inf;

uvm_analysis_port #(dpsram_seq_item)item_collected_port1;

function new(string name="dpsram_mon2",uvm_component parent);
super.new(name,parent);
item_collected_port1=new("item_collected_port1",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual intif)::get(this,"","inf",inf);
endfunction

task run_phase(uvm_phase phase);
pkt1=dpsram_seq_item::type_id::create("pkt1");
forever
begin
#2;
@(posedge inf.clk) begin
//pkt1.wr=inf.wr;
//begin
if(inf.wr1==1) begin
pkt1.data_out=inf.data1_out;
pkt1.add=inf.add1	;
`uvm_info("MON2","MON2 TRANSACTIONS",UVM_NONE)
end
end
`uvm_info("MON","MON TRANSACTIONS",UVM_NONE)
@(posedge inf.clk)
item_collected_port1.write(pkt1);

end
endtask
endclass ;