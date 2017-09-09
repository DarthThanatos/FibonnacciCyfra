module tile(
	output reg sum,
	output reg carry,
	input reset,
	input clk,
	input prevCarry
);

wire outQ0, outQ1;

regD Q1(.clk(clk), .reset(reset), .d(outQ0), .q(outQ1) );
regD Q0(.clk(clk), .reset(reset), .d(sum), .q(outQ0));

always@(posedge clk or posedge prevCarry) // to prevent signal prevCarry from delaying
begin
	sum <= outQ1 ^ outQ0 ^ prevCarry;
	carry <= (prevCarry & outQ0) | (outQ1 & outQ0) | (prevCarry & outQ1); 
end

endmodule
