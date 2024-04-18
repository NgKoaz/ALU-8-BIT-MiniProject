`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 11:32:59 AM
// Design Name: 
// Module Name: full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder_tb(

    );
    integer file;
    integer idx;
    reg a, b, c_in;
    wire sum, c_out;
    
    full_adder UUT(.a(a), .b(b), .c_in(c_in), .c_out(c_out), .sum(sum));
    
    initial begin
        for (idx = 0; idx < 8; idx = idx + 1) begin
            {a, b, c_in} = idx;
            // comment the following line if you want to write out to file
            #1 $fmonitor(file, "time = %0t: a = %0d, b = %0d, c_in = %0d, sum = %0d, c_out = %0d", $time, a, b, c_in, sum, c_out);
            #10;
        end
    end
    
    // comment line 44 to 49 if you want to write out to file
    ////////////////////////////////////////////////////////////
    initial begin
        file = $fopen("E:/code_vivado/miniproject/output/full_adder.txt", "w");
        $fdisplay(file, "Hello World");
        #100;
        $fclose(file);
    end
    ////////////////////////////////////////////////////////////

    initial begin
        #100;     // running duration
        $finish;
    end
    
endmodule
