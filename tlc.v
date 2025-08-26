module traffic(n,s,e,w,clk,rst);
    output reg [2:0] n,s,e,w;
    input clk, rst;

    reg [2:0] st, cnt;

    parameter NG = 3'b000;
    parameter NY = 3'b001;
    parameter SG = 3'b010;
    parameter SY = 3'b011;
    parameter EG = 3'b100;
    parameter EY = 3'b101;
    parameter WG = 3'b110;
    parameter WY = 3'b111;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            st = NG;
            cnt = 3'b000;
        end
        else begin
            case(st)
                NG:  if(cnt==3'b111) begin cnt=0; st=NY; end else cnt=cnt+1;
                NY:  if(cnt==3'b011) begin cnt=0; st=SG; end else cnt=cnt+1;
                SG:  if(cnt==3'b111) begin cnt=0; st=SY; end else cnt=cnt+1;
                SY:  if(cnt==3'b011) begin cnt=0; st=EG; end else cnt=cnt+1;
                EG:  if(cnt==3'b111) begin cnt=0; st=EY; end else cnt=cnt+1;
                EY:  if(cnt==3'b011) begin cnt=0; st=WG; end else cnt=cnt+1;
                WG:  if(cnt==3'b111) begin cnt=0; st=WY; end else cnt=cnt+1;
                WY:  if(cnt==3'b011) begin cnt=0; st=NG; end else cnt=cnt+1;
            endcase
        end
    end

    always @(st) begin
        case(st)
            NG: begin n=3'b001; s=3'b100; e=3'b100; w=3'b100; end
            NY: begin n=3'b010; s=3'b100; e=3'b100; w=3'b100; end
            SG: begin n=3'b100; s=3'b001; e=3'b100; w=3'b100; end
            SY: begin n=3'b100; s=3'b010; e=3'b100; w=3'b100; end
            EG: begin n=3'b100; s=3'b100; e=3'b001; w=3'b100; end
            EY: begin n=3'b100; s=3'b100; e=3'b010; w=3'b100; end
            WG: begin n=3'b100; s=3'b100; e=3'b100; w=3'b001; end
            WY: begin n=3'b100; s=3'b100; e=3'b100; w=3'b010; end
        endcase
    end
endmodule
