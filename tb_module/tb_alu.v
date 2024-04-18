module tb_alu;

    parameter HALF_CYCLE = 5;

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] control;
    reg clk;

    wire [7:0] _output;
    wire zero;
    wire overflow;

    alu alu_0(
        .a(a), 
        .b(b), 
        .control(control), 
        .clk(clk),
        ._output(_output),
        .zero(zero),
        .overflow(overflow)
    );

    //generate clock
    always begin
        clk = 1'b0;
        #HALF_CYCLE clk = 1'b1;
        #HALF_CYCLE;
    end

    initial begin
        // Testcase 1 (Test Normal Value and Test Control Input)
        a = 8'b01001101;
        b = 8'b10011011;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;
        control = 4'b1111;
        #10;
        control = 4'b1110;
        #10;


        // Testcase 2 (Test Boundary Value - a_min)
        a = 8'b00000000;
        b = 8'b10011011;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 3 (Test Boundary Value - a_min(+))
        a = 8'b00000001;
        b = 8'b10011011;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 4 (Test Boundary Value - a_max)
        a = 8'b11111111;
        b = 8'b10011011;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 5 (Test Boundary Value - a_max(-))
        a = 8'b11111110;
        b = 8'b10011011;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 6 (Test Boundary Value - b_min)
        a = 8'b01001101;
        b = 8'b00000000;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 7 (Test Boundary Value - b_min(+))
        a = 8'b01001101;
        b = 8'b00000001;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 8 (Test Boundary Value - b_max)
        a = 8'b01001101;
        b = 8'b11111111;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 9 (Test Boundary Value - b_max(-))
        a = 8'b01001101;
        b = 8'b11111110;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Test 4 corners
        // Corner - a_min b_min
        // Testcase 10 (Test Boundary Value - a_min b_min)
        a = 8'b00000000;
        b = 8'b00000000;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 11 (Test Boundary Value - a_min(+) b_min)
        a = 8'b00000001;
        b = 8'b00000000;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 12 (Test Boundary Value - a_min b_min(+))
        a = 8'b00000000;
        b = 8'b00000001;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 13 (Test Boundary Value - a_min(+) b_min(+))
        a = 8'b00000001;
        b = 8'b00000001;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Corner - a_max b_min
        // Testcase 14 (Test Boundary Value - a_max b_min)
        a = 8'b11111111;
        b = 8'b00000000;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 15 (Test Boundary Value - a_max(-) b_min)
        a = 8'b11111110;
        b = 8'b00000000;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 16 (Test Boundary Value - a_max b_min(+))
        a = 8'b11111111;
        b = 8'b00000001;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 17 (Test Boundary Value - a_max(-) b_min(+))
        a = 8'b11111110;
        b = 8'b00000001;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Corner a_min b_max
        // Testcase 18 (Test Boundary Value - a_min b_max)
        a = 8'b00000000;
        b = 8'b11111111;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 19 (Test Boundary Value - a_min(+) b_max)
        a = 8'b00000001;
        b = 8'b11111111;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 20 (Test Boundary Value - a_min b_max(-))
        a = 8'b00000000;
        b = 8'b11111110;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Testcase 21 (Test Boundary Value - a_min(+) b_max(-))
        a = 8'b00000001;
        b = 8'b11111110;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        // Corner a_max b_max
        // Testcase 22 (Test Boundary Value - a_max b_max)
        a = 8'b11111111;
        b = 8'b11111111;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 23 (Test Boundary Value - a_max(-) b_max)
        a = 8'b11111110;
        b = 8'b11111111;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 24 (Test Boundary Value - a_max b_max(-))
        a = 8'b11111111;
        b = 8'b11111110;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;

        // Testcase 25 (Test Boundary Value - a_max(-) b_max(-))
        a = 8'b11111110;
        b = 8'b11111110;
        control = 4'b0000;
        #10;
        control = 4'b0001;
        #10;
        control = 4'b0010;
        #10;
        control = 4'b0110;
        #10;


        $finish;
    end

    initial begin
        $recordfile("waves");
        $recordvars("depth=0", tb_alu);
    end

endmodule
