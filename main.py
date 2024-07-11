"""Main script. Should not be imported by other modules."""

import sys
import os
from time import sleep
from rich.console import Console
from rich.table import Table
# import questionary

if len(sys.argv) <= 1 or sys.argv[1] != "install":
    raise RuntimeError("This script should not be run with a bare `python main.py` command. \
                        Use the start.sh script instead.")


console = Console()

print("")
console.rule("Polychara Guide - Python Script", style="bold green")
print("")
console.print("Hello, welcome to the installation script for the project!", style="bold")
console.print("This script will guide you through the installation process.", style="bold")
console.print("First, we will check every component needed:", style="bold")

requirementsTable = Table(show_header=False, show_lines=True)
requirementsTable.add_column("Name", style="bold")
requirementsTable.add_row("Python")
requirementsTable.add_row("Docker Engine")
requirementsTable.add_row("Docker Compose")
console.print(requirementsTable)

with console.status("Checking Docker Engine...", spinner="dots"):
    if os.system("docker --version >/dev/null") == 0:
        console.log("Docker Engine is installed.", style="bold green")
    else:
        console.log(":warning: Docker Engine is not installed.\n\
                    Please check that Docker Engine and Docker Compose are installed by following the official guide: \n\
                    https://docs.docker.com/engine/install/",
                    style="bold red")
        exit(1)

with console.status("Checking Docker Compose...", spinner="dots"):
    if os.system("docker compose >/dev/null") == 0:
        console.log("Docker Compose is installed.", style="bold green")
    else:
        console.log(":warning: Docker Compose is not installed.\n\
                    Please follow the official guide: https://docs.docker.com/compose/install/",
                    style="bold red")
        exit(1)

console.log("All requirements are met.", style="bold green")
