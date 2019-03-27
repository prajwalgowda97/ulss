class reset_sequence extends uvm_sequence#(ulss_tx);

  //factory registration
  `uvm_object_utils(reset_sequence)

  //creating sequence item handle
  ulss_tx tx;

  int scenario;
  int  sid;

  //constructor
  function new(string name="reset_sequence");
   super.new(name);
  endfunction
  
  //Build phase
  function build_phase(uvm_phase phase);
  tx =ulss_tx::type_id::create("tx");
  endfunction

  task body();
         if(scenario==1)
  begin 
    
    // Step 1: Assert active low reset
    `uvm_do_with(tx, {
     tx.rate_limiter_16to4_rstn ==0;   
          // rate_limiter_16to4_sw_rst =1;    
        // Initialize register signals to 0
     tx.sch_reg_wr_en ==0;
     tx.sch_reg_wr_addr ==0;
     tx.sch_reg_wr_data ==0;   
    //   // Initialize all input stream signals to 0
     tx.in_sop_0 ==0;tx.in_stream_0 ==0; tx.in_eop_0 ==0;
     tx.in_sop_1 ==0;tx.in_stream_1 ==0; tx.in_eop_1 ==0;
     tx.in_sop_2 ==0;tx.in_stream_2 ==0; tx.in_eop_2 ==0;
     tx.in_sop_3 ==0;tx.in_stream_3 ==0; tx.in_eop_3 ==0;
     tx.in_sop_4 ==0;tx.in_stream_4 ==0; tx.in_eop_4 ==0;
     tx.in_sop_5 ==0;tx.in_stream_5 ==0; tx.in_eop_5 ==0;
     tx.in_sop_6 ==0;tx.in_stream_6 ==0; tx.in_eop_6 ==0;
     tx.in_sop_7 ==0;tx.in_stream_7 ==0; tx.in_eop_7 ==0;
     tx.in_sop_8 ==0;tx.in_stream_8 ==0; tx.in_eop_8 ==0;
     tx.in_sop_9 ==0;tx.in_stream_9 ==0; tx.in_eop_9 ==0;
     tx.in_sop_10 ==0; tx.in_stream_10 ==0; tx.in_eop_10 ==0;
     tx.in_sop_11 ==0; tx.in_stream_11 ==0; tx.in_eop_11 ==0;
     tx.in_sop_12 ==0; tx.in_stream_12 ==0; tx.in_eop_12 ==0;
     tx.in_sop_13 ==0; tx.in_stream_13 ==0; tx.in_eop_13 ==0;
     tx.in_sop_14 ==0; tx.in_stream_14 ==0; tx.in_eop_14 ==0;
     tx.in_sop_15 ==0; tx.in_stream_15 ==0; tx.in_eop_15 ==0;

     tx.pck_str_empty_0==0;
     tx.pck_str_empty_1==0;
     tx.pck_str_empty_2==0;
     tx.pck_str_empty_3==0;
     tx.pck_str_empty_4==0;
     tx.pck_str_empty_5==0;
     tx.pck_str_empty_6==0;
     tx.pck_str_empty_7==0;
     tx.pck_str_empty_8==0;
     tx.pck_str_empty_9==0;
     tx.pck_str_empty_10==0;            
     tx.pck_str_empty_11==0;
     tx.pck_str_empty_12==0;
     tx.pck_str_empty_13==0;           
     tx.pck_str_empty_14==0;           
     tx.pck_str_empty_15==0; });
      $display("reset signal is successfully generated in sequence=%b",tx.rate_limiter_16to4_rstn);
  end

//#5;
  /* if(scenario==2)
  begin


    `uvm_do_with(tx, {
    tx.rate_limiter_16to4_rstn ==1;});*/
     
          // rate_limiter_16to4_sw_rst =1;
     
        // Initialize register signals to 0
     //tx.sch_reg_wr_en   ==1;
     //tx.sch_reg_wr_addr ==1;
     //tx.sch_reg_wr_data ==1;
    // 
    //   // Initialize all input stream signals to 0
//     tx.in_sop_0 ==1;tx.in_stream_0 ==1; tx.in_eop_0 ==1;
//     tx.in_sop_1 ==1;tx.in_stream_1 ==1; tx.in_eop_1 ==1;
//     tx.in_sop_2 ==1;tx.in_stream_2 ==1; tx.in_eop_2 ==1;
//     tx.in_sop_3 ==1;tx.in_stream_3 ==1; tx.in_eop_3 ==1;
//     tx.in_sop_4 ==1;tx.in_stream_4 ==1; tx.in_eop_4 ==1;
//     tx.in_sop_5 ==1;tx.in_stream_5 ==1; tx.in_eop_5 ==1;
//     tx.in_sop_6 ==1;tx.in_stream_6 ==1; tx.in_eop_6 ==1;
//     tx.in_sop_7 ==1;tx.in_stream_7 ==1; tx.in_eop_7 ==1;
//     tx.in_sop_8 ==1;tx.in_stream_8 ==1; tx.in_eop_8 ==1;
//     tx.in_sop_9 ==1;tx.in_stream_9 ==1; tx.in_eop_9 ==1;
//     tx.in_sop_10 ==1; tx.in_stream_10 ==1; tx.in_eop_10 ==1;
//     tx.in_sop_11 ==1; tx.in_stream_11 ==1; tx.in_eop_11 ==1;
//     tx.in_sop_12 ==1; tx.in_stream_12 ==1; tx.in_eop_12 ==1;
//     tx.in_sop_13 ==1; tx.in_stream_13 ==1; tx.in_eop_13 ==1;
//     tx.in_sop_14 ==1; tx.in_stream_14 ==1; tx.in_eop_14 ==1;
//     tx.in_sop_15 ==1; tx.in_stream_15 ==1; tx.in_eop_15 ==1;
//
//     tx.pck_str_empty_0==1;
//     tx.pck_str_empty_1==1;
//     tx.pck_str_empty_2==1;
//     tx.pck_str_empty_3==1;
//     tx.pck_str_empty_4==1;
//     tx.pck_str_empty_5==1;
//     tx.pck_str_empty_6==1;
//     tx.pck_str_empty_7==1;
//     tx.pck_str_empty_8==1;
//     tx.pck_str_empty_9==1;
//     tx.pck_str_empty_10==1;            
//     tx.pck_str_empty_11==1;
//     tx.pck_str_empty_12==1;
//     tx.pck_str_empty_13==1;           
//     tx.pck_str_empty_14==1;           
//     tx.pck_str_empty_15==1; 
     
      //foreach (in_sop[i])    in_sop[i]     inside {0,1};
      //foreach (in_eop[i])    in_eop[i]     inside {0,1};
      //foreach (in_stream[i]) in_stream[i]  inside {[8'h00 : 8'hFF]}; // Assume 8-bit data
      //foreach (pck_str_empty[i]) pck_str_empty[i] inside {0, 1};  });



 /*   //try 2
  sch_reg_wr_en == 1;
  sch_reg_wr_addr inside {[0:19]};
  sch_reg_wr_data inside {[64'h1 : 64'hFFFFFFFF]};

        
  pck_str_empty[0] == 0;   // Stream 0 has data
  in_sop[0]        == 1;
  in_stream[0]     inside {[8'h00 : 8'hFF]};
  in_eop[0]        == 1;

  foreach (in_stream[i]) if (i != 0) in_stream[i] == 0;
  foreach (in_sop[i])    if (i != 0) in_sop[i] == 0;
  foreach (in_eop[i])    if (i != 0) in_eop[i] == 0;
  foreach (pck_str_empty[i]) if (i != 0) pck_str_empty[i] == 1;

      });*/
        //in_stream[15:1]  == 0;});
     // \\foreach (tx.packet_data[sid]) {
   // \\    tx.packet_data[sid].size() inside {[1:10]}; // Random length between 1 and 10
   // \\    foreach (tx.packet_data[sid][i])
   // \\      tx.packet_data[sid][i] == 1;     // Random data
   // \\  }
   // \\});





   ////////////////////////////////////////////////////
   //try 3
   if(scenario==2)
  begin
    `uvm_do_with(tx, {
    tx.rate_limiter_16to4_rstn ==1;});

  foreach (tx.in_stream[i]) if (i != 0) tx.in_stream[i] = 0;
  foreach (tx.in_sop[i])    if (i != 0) tx.in_sop[i] = 0;
  foreach (tx.in_eop[i])    if (i != 0) tx.in_eop[i] = 0;
  foreach (tx.pck_str_empty[i]) if (i != 0) tx.pck_str_empty[i] = 1;

   `uvm_do_with(req, {
      sch_reg_wr_en    == 1'b1;
      sch_reg_wr_addr  == 5'd0; // OUT_STREAM_0_REG
      sch_reg_wr_data  == 64'h0000_0000_0000_0001; // Input stream 0 mapped
    });

    // 2. Configure IN_STREAM_0_REG: 50 token wait, 1 packet
    `uvm_do_with(req, {
      sch_reg_wr_en    == 1'b1;
      sch_reg_wr_addr  == 5'd4; // IN_STREAM_0_REG
      sch_reg_wr_data  == {49'd1, 15'd0}; // 1 packet, token wait 0
    });
    //@(posedge vif.rate_limiter_16to4_clk);

    // Note: Driver will wait for grant signal before sending
      `uvm_do_with(tx, {
        tx.pck_str_empty[0] == 1'b0; // Non-empty packet for stream 0
        tx.in_sop[0]        == 1'b1; // Start of packet
        tx.in_stream[0]     == 64'h1234_5678_DEAD_BEEF; // Packet data
        tx.in_eop[0]        == 1'b0; // Not end of packet yet
      });

       // Complete packet transmission with end of packet
      `uvm_do_with(tx, {
        tx.pck_str_empty[0] == 1'b0;
        tx.in_sop[0]        == 1'b0; // Not start
        tx.in_stream[0]     == 64'h0; // Could be different data if needed
        tx.in_eop[0]        == 1'b1; // End of packet
      });
      
      // Reset signals after packet transmission
      `uvm_do_with(tx, {
        tx.pck_str_empty[0] == 1'b1; // Empty again
        tx.in_sop[0]        == 1'b0;
        tx.in_stream[0]     == 64'h0;
        tx.in_eop[0]        == 1'b0;
      });

 // 5. Send packet on stream 0
    /*in_sop[0]    == 1;
    in_stream[0] == 64'h1234_5678_DEAD_BEEF;
    @(posedge vif.rate_limiter_16to4_clk);
    in_sop[0]    == 0;
    in_eop[0]    == 1;
    @(posedge vif.rate_limiter_16to4_clk);
    vif.in_eop[0]    == 0;*/

    `uvm_info("ULSS", $sformatf("Stream 0 packet sent"), UVM_LOW)
   `uvm_info(get_type_name(), "Starting ULSS Sequence for Stream 0 Only", UVM_MEDIUM)   
    $display("reset signal is successfully generated in sequence=%b",tx.rate_limiter_16to4_rstn);
  end
endtask
endclass
  

