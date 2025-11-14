#============================================================================
# Project     | HoneyB_UV1
# File Name   | honeyb_dse.tcl
#============================================================================
# Purpose     | Design Space Exploration (DSE) - Memory Configuration Sweep
#----------------------------------------------------------------------------
# Description | Automated Regression Run for multiple memory
  #           | --------------------------------------------------
  #           | Useful for testing multiple scenarios.
  #           | The Script executes xrun automatically for all cases defined.
#----------------------------------------------------------------------------
# Notes       |
  #           | -------------------------------------------------------------
  #           | NUM_MEMS           - can be up to 8
  #           | LOG2_LINES_PER_MEM - can be up to 10 (=1024 addr lines)
#============================================================================

# Load general procedures
source ../scripts/procedures.tcl

#----------------------------------------------------------------------------
# Configuration Parameters
#----------------------------------------------------------------------------

# Memory configuration sweep values
set num_mems_list {2}
set log2_lines_list {8 10}

# Paths
set xrun_options "../scripts/xrun_options.rtl"
set dse_logs "../workspace/dse_logs"

# Create log directory if it doesn't exist
file mkdir $dse_logs

#----------------------------------------------------------------------------
# Main Regression Loop
#----------------------------------------------------------------------------

set total_configs [expr {[llength $num_mems_list] * [llength $log2_lines_list]}]
set config_num 0

# Declare the number of simulations we're running
enics_msg "Total configurations to run: $total_configs" medium

foreach num_mems $num_mems_list {
  foreach log2_lines $log2_lines_list {
    incr config_num
    
    set log_file "${dse_logs}/xrun_mem_${num_mems}_${log2_lines}.log"
    
    enics_start_dse_sim $config_num $total_configs \
                        $num_mems   \
                        $log2_lines \
                        $log_file        
    # Execute xrun with parameter overrides
    exec csh -c "source /tools/common/cshrc && xrun -f $xrun_options \
              -define NUM_MEMS=$num_mems \
              -define LOG2_LINES_PER_MEM=$log2_lines \
              -logfile $log_file" >@stdout 2>@stderr
  }
}

enics_msg "DSE Regression Complete!" high
enics_msg "Results saved in $dse_logs"