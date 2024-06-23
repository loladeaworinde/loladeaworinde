module register_file(
input clk,
input reset,
input load_enable,
input [1:0] A_select,
input [1:0] B_select,
input [1:0] dest_select,
input [31:0] D_data,
output [31:0] A_data,
output [31:0] B_data

    );
    
    reg [31:0] registers[3:0];
    
    always @(posedge clk)
    begin
        if(reset)
        begin
            registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
        end else
        if(load_enable)
        begin
            registers[dest_select] <= D_data;
        end
  
    end
    
  assign A_data = registers[A_select];
  assign B_data = registers[B_select];
  
endmodule