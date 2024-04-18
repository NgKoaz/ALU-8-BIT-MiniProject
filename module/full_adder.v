`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );
    
//    wire sum_ab, c_out_ab, c_out_temp;
    
//    half_adder HA_1(.a(a), .b(b), .sum(sum_ab), .c_out(c_out_ab));
//    half_adder HA_2(.a(c_in), .b(sum_ab), .sum(sum), .c_out(c_out_temp));
    
//    assign c_out = c_out_ab | c_out_temp;

    assign sum = a ^ b ^ c_in;
    assign c_out = (a & b) | (b & c_in) | (c_in & a);
    
endmodule

//module half_adder(
//  input a,
//  input b,
//  output sum,
//  output c_out
//  );

//  assign sum = a ^ b;
//  assign c_out = a & b;
  
//endmodule