/*
	8-state sequencer FSM with one-hot state encoding.
	
	Set t<x><y> to 1 to move from state <x> to state <y>.
	
	********************************************************************
	fsm_oe8s_sequencer
		fsm_oe8s_sequencer_inst
	(
		.clk	(),
		.rst	(),
		
		.t01	(),	// i
		.t12	(),	// i
		.t23	(),	// i
		.t34	(),	// i
		.t45	(),	// i
		.t56	(),	// i
		.t67	(),	// i
		.t70	(),	// i
		.st0	(),	// o
		.st1	(),	// o
		.st2	(),	// o
		.st3	(),	// o
		.st4	(),	// o
		.st5	(),	// o
		.st6	(),	// o
		.st7	()	// o
	);
*/

module fsm_oe8s_sequencer
(
	input  logic clk,
	input  logic rst,
	
	input  logic t01,
	input  logic t12,
	input  logic t23,
	input  logic t34,
	input  logic t45,
	input  logic t56,
	input  logic t67,
	input  logic t70,
	output logic st0,
	output logic st1,
	output logic st2,
	output logic st3,
	output logic st4,
	output logic st5,
	output logic st6,
	output logic st7
);



// State Register	
	enum logic [2 : 0] {
		S0 = 3'b000,
		S1 = 3'b001,			 
		S2 = 3'b010,			 
		S3 = 3'b011,			 
		S4 = 3'b100,			 
		S5 = 3'b101,			 
		S6 = 3'b110,			 
		S7 = 3'b111			 
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
			S3:			nstate = t34 ? S4 : S3;				
			S4:			nstate = t45 ? S5 : S4;				
			S5:			nstate = t56 ? S6 : S5;				
			S6:			nstate = t67 ? S7 : S6;				
			S7:			nstate = t70 ? S0 : S7;				
			default:	nstate = S0;
		endcase
	end
//! Next State Logic




// Output Logic
	assign st0 = cstate == S0;
	assign st1 = cstate == S1;
	assign st2 = cstate == S2;
	assign st3 = cstate == S3;
	assign st4 = cstate == S4;
	assign st5 = cstate == S5;
	assign st6 = cstate == S6;
	assign st7 = cstate == S7;
//! Output Logic



endmodule