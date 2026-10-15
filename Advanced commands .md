# Advanced Linux Commands

A growing reference for advanced command-line utilities used to inspect files, identify data, convert encodings, and work with terminal output.

## 1. `xxd` - Hexadecimal Dump

`xxd` displays a file or standard input as hexadecimal bytes alongside readable ASCII text.

| Command | Description |
| :--- | :--- |
| `xxd [file]` | Display a hexadecimal dump with offsets and ASCII text |
| `xxd -l 64 [file]` | Display only the first 64 bytes |
| `xxd -s 128 [file]` | Start reading at byte offset 128 |
| `xxd -c 16 [file]` | Display 16 bytes per line |
| `xxd -g 1 [file]` | Group output into single-byte values |
| `xxd -p [file]` | Display plain hexadecimal characters without offsets |
| `xxd -r dump.hex output.bin` | Convert a hexadecimal dump back into binary data |
| `printf 'Hello' \| xxd` | Create a hexadecimal dump from standard input |

### Examples

```bash
# Inspect the beginning of a binary file
xxd -l 64 file.bin

# Display one continuous hexadecimal string
xxd -p file.bin

# Convert plain hexadecimal text back to binary
xxd -r -p input.hex output.bin
```

## 2. `ts` - Add Timestamps to Output

`ts` is provided by the `moreutils` package. It prefixes each input line with a timestamp, which is useful when recording logs or monitoring commands.

| Command | Description |
| :--- | :--- |
| `command \| ts` | Add the current date and time to each output line |
| `command \| ts '%Y-%m-%d %H:%M:%S'` | Use a custom timestamp format |
| `command \| ts -s` | Show elapsed time since the first input line |
| `command \| ts -i` | Show the time interval since the previous input line |

### Examples

```bash
# Timestamp command output
ping -c 3 localhost | ts

# Record elapsed time for a command's output
./script.sh | ts -s
```

> Install `ts` on Debian or Ubuntu with `sudo apt install moreutils`.

## 3. `file` - Identify File Types

`file` determines a file's type by inspecting its contents instead of relying only on its filename extension.

| Command | Description |
| :--- | :--- |
| `file [file]` | Display the detected file type |
| `file -b [file]` | Display the type without the filename |
| `file -i [file]` | Display the MIME type and character encoding |
| `file -L [file]` | Inspect the target of a symbolic link |
| `file *` | Identify every matching file in the current directory |

### Examples

```bash
# Identify a binary, text, or image file
file data.bin

# Check MIME type and character encoding
file -i README.md

# Identify all files in the current directory
file *
```

## 4. `base64` - Encode and Decode Data

`base64` converts binary data to printable Base64 text and decodes Base64 text back into its original bytes.

| Command | Description |
| :--- | :--- |
| `base64 [file]` | Encode a file as Base64 |
| `base64 -w 0 [file]` | Encode without line wrapping on GNU systems |
| `base64 -d [file]` | Decode Base64 input |
| `printf 'text' \| base64` | Encode text from standard input |
| `printf 'encoded' \| base64 -d` | Decode Base64 from standard input |
| `base64 input.bin > output.txt` | Save encoded output to a file |
| `base64 -d input.txt > output.bin` | Save decoded binary data to a file |

### Examples

```bash
# Encode text
printf 'Hello Linux' | base64

# Decode Base64 text
printf 'SGVsbG8gTGludXg=' | base64 -d

# Encode and decode a file
base64 input.bin > encoded.txt
base64 -d encoded.txt > restored.bin
```

## 5. `gzip` and `gunzip` - Compress and Decompress Files

`gzip` reduces the size of a file and normally creates a file ending in `.gz`.
`gunzip` restores the original file from the `.gz` file.

### Memory Tip

Think of the command names as a pair:

- `gzip` puts a file into a smaller zipped form.
- `gunzip` removes the gzip compression.
- The `g` means GNU/gzip, and `un` means undo.

| Command | Description |
| :--- | :--- |
| `gzip [file]` | Compress a file and replace it with `[file].gz` |
| `gunzip [file].gz` | Decompress a `.gz` file and restore the original file |
| `gzip -k [file]` | Compress the file while keeping the original |
| `gunzip -k [file].gz` | Decompress the file while keeping the `.gz` file |
| `gzip -d [file].gz` | Decompress a `.gz` file; equivalent to `gunzip` |
| `gzip -l [file].gz` | Show compression details and the original size |
| `gzip -1 [file]` | Compress faster with a lower compression level |
| `gzip -9 [file]` | Try stronger compression, usually more slowly |
| `gzip -c [file] > [file].gz` | Write compressed data to standard output without removing the original |

### Examples

```bash
# Compress report.txt into report.txt.gz
gzip report.txt

# Restore report.txt from report.txt.gz
gunzip report.txt.gz

# Compress while keeping report.txt
gzip -k report.txt

# Inspect a compressed file without extracting it
gzip -l report.txt.gz
```

> `gzip` compresses individual files. For a directory, create an archive with `tar` first, such as `tar -czf project.tar.gz project/`.

## 6. `bzip2` and `bunzip2` - Stronger File Compression

`bzip2` compresses files into the `.bz2` format. `bunzip2` restores files from that format.
It often produces smaller files than `gzip`, but it can take more time and memory.

### Memory Tip

The names follow the same pattern as gzip:

- `bzip2` compresses a file into `.bz2` format.
- `bunzip2` means undo bzip2 compression.
- The number `2` identifies the bzip2 compression format.

| Command | Description |
| :--- | :--- |
| `bzip2 [file]` | Compress a file and replace it with `[file].bz2` |
| `bunzip2 [file].bz2` | Decompress a `.bz2` file and restore the original file |
| `bzip2 -k [file]` | Compress the file while keeping the original |
| `bunzip2 -k [file].bz2` | Decompress the file while keeping the `.bz2` file |
| `bzip2 -d [file].bz2` | Decompress a `.bz2` file; equivalent to `bunzip2` |
| `bzip2 -t [file].bz2` | Test the compressed file for errors without extracting it |
| `bzip2 -1 [file]` | Use less memory and compress faster |
| `bzip2 -9 [file]` | Use more memory for stronger compression |
| `bzip2 -c [file] > [file].bz2` | Write compressed data to standard output without removing the original |

### Examples

```bash
# Compress report.txt into report.txt.bz2
bzip2 report.txt

# Restore report.txt from report.txt.bz2
bunzip2 report.txt.bz2

# Compress while keeping report.txt
bzip2 -k report.txt

# Check whether the compressed file is valid
bzip2 -t report.txt.bz2
```

> `bzip2` also compresses individual files. For directories, combine it with `tar`, such as `tar -cjf project.tar.bz2 project/`.

## 7. `nc` / `netcat` - Test Network Connections

`nc` is the short command name for **netcat**. It can open TCP or UDP connections, listen on a port, and send or receive simple data.

### Where to Use It

- Check whether a server port is reachable.
- Test a local or remote TCP/UDP service.
- Listen temporarily on a port during troubleshooting.
- Transfer small, non-sensitive files on a trusted network.

> `nc` is not encrypted. Do not use it to send passwords, private keys, or confidential data.

### Common Command Pattern

```bash
nc [flags] host port
```

| Command | Description |
| :--- | :--- |
| `nc host port` | Connect to a host and port |
| `nc -v host port` | Show connection details (`-v` means verbose) |
| `nc -zv host port` | Check a port without sending data (`-z` means scan mode) |
| `nc -w 3 host port` | Stop waiting after 3 seconds (`-w` sets timeout) |
| `nc -u host port` | Use UDP instead of TCP (`-u` means UDP) |
| `nc -n host port` | Skip DNS name resolution (`-n` means numeric addresses only) |
| `nc -l 8080` | Listen for a connection on port 8080 (`-l` means listen) |
| `nc -k -l 8080` | Keep listening after a connection closes (`-k` keeps the listener open) |

### Examples

```bash
# Check whether SSH is reachable on the server
nc -zv 203.0.113.25 22

# Test a web server on port 80 with a short timeout
nc -v -w 3 example.com 80

# Listen on one terminal
nc -l 8080

# Connect from another terminal and type a message
nc 127.0.0.1 8080
```

### Simple File Transfer on a Trusted Network

Receiver:

```bash
nc -l 9000 > received.txt
```

Sender:

```bash
nc 203.0.113.25 9000 < small-file.txt
```

Short explanation:

- `-l` - listen for an incoming connection
- `>` - save received data to a file
- `<` - send a file as standard input
- `9000` - the temporary listening port

> File transfer with `nc` has no encryption or authentication. Use `scp` or `sftp` for real systems and sensitive files.

## Notes

- Use `file` before processing an unfamiliar file to identify its format.
- Use `xxd` when byte-level inspection is required.
- Use `base64` for text-safe transport, not for encryption.
- Use `gzip` when you want fast, common compression and `.gz` files.
- Use `bzip2` when smaller output matters more than compression speed.
- Use `tar` with `gzip` or `bzip2` when compressing directories.
- Use `nc`/`netcat` for quick network tests, not secure communication.
- Add future advanced commands as new numbered sections in this file.
