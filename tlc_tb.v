`timescale 1ns/1ps

module tb_traffic;
    reg clk, rst;
    wire [2:0] n,s,e,w;

    traffic uut (.n(n), .s(s), .e(e), .w(w), .clk(clk), .rst(rst));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #10;
        rst = 0;
        #200;
        $finish;
    end

    initial begin
        $display("Time\tN\tS\tE\tW\tState");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, n, s, e, w, uut.st);
    end
endmodule
