from typing import List
from rich.console import Console
from rich.prompt import Prompt

import questionary


console = Console()

def stpr(text: str) -> None:
    console.print(f"[bold magenta]{text}[/bold magenta]")

def askuser(prompt: str, choices: List[str]):
    response = questionary.select