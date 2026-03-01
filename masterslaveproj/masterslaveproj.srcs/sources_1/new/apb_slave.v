`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2026 03:54:04 PM
// Design Name: 
// Module Name: apb_slave
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module apb_slave(
    input  wire        PCLK,
    input  wire        PRESETn,
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,
    input  wire [7:0]  PADDR,
    input  wire [31:0] PWDATA,
    output reg  [31:0] PRDATA,
    output wire        PREADY,
    output wire        PSLVERR,
    output wire [15:0] led_out
);

reg [31:0] mem [0:3];   // 4 registers

assign PREADY  = 1'b1;  // Always ready
assign PSLVERR = 1'b0;

assign led_out = mem[0][15:0];

always @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn) begin
        mem[0] <= 0;
        mem[1] <= 0;
        mem[2] <= 0;
        mem[3] <= 0;
    end
    else begin
        if (PSEL && PENABLE) begin
            if (PWRITE)
                mem[PADDR[3:2]] <= PWDATA;
            else
                PRDATA <= mem[PADDR[3:2]];
        end
    end
end

endmodule
