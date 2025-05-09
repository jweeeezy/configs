# Overview

## Table of Contents
1. [Setup](#setup)
2. [Tools](#tools)
   * [Scouting](#scouting)
   * [BruteForce](#bruteforcing)
   * [WordLists](#wordlists)
   * [ReverseShell](#reverseshell)

## Setup
1. Setup Kali Linux VM
2. Download OpenVPN Config file from TryHackMe
3. `sudo openvpn <name-of-file>`
4. `ping <target-machine-ip>`

## Tools

### Note Apps
* cherry tree
* vim/markdown

### Scouting
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

### BruteForcing
* hydra
    * can bruteforce urls with requests
* john
    * can identify hashes, brute force files (like shadow)
* ssh2john

### Wordlists
* /usr/share/wordlists
* /usr/share/seclists

### ReverseShell
* netcat
   ```sh
   nc -lnvp <listening_port>
   ```
