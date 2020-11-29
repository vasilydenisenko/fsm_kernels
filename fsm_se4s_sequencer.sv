/*
	4-state sequencer FSM with sequential state encoding.
	
	Set t<x><y> to 1 to move from state <x> to state <y>.
	
	********************************************************************
	fsm_se4s_sequencer
		fsm_se4s_sequencer_inst
	(
		.clk	(),
		.rst	(),
		
		.t01	(),	// i
		.t12	(),	// i
		.t23	(),	// i
		.t30	(),	// i
		.st		()	// o[1 : 0]
	);
*/

module fsm_se4s_sequencer
(
	input  logic clk,
	input  logic rst,
	
	input  logic t01,
	input  logic t12,
	input  logic t23,
	input  logic t30,
	output logic [1 : 0] st
);



// State Register	
	enum logic [1 : 0] {
		S0 = 2'b00,
		S1 = 2'b01,			 
		S2 = 2'b10,			 
		S3 = 2'b11			 
	} cstate, nstate;
	
	always_ff @ (posedge clk or posedge rst) begin
		if (rst)
			cstate <= S0;
		else
			cstate <= nstate;
	end
//! State Register




// Next State Logic
	always_comb begin
		case (cstate)
			S0:			nstate = t01 ? S1 : S0;
			S1:			nstate = t12 ? S2 : S1;				
			S2:			nstate = t23 ? S3 : S2;				
			S3:			nstate = t30 ? S0 : S3;				
			default:	nstate = S0;
		endcase
	end
//! Next State Logic




// Output Logic
	assign st = cstate;
//! Output Logic



endmodule