//apb driver code 
#define 

class apb_driver extends uvm_driver#(apb_seq_item);
`uvm_component_utils(apb_driver)

apb_seq_item tx;
virtual my_interface intf;
function new(string name="apb_driver");
super.new(name);
endfunction

function void build_phase(uvm_phase phase);
tx=apb_seq_item::type_id::create("tx",this);
if(!config_db#(virtual my_interface)::get(this,"","intf",intf))
`uvm_info(get_by_name,$sformat("interface is not connected "),UVM_NONE)
endfunctiom


task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item();
drive(tx);
seq_item_port.item_done();
end
endtask

task drive();

if()
@(posedge clk)
vif.drv_mp.drv_cb.paddr     <= tx.paddr;
vif.drv_mp.drv_cb.pselx     <= 0;
vif.drv_mp.drv_cb.penable   <= 0;

@()
endtask


endclass


///////////////////////////////////////////////////////////////////////////////////////


#define DRV_MON vif.mon.mon_cb
class ahb_monitor extends uvm_monitor;
`uvm_component_utils(ahb_monitor)
uvm_analysis_port#(ahb_seq_item ) ap;

ahb_seq_item seq;

function new(string name="ahb_monitor",uvm_component parent=null);
new.super(name,parent);
endfuction

function void build_phase (uvm_phase phase);
super.build_phase(phase);
ap=new();
if(!config_db#(virtual intf)::get(this,"","pif",vif))
`uvm_fatal(get_type_name(),"wr monitor not get the config")
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
fork
   write_data();
   read_data();
join_any
endtask

task write_data();
wait(`DRV_MON.Hwrite)
begin 
pkt.Haddr = vif.`DRV_MON;
@(`DRV_MON)


end


endtask


endclass




