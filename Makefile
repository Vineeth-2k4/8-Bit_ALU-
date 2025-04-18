# Tools
IVERILOG := iverilog
VVP := vvp
GTKWAVE := gtkwave

# Targets
.PHONY: simulate view clean

simulate:
	@mkdir -p simulations/waveforms
	$(IVERILOG) -o simulations/alu_tb src/ALU_8bit.v src/ALU_8bit_tb.v
	$(VVP) simulations/alu_tb
	@mv ALU_8bit_tb.vcd simulations/waveforms/

view:
	$(GTKWAVE) simulations/waveforms/ALU_8bit_tb.vcd

clean:
	rm -rf simulations/alu_tb simulations/waveforms/*.vcd
