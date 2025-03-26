# Run From Time To Time

Command to repeat typed commands.

The `run-from-time` command in bash is useful for repeating typed commands. As a useful example, if you always want to enter the same command, instead of having to repeat the typing in the terminal, the program will repeat it for you. Remember that this program can execute both an existing command in your Linux operating system and any program developed by the author.

A very illustrative example for everyday use with the `run-from-time` command.
```
# Running any program made in Python. Remember that it can be any program or language.
./run-from-time.sh --command "python3 check-host.py -m http -t http://testphp.vulnweb.com" --temp=5 --count=10

# Running a Linux command already in the installation pattern.
./run-from-time.sh --command "ifconfig" --temp=5 --count=3
```

`--command` It executes any Linux command or any program, from any language and any technology.
`--temp` Execution interval time.
`--count` Sets the amount of execution the command will perform. If you don't enter the tag, the program will understand that it will be an infinite execution.

If you want to make it an official Linux command, follow the procedure below:
```
sudo cp run-from-time.sh /usr/bin/run-from-time
```
