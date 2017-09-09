module regD( clk, reset, set, d, q);
  input clk, reset, d,set;
  output q;
    
  reg   q;
  wire clk, reset, d;
  
  always @ (posedge clk or posedge reset or posedge set)
  if (reset) begin
    q <= 1'b0;
  end 
else begin
	if (set) begin
		q <= 1'b1;
	end 
	else begin
	   	q <= d;
	end
end

endmodule