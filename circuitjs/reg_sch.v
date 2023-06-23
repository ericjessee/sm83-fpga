/**
 * This is an autogenerated netlist code from CircuitVerse. Verilog Code can be
 * tested on https://www.edaplayground.com/ using Icarus Verilog 0.9.7. This is an
 * experimental module and some manual changes make need to be done in order for
 * this to work.
 *
 * If you have any ideas/suggestions or bug fixes, raise an issue
 * on https://github.com/CircuitVerse/CircuitVerse/issues/new/choose
 */

/*
  Element Usage Report
    Input - 5 times
    TriState - 1 times
    Splitter - 2 times
    DflipFlop - 4 times
*/

/*
  Usage Instructions and Tips
    Labels - Ensure unique label names and avoid using verilog keywords
    Warnings - Connect all optional inputs to remove warnings
*/

// Sample Testbench Code - Uncomment to use

/*
module TestBench();

  reg inp_0, wr, rst, clk, oe;


  Main DUT0(inp_0, wr, rst, clk, oe);

  initial begin
    inp_0 = 0;
    wr = 0;
    rst = 0;
    clk = 0;
    oe = 0;

    #15

    #10

    $finish;

  end
endmodule

*/

module Main(inp_0, wr, rst, clk, oe);
  input inp_0, wr, rst, clk, oe;
  wire DflipFlop_0_Q, DflipFlop_3_Q, DflipFlop_2_Q, DflipFlop_1_Q;
  wire [3:0] TriState_0_out, Splitter_1_cmb;
  assign TriState_0_out = (oe!=0) ? Splitter_1_cmb : 4'b?;
  
  DflipFlop DflipFlop_0(DflipFlop_0_Q, , clk, TriState_0_out[3], rst, , wr);
  assign Splitter_1_cmb = {DflipFlop_0_Q,DflipFlop_3_Q,DflipFlop_2_Q,DflipFlop_1_Q};
  DflipFlop DflipFlop_3(DflipFlop_3_Q, , clk, TriState_0_out[2], rst, , wr);
  DflipFlop DflipFlop_2(DflipFlop_2_Q, , clk, TriState_0_out[1], rst, , wr);
  DflipFlop DflipFlop_1(DflipFlop_1_Q, , clk, TriState_0_out[0], rst, , wr);
endmodule

module DflipFlop(q, q_inv, clk, d, a_rst, pre, en);
    parameter WIDTH = 1;
    output reg [WIDTH-1:0] q, q_inv;
    input clk, a_rst, pre, en;
    input [WIDTH-1:0] d;

    always @ (posedge clk or posedge a_rst)
    if (a_rst) begin
        q <= 'b0;
        q_inv <= 'b1;
    end else if (en == 0) ;
    else begin
        q <= d;
        q_inv <= ~d;
    end
endmodule
    