`timescale 1ns / 1ps

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// testbenches requires a module without inputs or outputs
// It's only a "virtual" module. We cannot implement hardware with this!!!
module debouncer_testbench();
  
    // We need to give values at the inputs, so we define them as registers  
	logic clk, rst, PB, PB_pressed_status, PB_pressed_pulse, PB_released_pulse;
	
	// an instance of the Device Under Test using implicit port connections
//	PB_Debouncer_FSM DUT(
//        .*
//        );
        
    PB_Debouncer_counter DUT(
            .*
            );
            
	// generate a clock signal that inverts its value every five time units
	always  #1 clk=~clk;
	
	//here we assign values to the inputs
	initial begin
		clk = 1'b0;
		rst = 1'b0;
		PB = 1'b0;
		#60 rst = 1'b1;
        #30 rst = 1'b0;
		#50 PB = 1'b1;
		#100 PB = 1'b0;
		#50 PB = 1'b1;
		#3  PB = 1'b0;
		#20 PB = 1'b1;
		#80 PB = 1'b0;
	end

endmodule