module Mux_2to1_muxC(
input [31:0] constant_in,
input [31:0] B_data_in,
input C_select,
output reg [31:0] B

    );
    
    always @(*)
    begin
        case(C_select)
            2'b0: B = constant_in;
            2'b1: B = B_data_in;

            default: B = 32'b0;
        endcase
    end

endmodule

module Mux_2to1_muxD(
input [31:0] F_in,
input [31:0] Data_in,
input D_select,
output reg [31:0] D_data

    );
    
    always @(*)
    begin
        case(D_select)
            2'b0: D_data = F_in;
            2'b1: D_data = Data_in;
            default: D_data = 32'b0;
        endcase
    end

endmodule
