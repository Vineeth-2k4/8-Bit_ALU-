module ALU_8bit(
    input [7:0] A,
    input [7:0] B,
    input [2:0] Opcode,
    input Carry_in,
    output reg [7:0] Result,
    output reg Carry_out,
    output Zero,
    output Negative
);
    
    // Temporary 9-bit register for arithmetic operations to capture carry
    reg [8:0] temp;
    
    // Zero flag (combinational)
    assign Zero = (Result == 8'b0);
    
    // Negative flag (combinational)
    assign Negative = Result[7];
    
    always @(*) begin
        case(Opcode)
            3'b000: begin // ADD
                temp = A + B + Carry_in;
                Result = temp[7:0];
                Carry_out = temp[8];
            end
            
            3'b001: begin // SUB
                temp = A - B;
                Result = temp[7:0];
                Carry_out = temp[8];
            end
            
            3'b010: begin // AND
                Result = A & B;
                Carry_out = 0;
            end
            
            3'b011: begin // OR
                Result = A | B;
                Carry_out = 0;
            end
            
            3'b100: begin // XOR
                Result = A ^ B;
                Carry_out = 0;
            end
            
            3'b101: begin // NOT
                Result = ~A;
                Carry_out = 0;
            end
            
            3'b110: begin // SHL (Logical Shift Left)
                {Carry_out, Result} = {A, 1'b0};
            end
            
            3'b111: begin // SHR (Logical Shift Right)
                {Result, Carry_out} = {1'b0, A};
            end
            
            default: begin
                Result = 8'b0;
                Carry_out = 0;
            end
        endcase
    end
endmodule
