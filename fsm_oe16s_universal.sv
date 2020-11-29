/*
	16-state universal FSM with one-hot state encoding.
	
	Set t<y>x to <s> to move from state <y> to state <s>.
	
	********************************************************************
	fsm_oe16s_universal
		fsm_oe16s_universal_inst
	(
		.clk	(),
		.rst	(),
		
		.t0x	(),	// i[3 : 0]
		.t1x	(),	// i[3 : 0]
		.t2x	(),	// i[3 : 0]
		.t3x	(),	// i[3 : 0]
		.t4x	(),	// i[3 : 0]
		.t5x	(),	// i[3 : 0]
		.t6x	(),	// i[3 : 0]
		.t7x	(),	// i[3 : 0]
		.t8x	(),	// i[3 : 0]
		.t9x	(),	// i[3 : 0]
		.tax	(),	// i[3 : 0]
		.tbx	(),	// i[3 : 0]
		.tcx	(),	// i[3 : 0]
		.tdx	(),	// i[3 : 0]
		.tex	(),	// i[3 : 0]
		.tfx	(),	// i[3 : 0]
		
		.st0	(),	// o
		.st1	(),	// o
		.st2	(),	// o
		.st3	(),	// o
		.st4	(),	// o
		.st5	(),	// o
		.st6	(),	// o
		.st7	(),	// o
		.st8	(),	// o
		.st9	(),	// o
		.sta	(),	// o
		.stb	(),	// o
		.stc	(),	// o
		.std	(),	// o
		.ste	(),	// o
		.stf	()	// o
	);
*/

module fsm_oe16s_universal
(
	input  logic 			clk,
	input  logic 			rst,
	
	input  logic [3 : 0] 	t0x,
	input  logic [3 : 0] 	t1x,
	input  logic [3 : 0] 	t2x,
	input  logic [3 : 0] 	t3x,
	input  logic [3 : 0] 	t4x,
	input  logic [3 : 0] 	t5x,
	input  logic [3 : 0] 	t6x,
	input  logic [3 : 0] 	t7x,
	input  logic [3 : 0] 	t8x,
	input  logic [3 : 0] 	t9x,
	input  logic [3 : 0] 	tax,
	input  logic [3 : 0] 	tbx,
	input  logic [3 : 0] 	tcx,
	input  logic [3 : 0] 	tdx,
	input  logic [3 : 0] 	tex,
	input  logic [3 : 0] 	tfx,

	output logic			st0,
	output logic			st1,
	output logic			st2,
	output logic			st3,
	output logic			st4,
	output logic			st5,
	output logic			st6,
	output logic			st7,
	output logic			st8,
	output logic			st9,
	output logic			sta,
	output logic			stb,
	output logic			stc,
	output logic			std,
	output logic			ste,
	output logic			stf
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
			S0:	
				case (t0x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S0;
				endcase
			S1:	
				case (t1x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S1;
				endcase			
			S2:	
				case (t2x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S2;
				endcase				
			S3:	
				case (t3x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S3;
				endcase
			S4:	
				case (t4x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S4;
				endcase	
			S5:	
				case (t5x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S5;
				endcase
			S6:	
				case (t6x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S6;
				endcase
			S7:	
				case (t7x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S7;
				endcase
			S8:	
				case (t8x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S8;
				endcase
			S9:	
				case (t9x)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S9;
				endcase			
			S10:	
				case (tax)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S10;
				endcase				
			S11:	
				case (tbx)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S11;
				endcase
			S12:	
				case (tcx)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S12;
				endcase	
			S13:	
				case (tdx)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S13;
				endcase
			S14:	
				case (tex)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S14;
				endcase
			S15:	
				case (tfx)
					4'd0: 		nstate = S0;
					4'd1: 		nstate = S1;
					4'd2: 		nstate = S2;
					4'd3: 		nstate = S3;
					4'd4: 		nstate = S4;
					4'd5: 		nstate = S5;
					4'd6: 		nstate = S6;
					4'd7: 		nstate = S7;
					4'd8: 		nstate = S8;
					4'd9: 		nstate = S9;
					4'd10: 		nstate = S10;
					4'd11: 		nstate = S11;
					4'd12: 		nstate = S12;
					4'd13: 		nstate = S13;
					4'd14: 		nstate = S14;
					4'd15: 		nstate = S15;
					default: 	nstate = S15;
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
	assign st8 = cstate == S8;
	assign st9 = cstate == S9;
	assign sta = cstate == S10;
	assign stb = cstate == S11;
	assign stc = cstate == S12;
	assign std = cstate == S13;
	assign ste = cstate == S14;
	assign stf = cstate == S15;
//! Output Logic



endmodule