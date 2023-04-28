//=========================================================================
// 5-Stage PARC Scoreboard
//=========================================================================

`ifndef PARC_CORE_REORDERBUFFER_V
`define PARC_CORE_REORDERBUFFER_V

module parc_CoreReorderBuffer
(
  input         clk,
  input         reset,

  input         rob_alloc_req_val,
  output        rob_alloc_req_rdy,
  input  [ 4:0] rob_alloc_req_preg,
  output [ 3:0] rob_alloc_resp_slot,
  input         rob_fill_val,
  input  [ 3:0] rob_fill_slot,

  output        rob_commit_wen,
  output [ 3:0] rob_commit_slot,
  output [ 4:0] rob_commit_rf_waddr
);


  reg [3:0] rob_head;
  reg [3:0] rob_tail;

  `define ROB_VALID 6
  `define ROB_PENDING 5
  `define ROB_REGISTER 4:0

  reg [6:0] rob_table [0:15]; 

    always @(posedge clk) begin
    if (reset)
    begin
      rob_head <= 0;
      rob_tail <= 0;
      for (integer i = 0; i < 16; i = i + 1 )
      begin
        rob_table [i] <= 7'b0;
      end
    end
    else begin
      if(rob_alloc_req_val && rob_alloc_req_rdy)
      begin
        rob_tail <= rob_tail + 1;
        rob_table[rob_tail] <= {1'b1, 1'b1, rob_alloc_req_preg};
      end
      if(rob_fill_val)
      begin
        rob_table[rob_fill_slot][`ROB_PENDING] = 0;
      end
      if(rob_commit_rdy)
      begin
        rob_head <= rob_head + 1;
        rob_table[rob_head] <= 7'b0;
      end

    end
  end

  //If the current tail is valid, module isn't ready
  assign rob_alloc_req_rdy  = rob_table[rob_tail][`ROB_VALID] == 0;
  assign rob_alloc_resp_slot = rob_tail;

  
  wire rob_commit_rdy = (rob_table[rob_head][`ROB_VALID] == 1 && rob_table[rob_head][`ROB_PENDING] == 0);

  assign rob_commit_wen = rob_commit_rdy;
  assign rob_commit_rf_waddr = rob_table[rob_head][`ROB_REGISTER];
  assign rob_commit_slot     = rob_head;

  //DEBUG
  wire [6:0] rob_table_0 = rob_table[0];
  
endmodule

`endif

