`include "Alu.vh"

module Alu #(
    parameter DBITS = 32
) (
    input [DBITS - 1 : 0] in1,
    input [DBITS - 1 : 0] in2,
    input [`FUNC_BITS - 1 : 0] func,
    output [DBITS - 1 : 0] out
);


assign out = 
        func == `ADD ? in1 + in2 :
        func == `SUB ? in1 - in2 :
        func == `AND ? in1 & in2 :
        func == `OR ? in1 | in2 :
        func == `XOR ? in1 ^ in2 :
        func == `NAND ? ~(in1 & in2) :
        func == `NOR ? ~(in1 | in2) :
        func == `XNOR ? ~(in1 ^ in2) :
        func == `MVHI ? in2 << 16 :
        
        func == `F ? 0 :
        func == `EQ ? (in1 == in2 ? 1 : 0) :
        func == `LT ? ($signed(in1) < $signed(in2) ? 1 : 0) :
        func == `LTE ? ($signed(in1) <= $signed(in2) ? 1 : 0) :
        func == `T ? 1 :
        func == `NE ? (in1 != in2 ? 1 : 0) :
        func == `GTE ? ($signed(in1) >= $signed(in2) ? 1 : 0) :
        func == `GT ? ($signed(in1) > $signed(in2) ? 1 : 0) :
        {DBITS{1'bz}};


endmodule
