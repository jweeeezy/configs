
# logs <message> in red to stdin
def err(message):
    print(f'\033[91mError: {message}\033[0m')

# logs <message> in green to stdin
def success(message):
    print(f'\033[92m{message}\033[0m')

# logs <message> in yellow to stdin
def msg(message):
    print(f'\033[93m{message}\033[0m')
