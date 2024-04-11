`timescale 1ns / 1ps

module sportstopwatch(
input clk,
input [3:0]btn,
input [1:0] control,
output reg[6:0] a0,a1,a2,a3,a4,a5,
//output newclk,
output reg red, green,
output led
//output dp4, dp2
);
wire newclk;
frequencydivider divider(.rst(2'b00 ),.clk(clk),.newclk(newclk));
reg [3:0] reg_d0, reg_d1, reg_d2, reg_d3, reg_d4, reg_d5;
//assign dp4 = 0;
//assign dp2 = 0;
initial begin
a0 = 7'b1000000;
a1 = 7'b1000000;
a2 = 7'b1000000;
a3 = 7'b1000000;
a4 = 7'b1000000;
a5 = 7'b1000000;
end
assign led = newclk;
reg check = 0;
reg count = 0;
always @(posedge newclk) begin
red = 0;
green = 0;

if (control == 2'b00 )
   begin
   if(btn[0] == 1 && count < 1)
        begin 
           check = 1;
           count = count+ 1;
           if(reg_d2 == 9)
               reg_d2 = 0;
           else
               reg_d2 = reg_d2 + 1;
        end
     
     else if(btn[1] == 1 && count < 1)
       begin 
           check = 1;
           count = count +1;
           if(reg_d3 == 5)
               reg_d3 = 0;
           else
               reg_d3 = reg_d3 + 1;
       end
    
    else if(btn[2] == 1 && count < 1)
        begin 
           check = 1;
           count = count + 1;
           if(reg_d4 == 9)
               reg_d4 = 0;
           else
               reg_d4 = reg_d4 + 1;
       end
    
    else if(btn[3] == 1 && count < 1)
       begin 
           check = 1;
           count =count+ 1;
           if(reg_d5 == 5)
               reg_d5 = 0;
           else
               reg_d5 = reg_d5 + 1;
       end
    else if(check == 1 && btn == 4'b0000)
    begin
    count = 0;
    end  
   else if(check == 0)
    begin
    reg_d0 = 0;
    reg_d1 = 0;
    reg_d2 = 0;
    reg_d3 = 0;
    reg_d4 = 0;
    reg_d5 = 0;
    a0 = 7'b1000000;
    a1 = 7'b1000000;
    a2 = 7'b1000000;
    a3 = 7'b1000000;
    a4 = 7'b1000000;
    a5 = 7'b1000000;

    end
  case(reg_d2)
                4'd0 : a2 = 7'b1000000;
                4'd1 : a2 = 7'b1111001;
                4'd2 : a2 = 7'b0100100;
                4'd3 : a2 = 7'b0110000;
                4'd4 : a2 = 7'b0011001;
                4'd5 : a2 = 7'b0010010;
                4'd6 : a2 = 7'b0000010;
                4'd7 : a2 = 7'b1111000;
                4'd8 : a2 = 7'b0000000;
                4'd9 : a2 = 7'b0010000;
                default : a2 = 7'b0111111; 
             endcase
             
              case(reg_d3)
                 4'd0 : a3 = 7'b1000000;
                 4'd1 : a3 = 7'b1111001;
                 4'd2 : a3 = 7'b0100100;
                 4'd3 : a3 = 7'b0110000;
                 4'd4 : a3 = 7'b0011001;
                 4'd5 : a3 = 7'b0010010;
                 4'd6 : a3 = 7'b0000010;
                 4'd7 : a3 = 7'b1111000;
                 4'd8 : a3 = 7'b0000000;
                 4'd9 : a3 = 7'b0010000;
                 default : a3 = 7'b0111111; 
              endcase
              
               case(reg_d4)
                  4'd0 : a4 = 7'b1000000;
                  4'd1 : a4 = 7'b1111001;
                  4'd2 : a4 = 7'b0100100;
                  4'd3 : a4 = 7'b0110000;
                  4'd4 : a4 = 7'b0011001;
                  4'd5 : a4 = 7'b0010010;
                  4'd6 : a4 = 7'b0000010;
                  4'd7 : a4 = 7'b1111000;
                  4'd8 : a4 = 7'b0000000;
                  4'd9 : a4 = 7'b0010000;
                  default : a4 = 7'b0111111; 
               endcase 
               
                case(reg_d5)
                   4'd0 : a5 = 7'b1000000;
                   4'd1 : a5 = 7'b1111001;
                   4'd2 : a5 = 7'b0100100;
                   4'd3 : a5 = 7'b0110000;
                   4'd4 : a5 = 7'b0011001;
                   4'd5 : a5 = 7'b0010010;
                   4'd6 : a5 = 7'b0000010;
                   4'd7 : a5 = 7'b1111000;
                   4'd8 : a5 = 7'b0000000;
                   4'd9 : a5 = 7'b0010000;
                   default : a5 = 7'b0111111; 
                endcase  
    
 end
 
 else if(control == 2'b11)
 begin
 reg_d0 = reg_d0;
 reg_d1 = reg_d1;
 reg_d2 = reg_d2;
 reg_d3 = reg_d3;
 reg_d4 = reg_d4;
 reg_d5 = reg_d5;
 end
 
else if ( control == 2'b10) 
begin
    if(reg_d0 == 9)
        begin
        reg_d0 = 0;
            if(reg_d1 == 9)
                begin
                reg_d1 = 0;
                    if(reg_d2 == 9)
                        begin
                        reg_d2 = 0;
                            if(reg_d3 == 5)
                                begin
                                reg_d3 = 0;
                                if(reg_d4 == 9)
                                    begin
                                    reg_d4 = 0;
                                        if(reg_d5 == 5)
                                            begin
                                            reg_d5 = 0;
                                            end
                                        else
                                            begin
                                            reg_d5 = reg_d5 + 1;
                                            end
                                        case(reg_d0)
                                                    4'd0 : a5 = 7'b1000000;
                                                    4'd1 : a5 = 7'b1111001;
                                                    4'd2 : a5 = 7'b0100100;
                                                    4'd3 : a5 = 7'b0110000;
                                                    4'd4 : a5 = 7'b0011001;
                                                    4'd5 : a5 = 7'b0010010;
                                                    4'd6 : a5 = 7'b0000010;
                                                    4'd7 : a5 = 7'b1111000;
                                                    4'd8 : a5 = 7'b0000000;
                                                    4'd9 : a5 = 7'b0010000;
                                                    default : a5 = 7'b0111111; 
                                         endcase
                                    end
                                else
                                    begin
                                    reg_d4 = reg_d4 + 1;
                                    end
                                case(reg_d4)
                                            4'd0 : a4 = 7'b1000000;
                                            4'd1 : a4 = 7'b1111001;
                                            4'd2 : a4 = 7'b0100100;
                                            4'd3 : a4 = 7'b0110000;
                                            4'd4 : a4 = 7'b0011001;
                                            4'd5 : a4 = 7'b0010010;
                                            4'd6 : a4 = 7'b0000010;
                                            4'd7 : a4 = 7'b1111000;
                                            4'd8 : a4 = 7'b0000000;
                                            4'd9 : a4 = 7'b0010000;
                                            default : a4 = 7'b0111111; 
                                  endcase
                                end
                            else
                                begin
                                reg_d3 = reg_d3 + 1;
                                end
                            case(reg_d3)
                                        4'd0 : a3 = 7'b1000000;
                                        4'd1 : a3 = 7'b1111001;
                                        4'd2 : a3 = 7'b0100100;
                                        4'd3 : a3 = 7'b0110000;
                                        4'd4 : a3 = 7'b0011001;
                                        4'd5 : a3 = 7'b0010010;
                                        4'd6 : a3 = 7'b0000010;
                                        4'd7 : a3 = 7'b1111000;
                                        4'd8 : a3 = 7'b0000000;
                                        4'd9 : a3 = 7'b0010000;
                                        default : a3 = 7'b0111111; 
                            endcase    
   
                        end
                    else
                        begin
                        reg_d2 = reg_d2 + 1; 
                        end
                    case(reg_d2)
                                4'd0 : a2 = 7'b1000000;
                                4'd1 : a2 = 7'b1111001;
                                4'd2 : a2 = 7'b0100100;
                                4'd3 : a2 = 7'b0110000;
                                4'd4 : a2 = 7'b0011001;
                                4'd5 : a2 = 7'b0010010;
                                4'd6 : a2 = 7'b0000010;
                                4'd7 : a2 = 7'b1111000;
                                4'd8 : a2 = 7'b0000000;
4'd9 : a2 = 7'b0010000;
                                default : a2 = 7'b0111111; 
                      endcase  
                    
                end
            else
                begin
                reg_d1 = reg_d1 + 1;
                end 
            case(reg_d1)
                        4'd0 : a1 = 7'b1000000;
                        4'd1 : a1 = 7'b1111001;
                        4'd2 : a1 = 7'b0100100;
                        4'd3 : a1 = 7'b0110000;
                        4'd4 : a1 = 7'b0011001;
                        4'd5 : a1 = 7'b0010010;
                        4'd6 : a1 = 7'b0000010;
                        4'd7 : a1 = 7'b1111000;
                        4'd8 : a1 = 7'b0000000;
                        4'd9 : a1 = 7'b0010000;
                        default : a1 = 7'b0111111; 
             endcase
        end
    else
        begin
        reg_d0 = reg_d0 + 1; 
        end
    case(reg_d0)
        4'd0 : a0 = 7'b1000000;
        4'd1 : a0 = 7'b1111001;
        4'd2 : a0 = 7'b0100100;
        4'd3 : a0 = 7'b0110000;
        4'd4 : a0 = 7'b0011001;
        4'd5 : a0 = 7'b0010010;
        4'd6 : a0 = 7'b0000010;
        4'd7 : a0 = 7'b1111000;
        4'd8 : a0 = 7'b0000000;
        4'd9 : a0 = 7'b0010000;
        default : a0 = 7'b0111111; 
     endcase
     check = 0;
end


else if ( control == 2'b01) 
begin
    if(reg_d0 == 0)
        begin
        reg_d0 = 9;
            if(reg_d1 == 0)
                begin
                reg_d1 = 9;
                    if(reg_d2 == 0)
                        begin
                        reg_d2 = 9;
                            if(reg_d3 == 0)
                                begin
                                reg_d3 = 5;
                                if(reg_d4 == 0)
                                    begin
                                    reg_d4 = 9;
                                        if(reg_d5 == 0)
                                            begin
                                            reg_d0 = 0;
                                            reg_d1 = 0;
                                            reg_d2 = 0;
                                            reg_d3 = 0;
                                            reg_d4 = 0;
                                            reg_d5 = 0;
                                            red = 1;
                                            green = 1;
                                            end
                                        else
                                            begin
                                            reg_d5 = reg_d5 - 1;
                                            end
                                        case(reg_d0)
                                                    4'd0 : a5 = 7'b1000000;
                                                    4'd1 : a5 = 7'b1111001;
                                                    4'd2 : a5 = 7'b0100100;
                                                    4'd3 : a5 = 7'b0110000;     
                                                    4'd4 : a5 = 7'b0011001;
                                                    4'd5 : a5 = 7'b0010010;
                                                    4'd6 : a5 = 7'b0000010;
                                                    4'd7 : a5 = 7'b1111000;
                                                    4'd8 : a5 = 7'b0000000;
                                                    4'd9 : a5 = 7'b0010000;
                                                    default : a5 = 7'b0111111; 
                                         endcase
                                    end
                                else
                                    begin
                                    reg_d4 = reg_d4 - 1;
                                    end
                                case(reg_d4)
                                            4'd0 : a4 = 7'b1000000;
                                            4'd1 : a4 = 7'b1111001;
                                            4'd2 : a4 = 7'b0100100;
                                            4'd3 : a4 = 7'b0110000;
                                            4'd4 : a4 = 7'b0011001;
                                            4'd5 : a4 = 7'b0010010;
                                            4'd6 : a4 = 7'b0000010;
                                            4'd7 : a4 = 7'b1111000;
                                            4'd8 : a4 = 7'b0000000;
                                            4'd9 : a4 = 7'b0010000;
                                            default : a4 = 7'b0111111; 
                                  endcase
                                end
                            else
                                begin
                                reg_d3 = reg_d3 - 1;
                                end
                            case(reg_d3)
                                        4'd0 : a3 = 7'b1000000;
                                        4'd1 : a3 = 7'b1111001;
                                        4'd2 : a3 = 7'b0100100;
                                        4'd3 : a3 = 7'b0110000;
                                        4'd4 : a3 = 7'b0011001;
                                        4'd5 : a3 = 7'b0010010;
                                        4'd6 : a3 = 7'b0000010;
                                        4'd7 : a3 = 7'b1111000;
                                        4'd8 : a3 = 7'b0000000;
                                        4'd9 : a3 = 7'b0010000;
                                        default : a3 = 7'b0111111; 
                            endcase    
   
                        end
                    else
                        begin
                        reg_d2 = reg_d2 - 1; 
                        end
                    case(reg_d2)
                                4'd0 : a2 = 7'b1000000;
                                4'd1 : a2 = 7'b1111001;
                                4'd2 : a2 = 7'b0100100;
                                4'd3 : a2 = 7'b0110000;
                                4'd4 : a2 = 7'b0011001;
                                4'd5 : a2 = 7'b0010010;
                                4'd6 : a2 = 7'b0000010;
                                4'd7 : a2 = 7'b1111000;
                                4'd8 : a2 = 7'b0000000;
                                4'd9 : a2 = 7'b0010000;
                                default : a2 = 7'b0111111; 
                      endcase  
                    
                end
            else
                begin
                reg_d1 = reg_d1 - 1;
                end 
            case(reg_d1)
                        4'd0 : a1 = 7'b1000000;
                        4'd1 : a1 = 7'b1111001;
                        4'd2 : a1 = 7'b0100100;
                        4'd3 : a1 = 7'b0110000;
                        4'd4 : a1 = 7'b0011001;
                        4'd5 : a1 = 7'b0010010;
                        4'd6 : a1 = 7'b0000010;
                        4'd7 : a1 = 7'b1111000;
                        4'd8 : a1 = 7'b0000000;
                        4'd9 : a1 = 7'b0010000;
                        default : a1 = 7'b0111111; 
             endcase
        end
    else
        begin
        reg_d0 = reg_d0 - 1; 
        end
    case(reg_d0)
        4'd0 : a0 = 7'b1000000;
        4'd1 : a0 = 7'b1111001;
        4'd2 : a0 = 7'b0100100;
        4'd3 : a0 = 7'b0110000;
        4'd4 : a0 = 7'b0011001;
        4'd5 : a0 = 7'b0010010;
        4'd6 : a0 = 7'b0000010;
        4'd7 : a0 = 7'b1111000;
        4'd8 : a0 = 7'b0000000;
        4'd9 : a0 = 7'b0010000;
        default : a0 = 7'b0111111; 
     endcase
     check = 0;
end
end

endmodule