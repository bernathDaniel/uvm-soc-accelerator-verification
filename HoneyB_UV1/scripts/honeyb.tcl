#============================================================================
# Project     | HoneyB_UV1
# File Name   | honeyb.tcl
#============================================================================
# Syntax      | tclsh honeyb.tcl <SIM_MODE>
#============================================================================
# Description | Simulation Top-Level Controller
  #           | -------------------------------------------------------------
  #           | This is the control center simulations, logging etc.
  #           | Executes xrun automatically for a defined mode
  #           | -------------------------------------------------------------
  #           | Simulation Modes
  #           | -------------------------------------------------------------
  #           | 1. standard (Default)
  #           | 2. dse      (Design Space Exploration,
  #           |              Currently just Regression on diff. mem cfgs)
  #           | -------------------------------------------------------------
#============================================================================


# Load general procedures
source ../scripts/procedures.tcl

set SIM_MODE "standard"

# Parse command-line argument if provided
if {$argc > 0} {
  set SIM_MODE [lindex $argv 0]
}

# standard path
set xrun_options "../scripts/xrun_options.rtl"

enics_init_honeyb $SIM_MODE

# Mode handling
switch $SIM_MODE {
  "standard" {
    exec csh -c "source /tools/common/cshrc && xrun -f $xrun_options -log ../workspace/xrun.log" >@stdout 2>@stderr
    # exec xrun -f $xrun_options -log ../workspace/xrun.log >@stdout 2>@stderr
  }
  "dse" {
    source ../scripts/honeyb_dse.tcl
  }
  default {
    puts "ERROR: Unknown mode '$SIM_MODE'"
    puts "Available modes: standard, regression"
    exit 1
  }
}