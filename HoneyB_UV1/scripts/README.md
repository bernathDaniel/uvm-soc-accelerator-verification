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

## Tcl Automation Scripts

### `procedures.tcl`
Centralized utility functions for simulation control and formatted logging.

**Key Procedures:**
- `enics_msg` - Formatted message output with importance levels (high/medium/low)
- `enics_init_honeyb` - Session initialization with timestamp and mode identification
- `enics_start_dse_sim` - Design space exploration simulation launcher with parameter logging

**Purpose:** Abstraction layer for automation scripts, similar to UVM utility package philosophy - provides semantic functions to simplify higher-level scripting.

### `honeyb.tcl`
Main automation control script with extensible mode framework.

**Modes:**
- **Simple Mode** - Single simulation run with parameters configured via utility package
- **DSE Mode** - Design Space Exploration for memory configuration sweeps (see `honeyb_dse.tcl`)

**Purpose:** Central entry point for simulation workflows, supporting both quick single runs and comprehensive regression testing.

### `honeyb_dse.tcl`
Automated regression framework for memory configuration exploration.

**Functionality:**
- Parameter sweep across `NUM_MEMS` (up to 8) and `LOG2_LINES_PER_MEM` (up to 10 = 1024 lines)
- Automated execution of multiple Xcelium simulations with DUT reconfiguration per parameter set
- Organized logging system with separate log files per configuration
- Progress tracking via `enics_msg` procedures

**Purpose:** Systematic exploration of memory configuration design space with automated regression testing. Enables comparison of different memory architectures through organized simulation runs.

**Usage:**
```tcl
# Configure parameter sweep in script:
set num_mems_list {2 4 8}
set log2_lines_list {8 9 10}

# Execute:
source ../scripts/honeyb_dse.tcl
```

Logs saved to `../workspace/dse_logs/` (created automatically).
