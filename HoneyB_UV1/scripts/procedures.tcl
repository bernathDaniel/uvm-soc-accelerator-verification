#============================================================================
# Project     | HoneyB_UV1
# File Name   | procedures.tcl
#============================================================================
# Syntax      | source ../scripts/procedures.tcl -quiet
#============================================================================
# Description | Simulation Procedures for handling simulations
  #           | -------------------------------------------------------------
  #           | enics_msg
  #           | -------------------------------------------------------------
  #           | This is a command for printing messages to the CLI and log
  #           | Importance high will print a bold message
  #           | Importance standard (default) prints an underlined message
  #           | Importance low will print a one line message
  #           | -------------------------------------------------------------
#============================================================================

proc enics_msg {msg {importance low}} {
  set enics_msg "ENICSINFO: $msg"
  set message_length [string length $enics_msg]
  
  if {$importance=="high"} {
    puts [string repeat "*" [expr 10+$message_length]]
    puts [string repeat "*" [expr 10+$message_length]]
    puts "**   $enics_msg   **" 
    puts [string repeat "*" [expr 10+$message_length]]
    puts [string repeat "*" [expr 10+$message_length]]
  } elseif {$importance=="medium"} {
    puts ""
    puts "$enics_msg"
    puts [string repeat "-" $message_length]
  } elseif {$importance=="low"} {
    puts "$enics_msg" 
  } else {
    puts "ENICSINFO: WARNING - Incorrect usage of proc enics_msg"
    puts "ENICSINFO: Correct usage:enics_msg <message> high|medium|low"
  }
}


proc enics_init_honeyb {mode} {
  set systemTime [clock seconds]
  set tz "Asia/Jerusalem"
  set formattedTime [clock format $systemTime -format %H:%M -timezone $tz]
  set formattedDate [clock format $systemTime -format %d/%m/%Y -timezone $tz]
  puts ""
  enics_msg "Initializing Session for HoneyB" high
  enics_msg "Current time is: $formattedDate $formattedTime"
  enics_msg "Session Mode: $mode"
  enics_msg "------------------------------------"
  puts ""
}


proc enics_start_dse_sim {sim_num total_sims num_mems log2_lines logfile} {
    enics_msg "Starting simulation { $sim_num / $total_sims }" high
    enics_msg "NUM_MEMS = $num_mems"
    enics_msg "LOG2_LINES_PER_MEM = $log2_lines"
    enics_msg "The log file is $logfile" medium
}
