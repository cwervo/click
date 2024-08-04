# Makefile to run cam.tcl

# Default target
all: run

# Run the cam.tcl script
run:
	tclsh8.6 src/cam.tcl

# Clean target (optional, in case you need it later)
clean:
	# Add commands to clean up any generated files, if necessary

# Phony targets
.PHONY: all run clean
