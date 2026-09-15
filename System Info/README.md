# System Information Script

A small Bash script that prints a clean, at-a-glance summary of the machine it runs on — hostname, OS, kernel, CPU usage, memory usage, disk usage, uptime, and IP address.

This project is part of my Bash learning journey. I built it to get comfortable with shell scripting, command substitution, and text processing with `awk`.

## What it does

Running `systeminfo.sh` produces a formatted report like this:

```
==================================
        System Information
==================================

Host        : my-machine
OS          : Linux
Kernel      : Linux
CPU Usage   : 3.2%
Memory Usage: 41.87%
Disk Usage  : 55%
Uptime      : 2 hours, 14 minutes
IP Address  : 192.168.1.10
```

## How to run it

```bash
./systeminfo.sh
```

If it isn't executable yet:

```bash
chmod +x systeminfo.sh
./systeminfo.sh
```

## Files

- **`systeminfo.sh`** — the main script that gathers and prints the system information.
- **`systeminfo.tmux`** — a helper script that spins up a tmux session with two panes: one running `vim` on the script (editor) and one as a sandbox for testing commands. This was my working setup while developing the script.

## How I built it

I wanted each piece of information to come from a standard Linux command, then be trimmed down to just the value I cared about. Here's how I approached each field:

- **Host** — `hostname`
- **OS / Kernel** — `uname` and `uname -s`
- **CPU Usage** — read the idle percentage from `top` and subtracted it from 100 using `awk` to get the actual usage.
- **Memory Usage** — took the used and total memory from `free -m` and calculated the percentage with `awk` (`$3/$2*100`).
- **Disk Usage** — pulled the usage percentage from `df -h`.
- **Uptime** — used `uptime -p` and stripped the leading `up ` prefix with `awk`.
- **IP Address** — `hostname -I`.

The biggest learning here was **command substitution** (`$(...)`) to capture command output into variables, and using **`awk`** to filter and reshape that output — picking specific fields, doing arithmetic, and formatting numbers.

For the neat, aligned output I used `printf` with a fixed-width format specifier (`%-12s`) so all the labels line up in a column.

## A note on the colors

The output is color-coded (cyan borders, green title, yellow labels) using ANSI escape codes. **The colors are the only part I used AI for** — I asked for help adding color to the output. Everything else in the script — the commands, the `awk` pipelines, the logic, and the formatting — I wrote myself as part of learning Bash.

## Development environment

While building this I used the included `systeminfo.tmux` script to set up my workspace:

```bash
./systeminfo.tmux
```

It opens a tmux session with the script in `vim` on the left and a command sandbox on the right, so I could edit and test commands side by side.
