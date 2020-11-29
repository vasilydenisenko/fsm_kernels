/*
	8-state universal FSM with one-hot state encoding.
	
	Set t<y>x to <s> to move from state <y> to state <s>.
	
	********************************************************************
	fsm_oe8s_universal
		fsm_oe8s_universal_inst
	(
		.clk	(),
		.rst	(),
		
		.t0x	(),	// i[2 : 0]
		.t1x	(),	// i[2 : 0]
		.t2x	(),	// i[2 : 0]
		.t3x	(),	// i[2 : 0]
		.t4x	(),	// i[2 : 0]
		.t5x	(),	// i[2 : 0]
		.t6x	(),	// i[2 : 0]
		.t7x	(),	// i[2 : 0]
		
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

module fsm_oe8s_universal
(
	input  logic 			clk,
	input  logic 			rst,
	
	input  logic [2 : 0] 	t0x,
	input  logic [2 : 0] 	t1x,
	input  logic [2 : 0] 	t2x,
	input  logic [2 : 0] 	t3x,
	input  logic [2 : 0] 	t4x,
	input  logic [2 : 0] 	t5x,
	input  logic [2 : 0] 	t6x,
	input  logic [2 : 0] 	t7x,

	output logic 			st0,
	output logic 			st1,
	output logic 			st2,
	output logic 			st3,
	output logic 			st4,
	output logic 			st5,
	output logic 			st6,
	output logic 			st7
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
			S0:	
				case (t0x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S0;
				endcase
			S1:	
				case (t1x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S1;
				endcase			
			S2:	
				case (t2x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S2;
				endcase				
			S3:	
				case (t3x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S3;
				endcase
			S4:	
				case (t4x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S4;
				endcase	
			S5:	
				case (t5x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S5;
				endcase
			S6:	
				case (t6x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S6;
				endcase
			S7:	
				case (t7x)
					3'd0: 		nstate = S0;
					3'd1: 		nstate = S1;
					3'd2: 		nstate = S2;
					3'd3: 		nstate = S3;
					3'd4: 		nstate = S4;
					3'd5: 		nstate = S5;
					3'd6: 		nstate = S6;
					3'd7: 		nstate = S7;
					default: 	nstate = S7;
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
	assign st4 = cstate == S4;
	assign st5 = cstate == S5;
	assign st6 = cstate == S6;
	assign st7 = cstate == S7;
//! Output Logic



endmodule