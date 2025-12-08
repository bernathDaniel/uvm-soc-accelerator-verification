# Comprehensive UVM Verification Ecosystem for SoC Accelerator Validation

This repository contains the capstone project developed at the  
**Alexander Kofkin Faculty of Engineering, Bar-Ilan University**  
**Nano-Electronics Department – EnICS Labs**  

It provides a **complete and scalable UVM-based verification environment** for SoC accelerator validation,
featuring a unified testbench architecture, dual-agent support, and integration-ready RAL files.

## Technical Overview

![UVM Verification Environment Architecture](docs/architecture_overview.png)
*Complete UVM verification ecosystem showing agents, environment hierarchy, and signal flow*

This Verification environment validates a hardware accelerator with dual memory interfaces: up to 8× single-port SRAMs (up to 1024×256b each) verified by the MEM agent, and a 32×32-bit general-purpose register file for control/status communication verified by the GPP agent.

### Architecture Highlights

- **Dual-agent verification architecture:** MEM agent handles memory transaction validation (XMEM interface), GPP agent manages control/status register communication, enabling independent verification of data path and control flow.

- **Configurable memory agent:** Dual-mode operation via UVM factory overrides - sequence-driven mode (driver+sequencer+sequences) for directed testing vs. reactive mode (service driver + sandbox memory) for responsive DUT-initiated transactions.

- **Memory sandbox:** Byte-level granularity with per-byte randomization (configurable ranges, signed values) and flexible initialization policies (random, file-based, uninitialized) per memory. Integrated write dump debugging with configurable limits enables targeted debug without testbench modifications.

- **Centralized configuration control:** Top Test Class provides unified control point for testbench behavior - agent mode selection (factory overrides), functional mode switching (MATMUL/CALCOPY), memory initialization policies (global and per-memory), coverage parameters, and sequence selection - enabling test customization without modifying component code.

- **RTL register integration framework:** Complete UVM RAL files and APB transaction protocol prepared for integration with physical memory RTL modules (register files, control logic), enabling register-level verification when hardware implementations become available.

### Key Features

- **Event-based transaction model:** Transactions decouple component responsibilities - monitors/drivers focus on protocol-specific behavior while transaction classes handle signal mapping, printing, and data management through virtual method hooks (do_print, do_copy, do_compare and more).

## Documentation

For detailed implementation architecture, see [`docs/UVM_Technical_Implementation.pdf`](docs/UVM_Technical_Implementation.pdf) (Chapter 4 from project documentation), which covers:
- Multi-layer abstraction framework
- Memory agent dual-mode architecture
- Key method implementations and design patterns
- Debug infrastructure and validation approach

## Author
- **Daniel Bernath**

**Academic Supervisor:** Prof. Adam Teman  
**Instructor:** Eliyahu Levi  
