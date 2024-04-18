module alu(
    input [7:0] a,
    input [7:0] b,
    input [3:0] control,
    input clk,
    output [7:0] _output,
    output zero,
    output overflow
);
    parameter AND_OP = 2'b00;
    parameter OR_OP = 2'b01;
    parameter ADD_SUB_OP = 2'b10;

    reg [7:0] a_in;
    reg [7:0] b_in;
    reg [3:0] ctrl_in;

    wire[7:0] b_comp_1;
    wire[7:0] b_adder_in;

    wire c_in_adder;
    wire c_out_adder;

    wire [7:0] adder_output;
    wire [7:0] and_output;
    wire [7:0] or_output;

    always @(posedge clk) begin
        a_in <= a;
        b_in <= b;
        ctrl_in <= control;
    end

    // For adder and substraction
    assign c_in_adder = ctrl_in[2];
    complement1_8bit complement1_8bit_0(
        .in(b_in), 
        .out(b_comp_1)
    );
    
    // MUX choose +b or -b
    assign b_adder_in = (ctrl_in[2]) ? b_comp_1 : b_in;

    adder_8bit adder_8bit_0(
        .a(a_in), 
        .b(b_adder_in), 
        .c_in(c_in_adder), 
        .sum(adder_output), 
        .c_out(c_out_adder)
    );

    and_8bit and_8bit_0(
        .a(a_in),
        .b(b_in),
        .out(and_output)
    );

    or_8bit or_8bit_0(
        .a(a_in),
        .b(b_in),
        .out(or_output)
    );

    // MUX choose operator
    assign _output = (ctrl_in[1:0] == AND_OP) ? and_output :
                     (ctrl_in[1:0] == OR_OP) ?  or_output :
                     (ctrl_in[1:0] == ADD_SUB_OP) ?  adder_output : 
                     8'b0;

    // Other output
    // For overflow bit
    assign overflow = (ctrl_in[1]) ? c_out_adder : 1'b0;

    // For zero
    assign zero = |_output;

endmodule



module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input c_in,
    output [7:0] sum,
    output c_out
);

    wire [7:0] w_c_out;

    // Generate 8 full adders
    genvar i;
    generate

        full_adder FA(
            .a(a[0]),
            .b(b[0]),
            .c_in(c_in ), // Carry input from previous stage or cin for the first stage
            .sum(sum[0]),
            .c_out(w_c_out[0])
        );

        for (i = 1; i <= 7; i = i + 1) begin : gen_fa
            full_adder FA(
                .a(a[i]),
                .b(b[i]),
                .c_in(w_c_out[i - 1]), // Carry input from previous stage or cin for the first stage
                .sum(sum[i]),
                .c_out(w_c_out[i])
            );
        end
    endgenerate

    assign c_out = w_c_out[7];

endmodule


module or_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] out
);

    assign out = a | b;

endmodule



module and_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] out
);
  
    assign out = a & b;

endmodule



module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
);

    assign sum = a ^ b ^ c_in;
    assign c_out = (a & b) | (c_in & (a ^ b));

endmodule



module complement1_8bit(
    input [7:0] in,
    output [7:0] out
);

    assign out = ~in;

endmodule
