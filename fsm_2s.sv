/*
	2-state FSM
	
	Set t<x><y> to 1 to move from state <x> to state <y>.
	
	********************************************************************
	fsm_2s
		fsm_2s_inst
	(
		.clk	(),
		.rst	(),
		
		.t01	(),	// i
		.t10	(),	// i
		.st		()	// o
	);
*/

module fsm_2s
(
	input  logic clk,
	input  logic rst,
	
	input  logic t01,
	input  logic t10,
	output logic st
);



// State Register	
	enum logic {
		S0 = 1'b0,
		S1 = 1'b1			 
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
			S1:			nstate = t10 ? S0 : S1;				
			default:	nstate = S0;
		endcase
	end
//! Next State Logic




// Output Logic
	assign st = cstate;
//! Output Logic



endmodule