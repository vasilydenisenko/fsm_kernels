/*
	4-state universal FSM with one-hot state encoding.
	
	Set t<y>x to <s> to move from state <y> to state <s>.
	
	********************************************************************
	fsm_oe4s_universal
		fsm_oe4s_universal_inst
	(
		.clk	(),
		.rst	(),
		
		.t0x	(),	// i[1 : 0]
		.t1x	(),	// i[1 : 0]
		.t2x	(),	// i[1 : 0]
		.t3x	(),	// i[1 : 0]
		
		.st0	(),	// o
		.st1	(),	// o
		.st2	(),	// o
		.st3	()	// o
	);
*/

module fsm_oe4s_universal
(
	input  logic 			clk,
	input  logic 			rst,
	
	input  logic [1 : 0] 	t0x,
	input  logic [1 : 0] 	t1x,
	input  logic [1 : 0] 	t2x,
	input  logic [1 : 0] 	t3x,

	output logic 			st0,
	output logic 			st1,
	output logic 			st2,
	output logic 			st3
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
			S0:	
				case (t0x)
					2'd0: 		nstate = S0;
					2'd1: 		nstate = S1;
					2'd2: 		nstate = S2;
					2'd3: 		nstate = S3;
					default: 	nstate = S0;
				endcase
			S1:	
				case (t1x)
					2'd0: 		nstate = S0;
					2'd1: 		nstate = S1;
					2'd2: 		nstate = S2;
					2'd3: 		nstate = S3;
					default: 	nstate = S1;
				endcase			
			S2:	
				case (t2x)
					2'd0: 		nstate = S0;
					2'd1: 		nstate = S1;
					2'd2: 		nstate = S2;
					2'd3: 		nstate = S3;
					default: 	nstate = S2;
				endcase				
			S3:	
				case (t3x)
					2'd0: 		nstate = S0;
					2'd1: 		nstate = S1;
					2'd2: 		nstate = S2;
					2'd3: 		nstate = S3;
					default: 	nstate = S3;
				endcase				
			default:			nstate = S0;
		endcase
	end
//! Next State Logic




// Output Logic
	assign st0 = cstate == S0;
	assign st1 = cstate == S1;
	assign st2 = cstate == S2;
	assign st3 = cstate == S3;
//! Output Logic



endmodule