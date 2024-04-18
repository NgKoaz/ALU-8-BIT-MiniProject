`timescale 1ns / 1ps
`include "./module/or_8bit.v"

module tb_or8bit;

  // Khai báo các tín hiệu
  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] out;
  reg clk;

  // Đối tượng cần kiểm tra
  or_8bit Or_8bit(
    .a(a),
    .b(b),
    .out(out)
  );

  // Tạo clock
  always #5 clk = ~clk;

  // Mô phỏng dữ liệu vào
  initial begin
       clk = 1'b0;
       a = 8'b00000000; b = 8'b00000000; // Test case 1: 2 số 0
    #5 a = 8'b00000000; b = 8'b11010011; // Test case 2: 1 số 0, 1 số khác 0
    #5 a = 8'b11111111; b = 8'b00000000; // Test case 3: 1 số 255, 1 số 0
    #5 a = 8'b11111111; b = 8'b11111111; // Test case 4: 2 số 255
    #5 a = 8'b10101010; b = 8'b11001100; // Test case 5: 1 số chẵn, 1 số lẻ
    #5 a = 8'b11101100; b = 8'b00010011; // Test case 6: 1 số là bù 1 của số kia
    $finish;
  end

  //Hiển thị kết quả
  // always @(posedge clk) begin
  //   $display("a: %h, b: %h", a, b);
  // end

  // // Lên Waveform
  initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, tb_or8bit);
  end

endmodule
