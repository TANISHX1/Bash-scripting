# Bash-scripting
bash scripts of some simple problems 
# Linux Terminal Commands Cheat Sheet

## 1. Basic Terminal Commands
| Command | Description |
| :--- | :--- |
| `pwd` | Show current directory path |
| `ls` | List files in directory (Common flags: `-a` for hidden, `-l` for details, `-h` for human-readable) |
| `cd [dir]` | Change directory (`cd ..` to go back one level, `cd ~` for home) |
| `echo [text]` | Print text or variable value |
| `clear` | Clear terminal screen (Shortcut: `Ctrl + L`) |
| `exit` | Close the terminal session |
| `man [cmd]` | *Show manual/help page for a command |
| `history` | *View command history |
| `alias` | *Create a shortcut for a command |

## 2. File and Directory Operations
| Command | Description |
| :--- | :--- |
| `touch [file]` | Create an empty file or update timestamp |
| `mkdir [dir]` | Create a new directory |
| `rmdir [dir]` | Remove an empty directory |
| `rm [file]` | Delete a file |
| `rm -r [dir]` | Delete a directory and its contents (Recursive) |
| `cp [src] [dest]` | Copy file or directory (`-r` for recursive) |
| `mv [src] [dest]` | Move or rename file/directory |
| `cat [file]` | Display file content |
| `more [file]` | View file content one screen at a time (Older) |
| `less [file]` | View file content with scrolling/paging (Better than more) |
| `head [file]` | View first 10 lines of a file (`-n` to specify number) |
| `tail [file]` | View last 10 lines of a file (`-f` to follow updates in real-time) |
| `ln -s [target] [link]`| *Create a symbolic link (shortcut) |

## 3. File and Text Searching
| Command | Description |
| :--- | :--- |
| `find . -name "name"` | Search for files by name in current directory |
| `grep "text" [file]` | Search for text inside files (`-r` for recursive, `-i` for case insensitive) |
| `locate [file]` | Fast file searching (uses an indexed database) |
| `which [cmd]` | *Locate the executable path of a command |
| `sed` | *Stream editor for filtering and transforming text |
| `awk` | *Pattern scanning and processing language |

## 4. File Permissions and Ownership
| Command | Description |
| :--- | :--- |
| `chmod [mod] [file]` | Change file permissions (e.g., `chmod 755 file` or `chmod +x file`) |
| `chown [user] [file]` | Change file ownership |
| `ls -l` | View file permissions, owner, and details |
| `chgrp [group] [file]`| *Change group ownership |

## 5. Conditional Operators (Scripting)
### File Tests
| Operator | Description |
| :--- | :--- |
| `-e [file]` | File exists |
| `-f [file]` | Regular file exists |
| `-d [dir]` | Directory exists |
| `-r [file]` | File is readable |
| `-w [file]` | File is writable |
| `-x [file]` | File is executable |

### Numeric Comparisons
| Operator | Description |
| :--- | :--- |
| `-eq` | Equal to |
| `-ne` | Not equal to |
| `-gt` | Greater than |
| `-lt` | Less than |
| `-ge` | Greater than or equal to |
| `-le` | Less than or equal to |

### String Comparisons (Added*)
| Operator | Description |
| :--- | :--- |
| `=` / `==` | *Strings are equal |
| `!=` | *Strings are not equal |
| `-z [str]` | *String is empty (zero length) |
| `-n [str]` | *String is not empty |

## 6. System Info and Monitoring
| Command | Description |
| :--- | :--- |
| `top` | Real-time process monitor |
| `htop` | Enhanced process viewer (more user-friendly) |
| `ps` | View currently running processes (`ps aux` for all) |
| `df -h` | Disk usage (Human readable) |
| `du -h [path]` | Directory/file size (`-sh` for summary) |
| `free -h` | Memory (RAM) usage |
| `uptime` | Show how long system has been running |
| `uname -a` | System kernel and architecture information |
| `kill [pid]` | *Terminate a process by ID |
| `neofetch` | *Display system info with ASCII logo (requires install) |

## 7. Package Management
### Debian/Ubuntu (`apt`)
| Command | Description |
| :--- | :--- |
| `apt update` | Update list of available packages |
| `apt install [pkg]` | Install a package |
| `apt remove [pkg]` | Remove a package |

### RHEL/Fedora (`dnf` / `yum`)
| Command | Description |
| :--- | :--- |
| `dnf update` | Update installed packages |
| `dnf install [pkg]` | Install a package |
| `dnf remove [pkg]` | Remove a package |

## 8. User Management
| Command | Description |
| :--- | :--- |
| `whoami` | Display current logged-in username |
| `id` | Show user ID (UID), group ID (GID), and groups |
| `adduser [name]` | Add a new user (Interactive, preferred) |
| `useradd [name]` | Add a new user (Low level) |
| `passwd [user]` | Change user password |
| `su [user]` | Switch user |
| `sudo [cmd]` | Run command as superuser (root) |
| `usermod` | *Modify user account details |

## 9. Archives and Compression
| Command | Description |
| :--- | :--- |
| `tar -cvf [file.tar] [dir]` | Create a tar archive |
| `tar -xvf [file.tar]` | Extract a tar archive |
| `gzip / gunzip` | Compress/Decompress `.gz` files |
| `zip / unzip` | Work with `.zip` files |
| `tar -zcvf [file.tar.gz]` | *Create a compressed gzip tar archive |

## 10. Networking
| Command | Description |
| :--- | :--- |
| `ping [host]` | Check connectivity to a server |
| `ip a` | Show IP address (Modern) |
| `ifconfig` | Show IP address (Deprecated/Legacy) |
| `ss -tuln` | Show open ports (Modern) |
| `netstat -tuln` | Show open ports (Legacy) |
| `curl [url]` | Transfer data/download from a URL |
| `wget [url]` | Download file from web |
| `ssh [user@host]` | *Connect to a remote server securely |
| `scp [src] [dest]` | *Securely copy files between hosts |
| `dig [domain]` | *DNS lookup |

## 11. Scripting Basics
| Concept | Syntax/Example |
| :--- | :--- |
| **Interpreter** | `#!/bin/bash` (First line of script) |
| **Conditions** | `if [ condition ]; then ... elif ... else ... fi` |
| **Loops** | `for i in {1..5}; do ... done` <br> `while [ condition ]; do ... done` |
| **Input** | `read var_name` |
| **Parameters** | `$1`, `$2` (Arguments passed to script) |
| **Variables** | `NAME="Value"` (No spaces), Access with `$NAME` |
| **Functions** | `function_name () { commands; }` |
| **Exit Status** | `echo $?` (*0 means success, other numbers mean error) |

## 12. Useful Keyboard Shortcuts (Added*)
| Shortcut | Action |
| :--- | :--- |
| `Tab` | *Auto-complete file/folder names |
| `Ctrl + C` | *Kill/Stop current running command |
| `Ctrl + Z` | *Suspend current command (background it) |
| `Ctrl + R` | *Search command history |
| `Ctrl + A` / `Ctrl + E` | *Go to start / end of line |
| `Ctrl + U` | *Cut text from cursor to start of line |
