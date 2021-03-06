`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:28 10/30/2013 
// Design Name: 
// Module Name:    FF_Buf_Interface 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FF_Buf_Interface(
    input clock,
    input reset,
    input clr_flag,	//Limpia
    input set_flag,	//Setea
    input [7:0] din,	//Datain
    output flag,
    output [7:0] dout	//Dataout
    );

//Declaracion de seales
reg [7:0] buf_reg,buf_next;
reg flag_reg,flag_next;

//Main
always @(posedge clock)
if(reset)
	begin
		buf_reg <= 0;
		flag_reg <= 1'b0;
	end
else
	begin
		buf_reg <= buf_next;
		flag_reg <= flag_next;
	end

//Siguiente estado
always @*
begin
	buf_next = buf_reg;
	flag_next = flag_reg;
	if(set_flag)
		begin
			buf_next = din;
			flag_next = 1'b1;
		end	
	else if(clr_flag)
		flag_next = 1'b0;
end

//Logica de salida
assign dout= buf_reg;
assign flag= flag_reg;

endmodule
