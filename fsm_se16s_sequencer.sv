/*
	16-state sequencer FSM with sequential state encoding.
	
	Set t<x><y> to 1 to move from state <x> to state <y>.
	
	********************************************************************
	fsm_se16s_sequencer
		fsm_se16s_sequencer_inst
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
		.t78	(),	// i
		.t89	(),	// i
		.t9a	(),	// i
		.tab	(),	// i
		.tbc	(),	// i
		.tcd	(),	// i
		.tde	(),	// i
		.tef	(),	// i
		.tf0	(),	// i
		.st		()	// o[3 : 0]
	);
*/

module fsm_se16s_sequencer
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
	input  logic t78,
	input  logic t89,
	input  logic t9a,
	input  logic tab,
	input  logic tbc,
	input  logic tcd,
	input  logic tde,
	input  logic tef,
	input  logic tf0,
	output logic [3 : 0] st
);



// State Register	
	enum logic [3 : 0] {
		S0 = 4'b0000,
		S1 = 4'b0001,			 
		S2 = 4'b0010,			 
		S3 = 4'b0011,			 
		S4 = 4'b0100,			 
		S5 = 4'b0101,			 
		S6 = 4'b0110,			 
		S7 = 4'b0111,
		S8 = 4'b1000,
		S9 = 4'b1001,			 
		S10 = 4'b1010,			 
		S11 = 4'b1011,			 
		S12 = 4'b1100,			 
		S13 = 4'b1101,			 
		S14 = 4'b1110,			 
		S15 = 4'b1111
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
			S7:			nstate = t78 ? S8 : S7;	
			S8:			nstate = t89 ? S9 : S8;
			S9:			nstate = t9a ? S10 : S9;				
			S10:		nstate = tab ? S11 : S10;				
			S11:		nstate = tbc ? S12 : S11;				
			S12:		nstate = tcd ? S13 : S12;				
			S13:		nstate = tde ? S14 : S13;				
			S14:		nstate = tef ? S15 : S14;				
			S15:		nstate = tf0 ? S0 : S15;				
			default:	nstate = S0;
		endcase
	end
//! Next State Logic




// Output Logic
	assign st = cstate;
//! Output Logic



endmodule