module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    reg [511:0] rule_90;
    always@(*)begin
        rule_90 <= (q<<1) ^ (q>>1);
    end
    always@(posedge clk) begin
        if(load)
            q<=data;
        else
            q<=rule_90;
    end
endmodule