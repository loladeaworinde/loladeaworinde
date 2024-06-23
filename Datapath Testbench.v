module datapath_tb;

 //Declare inputs as registers and outputs as wires 
reg clk; 
reg reset; 
reg load_enable; 
reg [1:0] dest_select; 
reg [1:0] A_select; 
reg [1:0] B_select; 
reg md_select; 
reg mb_select; 
reg [31:0] constant_in; 
reg [31:0] Data_in; 
wire [31:0] Address_out; 
wire [31:0] Data_out; 
wire [31:0] function_result; 



// Instantiate the Unit Under Test (UUT) 

Datapath uut ( 
    .clk(clk), 
    .reset(reset), 
    .load_enable(load_enable), 
    .dest_select(dest_select), 
    .A_select(A_select), 
    .B_select(B_select), 
    .md_select(md_select), 
    .mb_select(mb_select), 
    .constant_in(constant_in), 
    .Data_in(Data_in), 
    .Address_out(Address_out), 
    .Data_out(Data_out), 
    .function_result(function_result) 

); 

 

initial begin 

    // Initialize Inputs 
    clk = 0; 
    reset = 1;                                     // Start with reset active 
    load_enable = 0; 
    dest_select = 0; 
    A_select = 0; 
    B_select = 0; 
    md_select = 1; 
    mb_select = 0; 
    constant_in = 32'h5E6F789A; 
    Data_in = 0; 

 

    // Wait for 50 ns for global reset to finish 

    #50; 

    reset = 0;                                     // Release reset 

 

    // Test 1: Load data into registers and verify content 

    load_enable = 1; 
    dest_select = 2'b00;                           // Destination register R0 
    Data_in = 32'h1A2B3C4D;                        // Arbitrary data to load into R0 
    #10;                                           // Wait for the data to load 
    load_enable = 0;                               // Disable loading 
    #10;                                           // Wait for more than one clock cycle 


    load_enable = 1; 
    dest_select = 2'b01;                           // Destination register R1 
    Data_in = 32'h5A5A5A5A;                        // Arbitrary data to load into R1 
    #10;                                           // Wait for the data to load 
    load_enable = 0;                               // Disable loading 
    #10;                                           // Wait for more than one clock cycle  
    
    
    load_enable = 1; 
    dest_select = 2'b10;                           // Destination register R2 
    Data_in = 32'hABCDEF01;                        // Arbitrary data to load into R2 
    #10;                                           // Wait for the data to load 
    load_enable = 0;                               // Disable loading 
    #10;                                           // Wait for more than one clock cycle 
    
   
    
    load_enable = 1; 
    dest_select = 2'b11;                           // Destination register R3 
    Data_in = 32'h9ABCDEF0;                        // Arbitrary data to load into R3 
    #10;                                           // Wait for the data to load 
    load_enable = 0;                               // Disable loading 
    #10;                                           // Wait for more than one clock cycle 

 
    //check the output F if the addition of A_data and B is correct
    load_enable = 1;
    A_select = 2'b00;
    B_select = 2'b01;
    mb_select = 1; 
    constant_in = 32'h5E6F789A;
    #10;
    load_enable = 0;
    #10 
    
    load_enable = 1;
    A_select = 2'b01;
    B_select = 2'b10;
    mb_select = 1; 
    constant_in = 32'h5E6F789A;
    #10;
    load_enable = 0;
    #10 
    
    load_enable = 1;
    A_select = 2'b10;
    B_select = 2'b11;
    mb_select = 0; 
    constant_in = 32'h5E6F789A;
    #10;
    load_enable = 0;
    #10 
    
    load_enable = 1;
    A_select = 2'b11;
    B_select = 2'b00;
    mb_select = 0; 
    constant_in = 32'h5E6F789A;
    #10;
    load_enable = 0;
    #10
    
    // Check if the output D_data matches the function result when md_select is 0 
    md_select = 0;                                    // Select F for D_data 
    #20;                                              // Wait for MUX to update 

    // Check if the output D_data matches the Data_in when md_select is 1 
    md_select = 1; // Select Data_in for D_data 
    #50; // Wait for MUX to update 
	
    reset = 1;                                        //test reset function
    #10;

    reset = 0;                                        //release reset
    #10;


end
always #5 clk = ~clk;
 
endmodule
