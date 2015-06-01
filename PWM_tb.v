`timescale 1ns/1ns  
module PWM_tb();

reg clk, reset;
wire PWM_out;

PWM testing ( clk, reset, PWM_out);

always #10 clk = ~clk;

integer i, j;

initial 

begin
#0  clk = 0; reset = 1; 
#1000000 reset = 0;
for(i = 0; i < 30 ; i = i + 1)
begin
	printAtEveryMillisecond();
	
end
     

#50 $stop;

end


task printAtEveryMillisecond();
begin
#1000000	checkResult();

end
endtask


task checkResult();
begin
    $display( " Value %d at time  %t \n", PWM_out, $time);  

end
endtask


endmodule
