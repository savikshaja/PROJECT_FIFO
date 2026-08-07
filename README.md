# Synchronous FIFO (Verilog)

A parameterized single-clock synchronous FIFO implemented in Verilog. The design supports independent read and write operations, simultaneous read/write transactions, and includes overflow and underflow protection using internal control logic.

---

## Features

- Parameterized `DATA_WIDTH` and `ADDR_WIDTH`
- Single clock synchronous FIFO
- Dual-port RAM based implementation
- Supports simultaneous read and write
- Overflow and underflow protection
- Full and Empty status flags
- Fully verified using **SystemVerilog + UVM**
- Functional coverage and SystemVerilog Assertions (SVA)

---

## Directory Structure

```
├── rtl/
│   ├── syn_fifo.v
│   └── ram_dp_ar_aw.v
│
├── tb/
│   ├── interface
│   ├── transaction
│   ├── driver
│   ├── monitors
│   ├── scoreboard
│   ├── subscriber
│   ├── environment
│   ├── sequences
│   ├── tests
│   └── top.sv
│
└── README.md
```

---

# Parameters

| Parameter | Default | Description |
|----------|---------|-------------|
| DATA_WIDTH | 8 | Width of data bus |
| ADDR_WIDTH | 8 | Width of address pointer |
| RAM_DEPTH | 1 << ADDR_WIDTH | FIFO depth |

---

# Interface

| Signal | Direction | Description |
|---------|-----------|-------------|
| clk | Input | System clock |
| rst | Input | Active-high asynchronous reset |
| wr_cs | Input | Write chip select |
| wr_en | Input | Write enable |
| rd_cs | Input | Read chip select |
| rd_en | Input | Read enable |
| data_in | Input | Input data |
| data_out | Output | Output data |
| full | Output | FIFO Full flag |
| empty | Output | FIFO Empty flag |

---

# FIFO Operation

## Write Operation

A write occurs when:

```
wr_cs = 1
wr_en = 1
full = 0
```

- Data is written into the FIFO.
- Write pointer increments.
- FIFO occupancy count increases.

---

## Read Operation

A read occurs when:

```
rd_cs = 1
rd_en = 1
empty = 0
```

- Data is read from the FIFO.
- Read pointer increments.
- FIFO occupancy count decreases.

---

## Simultaneous Read & Write

If both read and write are valid in the same clock cycle:

- Read pointer increments
- Write pointer increments
- FIFO count remains unchanged

---

# Status Flags

| Flag | Condition |
|------|-----------|
| Empty | status_count == 0 |
| Full | status_count == RAM_DEPTH |

---

# Verification

The FIFO was verified using **UVM**.

Verification components include:

- Sequence Item
- Driver
- Input Monitor
- Output Monitor
- Scoreboard
- Subscriber
- Environment
- Random Sequences
- Directed Test Cases

---

# Functional Coverage

Coverage includes:

### Input Covergroups

- WR_CS
- WR_EN
- RD_CS
- RD_EN
- DATA_IN
- Cross Coverage

### Output Covergroups

- FULL
- EMPTY
- DATA_OUT

---

# Assertions (SVA)

Assertions implemented include:

- Full and Empty should never be high simultaneously
- Write Enable must be asserted only with Write Chip Select
- No Read when FIFO is Empty
- FIFO remains stable during Idle

---

# Test Cases

Implemented test cases include:

- Reset Test
- Write Only
- Read Only
- Simultaneous Read & Write
- FIFO Full
- FIFO Empty
- Overflow
- Underflow
- Idle Cycle
- Random Transactions

---

# Tools Used

- Verilog
- SystemVerilog
- UVM 1.1d
- QuestaSim
- Git

---

# Known Limitation

The provided RTL contains a known design bug in the RAM implementation, which was identified during verification. The bug was detected through scoreboard mismatches and verified using directed test cases and assertions.

---

# Author

**J. A. Saviksha**

Electronics and Communication Engineering

SystemVerilog | UVM | Functional Verification
