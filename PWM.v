module PWM ( clk, reset, PWM_out);

input clk, reset;
output reg PWM_out;
reg [2:0] state , next_state;
parameter start = 3'b000, toggle = 3'b001, resetCounter = 3'b010;
integer counter = 0;


always@(posedge clk, posedge reset)
begin
	if(reset)
		state <= start;
	else
		begin
		state <= next_state;
		case (state)
			start : counter <= counter + 1;
			toggle: counter <= counter + 1;
			resetCounter : counter <= 0;
			default : counter <= 0;
		endcase
		end
end


always@(state, counter)
	case(state)
		start	:begin
			 if( counter < 400000 )
				next_state = start;
			 else
				next_state = toggle;
			 end
		toggle	:begin
			 if( counter < 500000 )
				next_state = toggle;
			 else
				next_state = resetCounter;
			 end
				 
		resetCounter : next_state = start;
		               		
		default	: next_state = start;
	endcase	


always @ (state)
	case (state)
		start : PWM_out = 0;

		toggle: PWM_out = 1;
				
		resetCounter : PWM_out = 0;


	endcase



endmodule
