module FSM( 
		input wire clk, reset, start,
		output reg [4:0] A,B,
		output reg op);

			
		reg [4:0] pstate, nstate;
                parameter [4:0] START = 5'b00000,
				ONE = 5'b00001,
				TWO = 5'b00010,
				THREE = 5'b00011,
				FINISH = 5'b00100;
 
		

 			always @(*) begin : NSOL    
			  	begin : NSL
					case(pstate)

						START : nstate = start ? ONE : START;
						
						ONE	: nstate = TWO;
					       
						TWO : nstate = THREE;
					     
						THREE : nstate = FINISH;
						
						FINISH : nstate = START;  

						default : nstate = 5'bx;

					endcase
                end

			      begin : OL
                    case(pstate)
                                                
					        START : begin
                                 A = 5'b00000;
                                 B = 5'b00000;
                                op = 1'bx;
							end

                            ONE : begin
                                A = 5'b01011;
                                B = 5'b01011;
                                op = 1'b0;
							end
					     
					        TWO : begin
                                A = 5'b00010;
                                B = 5'b00011;
                                op = 1'b1;
							end
                        
                            THREE  : begin
                                A = 5'b01100;
                                B = 5'b00010;
                                op = 1'b1;
							end

                            FINISH  : begin
                                A = 5'b00000;
								B = 5'b00000;
								op = 1'bx;

							end
					     

				        default : begin
								A = 5'bx;
                                B = 5'bx;
								op = 1'bx;
						       end
				    endcase
			  end
			end

		    always @(posedge clk or negedge reset) begin : PSR 
				begin
				    if(~reset) begin
					 pstate <= START;
				    end
				    
			        else begin
					 pstate <= nstate;
                    end
                end	
			end	
					   			
endmodule					    
									 
								     	
