module ALU_8bit_tb;
    reg [7:0] A, B;
    reg [2:0] Opcode;
    reg Carry_in;
    wire [7:0] Result;
    wire Carry_out, Zero, Negative;
    
    ALU_8bit uut(
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Carry_in(Carry_in),
        .Result(Result),
        .Carry_out(Carry_out),
        .Zero(Zero),
        .Negative(Negative)
    );
    
    initial begin
        // Initialize VCD file dumping
        $dumpfile("ALU_8bit_tb.vcd");
        $dumpvars(0, ALU_8bit_tb);
        
        // Test ADD
        A = 8'h55; B = 8'hAA; Opcode = 3'b000; Carry_in = 0;
        #10 $display("ADD: %h + %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test ADD with carry
        A = 8'hFF; B = 8'h01; Opcode = 3'b000; Carry_in = 0;
        #10 $display("ADD: %h + %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test SUB
        A = 8'h55; B = 8'h10; Opcode = 3'b001; Carry_in = 0;
        #10 $display("SUB: %h - %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test AND
        A = 8'h55; B = 8'h0F; Opcode = 3'b010; Carry_in = 0;
        #10 $display("AND: %h & %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test OR
        A = 8'h55; B = 8'h0F; Opcode = 3'b011; Carry_in = 0;
        #10 $display("OR: %h | %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test XOR
        A = 8'h55; B = 8'hFF; Opcode = 3'b100; Carry_in = 0;
        #10 $display("XOR: %h ^ %h = %h, Carry=%b, Zero=%b, Negative=%b", A, B, Result, Carry_out, Zero, Negative);
        
        // Test NOT
        A = 8'h55; Opcode = 3'b101; Carry_in = 0;
        #10 $display("NOT: ~%h = %h, Carry=%b, Zero=%b, Negative=%b", A, Result, Carry_out, Zero, Negative);
        
        // Test SHL (Shift Left)
        A = 8'b10101010; Opcode = 3'b110; Carry_in = 0;
        #10 $display("SHL: %b << 1 = %b, Carry=%b, Zero=%b, Negative=%b", A, Result, Carry_out, Zero, Negative);
        
        // Test SHR (Shift Right)
        A = 8'b10101010; Opcode = 3'b111; Carry_in = 0;
        #10 $display("SHR: %b >> 1 = %b, Carry=%b, Zero=%b, Negative=%b", A, Result, Carry_out, Zero, Negative);
        
        $finish;
    end
endmodule
