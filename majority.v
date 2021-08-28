module s_majority(in,out,clk,rst);
  input in,clk,rst;
  output reg out;
  localparam s0=0;
  reg machine;
  reg [31:0] count_zero,count_one;
  always@(posedge clk) begin
    if(rst) begin machine <= s0; end
    else begin machine <= machine; end
    
    case(machine) 
      s0: begin
        if(in==1) count_one=count_one+1;
        else if(in==0) count_zero=count_zero+1;
        else begin
        	count_one=count_one;
            count_zero=count_zero;
        end
        
        if(count_one>=count_zero) out=1;
        else out=0;
        
        machine <= s0;
      end
      default: begin
        count_one=0;
        count_zero=0;
        machine <= s0;
        out <= 0;
      end
    endcase
  end
endmodule
