```ruby
 _______  _______  ___      __   __  _______  __   __  _______  ______    _______ 
|       ||       ||   |    |  | |  ||       ||  | |  ||   _   ||    _ |  |   _   |
|    _  ||   _   ||   |    |  |_|  ||       ||  |_|  ||  |_|  ||   | ||  |  |_|  |
|   |_| ||  | |  ||   |    |       ||       ||       ||       ||   |_||_ |       |
|    ___||  |_|  ||   |___ |_     _||      _||       ||       ||    __  ||       |
|   |    |       ||       |  |   |  |     |_ |   _   ||   _   ||   |  | ||   _   |
|___|    |_______||_______|  |___|  |_______||__| |__||__| |__||___|  |_||__| |__|
```
*A script for easy Docker bootstrapping*

## What is Polychara?
Polychara is a [HackClub](https://hackclub.com/) project, made for Arcade during July 2024.  
This is a Python project that allows easy installing of multiple Docker services, to simplify self-hosting.  
It generates a Docker Compose file from a template, and parses it to combine everything into a single stack of applications.  
An app needs a database? When you will select the service, a prompt will appear to ask if you want to use a custom one.  
If not, the best database will be also selected, and random credentials will be generated for the app to use.

## Features
- Beautiful, using `rich` for console formatting and `questionary` (used by GitHub's CLI)
- Fast, thanks to Python and parallelization.
- Flexible, with its modules system. You can add services easily, but with a complete freedom in what you will do in your script.
- Secure, as Docker is.

# Installation
As this is a script, you only need it to generate your Docker Compose file.
1. Clone the repository
2. `cd` into it
3. Execute `./start.sh` (if this doesn't work, try to `chmod +x ./start.sh` first)
