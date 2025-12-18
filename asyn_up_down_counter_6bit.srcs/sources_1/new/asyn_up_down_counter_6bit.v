`timescale 1ns / 1ps


module jkff(clk,j,k,q,qb);
input clk,j,k;
output reg q,qb;
initial begin
    q = 0; 
    qb = 1;
end
always @(negedge clk) begin
    if (j==0 & k==0) begin
        q <= q; qb <= qb;
    end
    else if (j==1 & k==0) begin
        q <= 1; qb <= 0;
    end
    else if (j==0 & k==1) begin
        q <= 0; qb <= 1;
    end
    else if (j==1 & k==1) begin
        q <= ~q; qb <= ~qb;
    end
end
endmodule


module asyn_up_down_counter_6bit(CLK,slt,J,K,Q,Qb);
input CLK,slt;
input [5:0]J,K;
output [5:0]Q,Qb;
wire [5:0]Q_,Qb_;

jkff jkff0(CLK,J[0],K[0],Q[0],Qb[0]);
assign Q_[0] = Q[0] ^ slt;
assign Qb_[0] = Qb[0] ^ slt;
jkff jkff1(Q_[0],J[1],K[1],Q[1],Qb[1]);
assign Q_[1] = Q[1] ^ slt;
assign Qb_[1] = Qb[1] ^ slt;
jkff jkff2(Q_[1],J[2],K[2],Q[2],Qb[2]);
assign Q_[2] = Q[2] ^ slt;
assign Qb_[2] = Qb[2] ^ slt;
jkff jkff3(Q_[2],J[3],K[3],Q[3],Qb[3]);
assign Q_[3] = Q[3] ^ slt;
assign Qb_[3] = Qb[3] ^ slt;
jkff jkff4(Q_[3],J[4],K[4],Q[4],Qb[4]);
assign Q_[4] = Q[4] ^ slt;
assign Qb_[4] = Qb[4] ^ slt;
jkff jkff5(Q_[4],J[5],K[5],Q[5],Qb[5]);
assign Q_[5] = Q[5] ^ slt;
assign Qb_[5] = Qb[5] ^ slt;

endmodule

