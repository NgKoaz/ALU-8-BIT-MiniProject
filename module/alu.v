module alu(
    input [7:0] input1,
    input [7:0] input2,
    input [3:0] control,
    output reg [7:0] _output,
    output reg overflow,
    output reg zero
);

    

    assign zero = |_output;
    
endmodule