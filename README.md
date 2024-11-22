##################################################################################################

Server Stats Script

##################################################################################################

Purpose: This is a simple and efficient script for basic performance analysis of Linux servers.

## Description ##

`server-stats.sh` is a Bash script designed to provide essential server performance statistics, including:
- Total CPU, memory, and disk usage.
- Top 5 processes consuming the most CPU and memory.
- Optional additional information such as OS version, uptime, logged-in users, and load average.

This script is ideal for system administrators and DevOps teams needing a quick resource overview of Linux servers.

## Requirements ##

- **Operating System**  : Linux.
- **Shell**             : Bash.
- **Dependencies**      : The following commands must be available on the system:
  - `uptime`
  - `free`
  - `df`
  - `ps`
  - `grep` (optional for failed login attempts)

## How to Use ##

1. Clone the repository:
   ```bash
   git clone https://github.com/deavelarthiago/server-performance-stats
   cd server-stats

2. Make the script executable:
   chmod +x server-stats.sh

3. Run the script:
   ./server-stats.sh

## Contribution ##

Fork the project.

Create a branch for your feature:
   git checkout -b `my-feature`

Make your changes and commit:
   git commit -m "Added feature X"

Push your changes:
   git push origin my-feature

Open a Pull Request.