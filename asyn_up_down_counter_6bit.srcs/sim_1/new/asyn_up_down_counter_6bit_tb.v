`timescale 1ns / 1ps


module asyn_up_down_counter_6bit_tb();
reg tCLK,tslt;
reg [5:0]tJ,tK;
wire [5:0]tQ,tQb;

asyn_up_down_counter_6bit dut (.CLK(tCLK), .slt(tslt), .J(tJ), .K(tK), .Q(tQ), .Qb(tQb));

initial begin
    tJ = 6'b111111;
    tK = 6'b111111;
end

initial begin
    tslt = 0;
    #700 tslt = 1;
end

initial begin
    tCLK = 0;
    forever #5 tCLK = ~tCLK;
end

endmodule

