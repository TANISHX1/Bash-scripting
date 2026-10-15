# SSH Principles

A short reference for securely connecting to remote systems with OpenSSH.

> **Key terminology:** You normally use the **client's private key** to connect. The matching **public key** must be installed on the server in the user's `~/.ssh/authorized_keys` file. Never copy or share a server's private host key.

## 1. How to Use SSH

### Basic Command

```bash
ssh username@server-address
```

Example:

```bash
ssh alice@192.0.2.10
```

The command means:

- `ssh` - start the Secure Shell client
- `alice` - the account to use on the remote system
- `192.0.2.10` - the remote system's IP address or hostname

### Required Configuration on the Server

Run these steps on the system that will accept the connection:

1. Install the OpenSSH server package.
2. Start and enable the SSH service.
3. Confirm that the service is listening on the configured port, usually `22`.
4. Allow the SSH port through the firewall.
5. Create or confirm the remote login user.
6. Configure `/etc/ssh/sshd_config` when changing authentication or port settings.
7. Restart or reload the SSH service after configuration changes.
8. Share the server hostname or IP address with the client.

Example commands on Debian or Ubuntu:

```bash
sudo apt update
sudo apt install openssh-server
sudo systemctl enable --now ssh
sudo systemctl status ssh
sudo ufw allow ssh
```

### Required Configuration on the Client

Run these steps on the system from which you will connect:

1. Install the OpenSSH client package.
2. Know the remote username and server address.
3. Confirm that the server's SSH port is reachable.
4. Use a private key or password accepted by the server.
5. Verify the server fingerprint during the first connection.
6. Keep private keys readable only by the owner.

Example commands on Debian or Ubuntu:

```bash
sudo apt update
sudo apt install openssh-client
ssh username@server-address
```

### What Happens During a Connection

1. The client contacts the server's SSH port.
2. The server presents its host key and the client verifies its fingerprint.
3. The client and server negotiate an encrypted session.
4. The server authenticates the requested user.
5. The server opens a remote shell after successful authentication.

### Using a Non-Default Port

```bash
ssh -p 2222 username@server-address
```

The server's SSH configuration and firewall must allow the same port.

## 2. Connecting with a Private Key

### Example Setup

Assume:

- Client: your laptop
- Server address: `203.0.113.25`
- Server username: `dev`
- SSH port: `22`
- Private key name: `~/.ssh/server_ed25519`

The private key stays on the client. Only the matching public key is copied to the server.

### Step 1: Create the Key Pair on the Client

```bash
ssh-keygen -t ed25519 -f ~/.ssh/server_ed25519 -C "dev@laptop"
```

Short flag explanation:

- `-t ed25519` - choose the Ed25519 key type
- `-f ~/.ssh/server_ed25519` - choose the key file name
- `-C "dev@laptop"` - add a readable label to the public key

This creates:

- `~/.ssh/server_ed25519` - private key; keep secret
- `~/.ssh/server_ed25519.pub` - public key; install on the server

### Step 2: Set Key Permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/server_ed25519
chmod 644 ~/.ssh/server_ed25519.pub
```

Short explanation:

- `chmod` - change file permissions
- `700` - only the owner can access the `.ssh` directory
- `600` - only the owner can read or modify the private key
- `644` - the public key can be read by others, but only the owner can modify it

### Step 3: Copy the Public Key to the Server

```bash
ssh-copy-id -i ~/.ssh/server_ed25519.pub dev@203.0.113.25
```

Short flag explanation:

- `ssh-copy-id` - add a public key to the server user's `authorized_keys`
- `-i` - select the public key file to copy
- `dev@203.0.113.25` - connect as user `dev` at the server address

The command may ask for the server user's password once. After the key is installed, future logins can use the private key.

### Step 4: Login with the Private Key

```bash
ssh -i ~/.ssh/server_ed25519 dev@203.0.113.25
```

Short flag explanation:

- `-i ~/.ssh/server_ed25519` - use this private key for authentication
- `dev@203.0.113.25` - log in as `dev` on the remote server

If the server uses port `2222` instead of the default port `22`:

```bash
ssh -i ~/.ssh/server_ed25519 -p 2222 dev@203.0.113.25
```

- `-p 2222` - connect to SSH port `2222`
- The server firewall and SSH configuration must allow the same port

### Complete Example in Short

```bash
# Create the key pair
ssh-keygen -t ed25519 -f ~/.ssh/server_ed25519 -C "dev@laptop"

# Install the public key on the server
ssh-copy-id -i ~/.ssh/server_ed25519.pub dev@203.0.113.25

# Login using the private key
ssh -i ~/.ssh/server_ed25519 dev@203.0.113.25
```

### Troubleshooting

Use verbose output when authentication fails:

```bash
ssh -v -i ~/.ssh/id_ed25519 alice@192.0.2.10
```

Common checks:

- Confirm the username is correct.
- Confirm the private key matches the public key installed on the server.
- Check permissions on `~/.ssh` and `authorized_keys`.
- Confirm the SSH service and firewall port are available.
- Review the server authentication log.
- Do not disable host-key checking as a routine fix.

## Future Sections

Additional SSH topics can be added here later, including:

- SSH configuration aliases in `~/.ssh/config`
- File transfer with `scp` and `sftp`
- Port forwarding and tunnels
- Agent forwarding
- Hardening `sshd_config`
- Server host-key management
