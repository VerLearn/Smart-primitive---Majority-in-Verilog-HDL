module tb();
  reg in,clk,rst;
  reg maj;
  integer i;
  wire out;
  s_majority i1(in,out,clk,rst);
  always #5 clk=~clk;
  
  task check;
    input [9:0] inp;
    begin
    #4 rst=1;
      for(i=0;i<10;i=i+1) begin
      #10 rst=0;
      in=inp[i];
    end
    end
  endtask
  
  initial begin
  	clk=0;
    $dumpfile("tb.vcd");
    $dumpvars;
    $monitor("majority=%b",maj);
    check(10'b0011000101);
    #10;
    maj=out;
    $finish;
  end
endmodule
