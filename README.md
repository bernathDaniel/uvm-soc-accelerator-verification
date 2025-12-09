# Comprehensive UVM Verification Ecosystem for SoC Accelerator Validation

This repository contains the capstone project developed at the  
**Alexander Kofkin Faculty of Engineering, Bar-Ilan University**  
**Nanoelectronics Department – EnICS Labs**  

## Technical Overview

This verification environment validates a hardware accelerator with dual memory interfaces: up to 8× single-port SRAMs (up to 1024×256b each) verified by the MEM agent, and a 32×32-bit general-purpose register file for control/status communication verified by the GPP agent.

Built for maximum flexibility and minimal component code complexity, the architecture is aimed at rapid integration of diverse accelerator designs with minimal modification overhead of the ecosystem.


![UVM Verification Environment Architecture](docs/architecture_overview.png)
*Complete UVM verification ecosystem showing agents, environment hierarchy, and signal flow*

### Architecture Highlights

- **Dual-agent verification architecture:** MEM agent handles memory transaction validation (XMEM interface), GPP agent manages control/status register communication, enabling independent verification of data path and control flow.

- **Configurable memory agent:** Dual-mode operation via UVM factory overrides - sequence-driven mode (driver+sequencer+sequences) for directed testing vs. reactive mode (service driver + sandbox memory) for responsive DUT-initiated transactions.

- **Memory sandbox:** Byte-level granularity with per-byte randomization (configurable ranges, signed values) and flexible initialization policies (random, file-based, uninitialized) per memory. Integrated write dump debugging with configurable limits enables targeted debug without testbench modifications.

- **Centralized configuration control:** Top Test Class provides unified control point for testbench behavior - agent mode selection (factory overrides), functional mode switching (MATMUL/CALCOPY), memory initialization policies (global and per-memory), coverage parameters, and sequence selection, enabling test customization without modifying component code.

- **RTL register integration framework:** Complete UVM RAL files and a simplified APB transaction protocol (cmd, cmd_valid, addr, data) prepared for integration with physical memory RTL modules (register files, control logic), enabling register-level verification when hardware implementations become available.

### Key Features

- **Event-based transaction model:** Simplifies component design by encapsulating event-specific signal handling (`rd`, `wr`, reset events) in transaction classes. Verification components use simple method calls without managing signal selection or event-specific logic directly.

- **Custom debug infrastructure:** Replaces verbose UVM messaging with simplified, consistently-formatted output. Reduces cognitive load during extended debug sessions, enabling faster visual scanning and rapid iteration on bug resolution.

- **Shared utility infrastructure:** Centralized package defining semantic type abstractions (memory selection, functional modes, policy enumerations) and compile-time parameters across 35 verification files. Eliminates magic numbers, enables configuration changes without code modification, and ensures consistent naming conventions testbench-wide.

- **Self-documenting architecture:** Enables rapid code scanning and comprehension with minimal cognitive load. Method-based interfaces, semantic type abstractions, event-based modes (`set_e_mode("rd")`), and consistent patterns reduce comment requirements by ~75% - code clarity through explicit naming and predictable structure rather than explanatory documentation.

## Documentation

For detailed implementation architecture, see [`docs/UVM_Technical_Implementation.pdf`](docs/UVM_Technical_Implementation.pdf) (Chapter 4 from project documentation), which covers:
- Multi-layer abstraction framework
- Memory agent dual-mode architecture
- Key method implementations and design patterns
- Debug infrastructure and validation approach

## Author

**Daniel Bernath**

B.Sc. Electrical Engineering (Nanoelectronics & Signal Processing)
Bar-Ilan University, 2025

**Academic Supervisor:** Prof. Adam Teman  
**Instructor:** Eliyahu Levi  

[LinkedIn](https://linkedin.com/in/bernathdaniel) | [GitHub](https://github.com/bernathDaniel)
