class ulss_driver extends uvm_driver #(ulss_tx);

  //factory registration
  `uvm_component_utils(ulss_driver)

  //creating interface and sequence item handle
   ulss_tx tx;
   virtual ulss_interface vif;

  //constructor
   function new(string name = "ulss_driver", uvm_component parent=null);
      super.new(name, parent);
   endfunction

  //build phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      tx = ulss_tx::type_id::create("tx");
      if(!uvm_config_db#(virtual ulss_interface)::get(this,"*","ulss_interface",vif))
     `uvm_fatal(get_full_name(),"unable to get interface in read driver")
   endfunction

   task run_phase(uvm_phase phase);
         @(posedge vif.rate_limiter_16to4_clk);
     vif.rate_limiter_16to4_rstn <=1'b0;    
         // rate_limiter_16to4_sw_rst =1;    
        // Initialize register signals to 1'b0
     vif.sch_reg_wr_en <=1'b0;
     vif.sch_reg_wr_addr <=5'b0;
     vif.sch_reg_wr_data <=64'b0;   
       // Initialize all input stream signals to 1'b0
     vif.in_sop_0 <=1'b0;vif.in_stream_0 <=1'b0;vif.in_eop_0 <=1'b0;
     vif.in_sop_1 <=1'b0;vif.in_stream_1 <=1'b0;vif.in_eop_1 <=1'b0;
     vif.in_sop_2 <=1'b0;vif.in_stream_2 <=1'b0;vif.in_eop_2 <=1'b0;
     vif.in_sop_3 <=1'b0;vif.in_stream_3 <=1'b0;vif.in_eop_3 <=1'b0;
     vif.in_sop_4 <=1'b0;vif.in_stream_4 <=1'b0;vif.in_eop_4 <=1'b0;
     vif.in_sop_5 <=1'b0;vif.in_stream_5 <=1'b0;vif.in_eop_5 <=1'b0;
     vif.in_sop_6 <=1'b0;vif.in_stream_6 <=1'b0;vif.in_eop_6 <=1'b0;
     vif.in_sop_7 <=1'b0;vif.in_stream_7 <=1'b0;vif.in_eop_7 <=1'b0;
     vif.in_sop_8 <=1'b0;vif.in_stream_8 <=1'b0;vif.in_eop_8 <=1'b0;
     vif.in_sop_9 <=1'b0;vif.in_stream_9 <=1'b0;vif.in_eop_9 <=1'b0;
     vif.in_sop_10 <=1'b0; vif.in_stream_10 <=1'b0; vif.in_eop_10 <=1'b0;
     vif.in_sop_11 <=1'b0; vif.in_stream_11 <=1'b0; vif.in_eop_11 <=1'b0;
     vif.in_sop_12 <=1'b0; vif.in_stream_12 <=1'b0; vif.in_eop_12 <=1'b0;
     vif.in_sop_13 <=1'b0; vif.in_stream_13 <=1'b0; vif.in_eop_13 <=1'b0;
     vif.in_sop_14 <=1'b0; vif.in_stream_14 <=1'b0; vif.in_eop_14 <=1'b0;
     vif.in_sop_15 <=1'b0; vif.in_stream_15 <=1'b0; vif.in_eop_15 <=1'b0;

     vif.pck_str_empty_0<=1'b0;
     vif.pck_str_empty_1<=1'b0;
     vif.pck_str_empty_2<=1'b0;
     vif.pck_str_empty_3<=1'b0;
     vif.pck_str_empty_4<=1'b0;
     vif.pck_str_empty_5<=1'b0;
     vif.pck_str_empty_6<=1'b0;
     vif.pck_str_empty_7<=1'b0;
     vif.pck_str_empty_8<=1'b0;
     vif.pck_str_empty_9<=1'b0;
     vif.pck_str_empty_10<=1'b0;            
     vif.pck_str_empty_11<=1'b0;
     vif.pck_str_empty_12<=1'b0;
     vif.pck_str_empty_13<=1'b0;           
     vif.pck_str_empty_14<=1'b0;           
     vif.pck_str_empty_15<=1'b0;

     repeat(3)

     @(posedge vif.rate_limiter_16to4_clk);

    vif.rate_limiter_16to4_rstn<= 1'b1;



         //ulss_tx tx;
         //phase.raise_objection(this);

          //vif.rate_limiter_16to4_rstn <= tx.rate_limiter_16to4_rstn;
          //vif.rate_limiter_16to4_sw_rst <= tx.;
          //repeat (5) @(posedge vif.rate_limiter_16to4_clk);
          //vif.rate_limiter_16to4_rstn <= 1;
          //vif.rate_limiter_16to4_sw_rst <= 1'b0;

          //@(posedge vif.rate_limiter_16to4_clk);
   
    //forever begin
           //  seq_item_port.get_next_item(tx);

   /*   // 1. Register Config
        vif.rate_limiter_16to4_rstn <= tx.rate_limiter_16to4_rstn;
        vif.sch_reg_wr_en   <= tx.sch_reg_wr_en;
        vif.sch_reg_wr_addr <= tx.sch_reg_wr_addr;
        vif.sch_reg_wr_data <= tx.sch_reg_wr_data;
        @(posedge vif.rate_limiter_16to4_clk);
        vif.sch_reg_wr_en <= 1'b0;

      // 2. Loop through all streams
      for (int sid = 0; sid < 16; sid++) begin
        if (tx.packet_data[sid].size() > 0) begin
          wait (vif.pck_rd_en_grnt[sid] && !vif.pck_str_empty[sid]);

          for (int i = 0; i < tx.packet_data[sid].size(); i++) begin
             vif.in_stream[sid] <= tx.packet_data[sid][i];
             vif.in_sop[sid]    <= (i <= 0);
             vif.in_eop[sid]    <= (i <= tx.packet_data[sid].size() - 1);
             @(posedge vif.rate_limiter_16to4_clk);
          end

          // Clear signals
          vif.in_stream[sid] <= 0;
          vif.in_sop[sid]    <= 0;
          vif.in_eop[sid]    <= 0;
        end
      end*/
 forever begin
             seq_item_port.get_next_item(tx);

       
    // 1. Always apply reset and register config signals
    vif.rate_limiter_16to4_rstn <= tx.rate_limiter_16to4_rstn;
    vif.sch_reg_wr_en <= tx.sch_reg_wr_en;
    vif.sch_reg_wr_addr <= tx.sch_reg_wr_addr;
    vif.sch_reg_wr_data <= tx.sch_reg_wr_data;
    
    @(posedge vif.rate_limiter_16to4_clk);
    
    // If reset is inactive, then proceed with packet transfer
    if (tx.rate_limiter_16to4_rstn == 1'b1) begin
      // 2. For each stream, apply the handshaking protocol
      for (int sid = 0; sid < 16; sid++) begin
        // Set empty signals based on transaction values
        vif.pck_str_empty[sid] <= tx.pck_str_empty[sid];
        
        // Only proceed with packet transfer if we have grant from DUT
        if (tx.pck_str_empty[sid] == 1'b0) begin  // Non-empty packet to send
          // Wait for the grant signal before sending packet data
         wait(vif.pck_rd_en_grnt[sid]);
          
          // Now transfer the packet data with start/end indicators
          vif.in_sop[sid] <= tx.in_sop[sid];
          vif.in_stream[sid] <= tx.in_stream[sid];
          vif.in_eop[sid] <= tx.in_eop[sid];
          
          @(posedge vif.rate_limiter_16to4_clk);
        end
        else begin
          // For empty packets, just set the signals according to the transaction
          vif.in_sop[sid] <= tx.in_sop[sid];
          vif.in_stream[sid] <= tx.in_stream[sid];
          vif.in_eop[sid] <= tx.in_eop[sid];
          
          @(posedge vif.rate_limiter_16to4_clk);
        end
      end
    end
    
   
      seq_item_port.item_done();
    end

    //phase.drop_objection(this);
  endtask

endclass

