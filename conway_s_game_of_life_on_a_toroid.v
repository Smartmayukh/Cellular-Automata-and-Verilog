module top_module(
input clk,
input load,
input [255:0] data,
output [255:0] q );
    
wire [3:0] sum;
wire [15:0][0:15] mayukh;
wire [15:0][0:15] temp; 
    always@(*)begin
    mayukh=q;
    temp=q;
    for(int i=0;i<16;i++)
                  begin
                       for(int j=0;j<16;j++)
                       begin
                           sum=( mayukh[(i)%5'd16][(j-5'd1)%5'd16]+ 
                                 mayukh[(i)%5'd16][(j+5'd1)%5'd16]+
                                 mayukh[(i-5'd1)%5'd16][(j)%5'd16]+ 
                                 mayukh[(i-5'd1)%5'd16][(j-5'd1)%5'd16]+ 
                                 mayukh[(i-5'd1)%5'd16][(j+5'd1)%5'd16]+ 
                                 mayukh[(i+5'd1)%5'd16][(j)%5'd16]+ 
                                 mayukh[(i+5'd1)%5'd16][(j+5'd1)%5'd16]+ 
                                 mayukh[(i+5'd1)%5'd16][(j-5'd1)%5'd16] );                             
                            case(sum)                                 
                                4'd2:temp[i][j]=temp[i][j];
                                4'd3:temp[i][j]=1;
                                default:temp[i][j]=0;
                            endcase
                       end
                  end
    end
    
    
   always@(posedge clk) begin
       if(load)
          q<=data;
       else
          q<=temp;
       end
endmodule