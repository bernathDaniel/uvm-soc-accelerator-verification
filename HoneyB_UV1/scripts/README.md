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

## Tcl Automation Scripts

### `procedures.tcl`
Centralized utility functions for simulation control and formatted logging.

**Key Procedures:**
- `enics_msg` - Formatted message output with importance levels (high/medium/low)
- `enics_init_honeyb` - Session initialization with timestamp and mode identification
- `enics_start_dse_sim` - Design space exploration simulation launcher with parameter logging

**Purpose:** Abstraction layer for automation scripts, similar to UVM utility package philosophy - provides semantic functions to simplify higher-level scripting.

**Usage:** Sourced by automation scripts via `source ../scripts/procedures.tcl -quiet`

### `honeyb.tcl`
Main automation control script with extensible mode framework.

**Modes:**
- **Simple Mode** - Single simulation run with parameters configured via utility package
- **DSE Mode** - Design Space Exploration for memory configuration sweeps (see `honeyb_dse.tcl`)

**Purpose:** Central entry point for simulation workflows, supporting both quick single runs and comprehensive regression testing.

