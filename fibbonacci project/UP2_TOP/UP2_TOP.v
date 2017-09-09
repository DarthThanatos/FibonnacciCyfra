module UP2_TOP(
	input [1:0] SW,
	output [6:0] DISP1,
	output [6:0] DISP2,
	output [6:0] DISP3,
	output [6:0] DISP4,
	output DISP4_DP
);

wire carry0,sum0;

start s1(
	.clock(SW[0]),
	.set(SW[1]),
	.sum(sum0),
	.carry(carry0)
);

wire carry1,sum1;

tile t1(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry0),
	.sum(sum1),
	.carry(carry1),
);

wire carry2,sum2;

tile t2(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry1),
	.sum(sum2),
	.carry(carry2),
);

wire carry3,sum3;

tile t3(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry2),
	.sum(sum3),
	.carry(carry3),
);

dek7seg d1(
	.data_in({sum3,sum2,sum1,sum0}),
	.seg(DISP4[6:0])
);

wire carry4, sum4;

tile t4(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry3),
	.sum(sum4),
	.carry(carry4),
);

wire carry5,sum5;

tile t5(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry4),
	.sum(sum5),
	.carry(carry5),
);

wire carry6,sum6; 

tile t6(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry5),
	.sum(sum6),
	.carry(carry6),
);

wire carry7,sum7; 

tile t7(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry6),
	.sum(sum7),
	.carry(carry7),
);

dek7seg d2(
	.data_in({sum7,sum6,sum5,sum4}),
	.seg(DISP3[6:0])
);

wire carry8,sum8; 

tile t8(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry7),
	.sum(sum8),
	.carry(carry8),
);

wire carry9,sum9; 

tile t9(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry8),
	.sum(sum9),
	.carry(carry9),
);

wire carry10,sum10; 

tile t10(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry9),
	.sum(sum10),
	.carry(carry10),
);

wire carry11,sum11; 

tile t11(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry10),
	.sum(sum11),
	.carry(carry11),
);


dek7seg d3(
	.data_in({sum11,sum10,sum9,sum8}),
	.seg(DISP2[6:0])
);

wire carry12,sum12; 

tile t12(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry11),
	.sum(sum12),
	.carry(carry12),
);

wire carry13,sum13; 

tile t13(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry12),
	.sum(sum13),
	.carry(carry13),
);

wire carry14,sum14; 

tile t14(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry13),
	.sum(sum14),
	.carry(carry14),
);

wire sum15; 

tile t15(
	.clk(SW[0]),
	.reset(SW[1]),
	.prevCarry(carry14),
	.sum(sum15),
	.carry(DISP4_DP),
);

dek7seg d4(
	.data_in({sum15,sum14,sum13,sum12}),
	.seg(DISP1[6:0])
);

endmodule