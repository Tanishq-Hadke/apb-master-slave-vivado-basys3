`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2026 03:53:42 PM
// Design Name: 
// Module Name: apb_master
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


module apb_master(
    input wire PCLK,
    input wire PRESETn,

    output reg PSEL,
    output reg PENABLE,
    output reg PWRITE,
    output reg [7:0] PADDR,
    output reg [31:0] PWDATA,

    input wire [31:0] PRDATA,
    input wire PREADY
);

reg [2:0] state;
reg [31:0] data_cnt;

localparam IDLE   = 3'd0,
           SETUP  = 3'd1,
           ACCESS = 3'd2;

always @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn) begin
        state   <= IDLE;
        PSEL    <= 0;
        PENABLE <= 0;
        PWRITE  <= 0;
        PADDR   <= 0;
        PWDATA  <= 0;
        data_cnt<= 0;
    end
    else begin
        case(state)

        IDLE: begin
            PSEL   <= 1;
            PWRITE <= 1;
            PADDR  <= 8'h00;
            PWDATA <= data_cnt;
            state  <= SETUP;
        end

        SETUP: begin
            PENABLE <= 1;
            state   <= ACCESS;
        end

        ACCESS: begin
            if (PREADY) begin
                PENABLE <= 0;
                PSEL    <= 0;
                data_cnt<= data_cnt + 1;
                state   <= IDLE;
            end
        end

        endcase
    end
end

endmodule
