module Datapath(
input clk,
input reset,
input load_enable,
input [1:0] dest_select,
input [1:0] A_select,
input [1:0] B_select,
input md_select,
input mb_select,
input [31:0] constant_in,
input [31:0] Data_in,

output [31:0] Address_out,
output [31:0] Data_out,
output [31:0] function_result

);

wire [31:0] A_data, B_data;
wire [31:0] F;
wire [31:0] B;
wire [31:0] D_data;

// Instantiate the register file
register_file u1(
    .clk(clk),
    .reset(reset),
    .load_enable(load_enable),
    .A_select(A_select),
    .B_select(B_select),
    .dest_select(dest_select),
    .D_data(D_data),
    .A_data(A_data),
    .B_data(B_data)

);


// Instantiate the adder
assign F = A_data + B;


// Instantiate the 2-to-1 MUX for selecting function unit input

Mux_2to1_muxC u2(
    .C_select(mb_select),
    .constant_in(constant_in),  
    .B_data_in(B_data),         
    .B(B)

);


// Instantiate the 2-to-1 MUX for selecting function unit output
Mux_2to1_muxD u3(
    .D_select(md_select),
    .F_in(F),           
    .Data_in(Data_in), 
    .D_data(function_result)

);

// Output of the function unit is the result
assign D_data = function_result;
assign Address_out = A_data;
assign Data_out = B;

endmodule