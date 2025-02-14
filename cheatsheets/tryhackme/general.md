# Overview

## TryHackMe Connection
1. download openvpn file
2. use command with openvpn file
3. ping target machine
4. youre good to go!

## Tools

### Writing Notes
* cherry tree

### Scouting (Ports, URL's)
* Metasploit
* nmap

    nmap <target ip address>

* gobuster

    gobuster dir -u <target_ip_address> -w <word_list>

### Brute Forcing
* hydra
    * can bruteforce urls with requests
* john
    * can identify hashes, brute force files (like shadow)
* ssh2john

### Word / String Lists (Kali Linux):
* /usr/share/wordlists
* /usr/share/seclists
