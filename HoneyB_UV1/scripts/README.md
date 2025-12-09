# Simulation Scripts

Automation and configuration scripts for Xcelium-based UVM simulation workflow.

## Core Configuration

### `xrun_options.rtl`
Main Xcelium run configuration file containing:
- UVM/SystemVerilog compilation flags and library setup
- Debug access controls and timescale configuration (1ns/1ps)
- Randomization seed control for memory model
- Functional coverage enablement (`-coverage u` - required for UVM coverage)
- Warning suppressions (Xcelium-specific noise reduction)
- SimVision GUI toggle (`-gui` flag)
- Source file list references (DUT and testbench)

**Usage:** Aliased to `run_honey` command. Advanced invocation available via Tcl automation scripts (see below).
