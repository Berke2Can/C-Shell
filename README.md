# C-Shell: A Unix-like Shell in C

A minimal Unix-like shell written in C to explore **process management, system calls, and operating system concepts**.

---

## Objectives

This project aims to provide hands-on experience with:

- Process creation (`fork`)
- Program execution (`exec`)
- Process synchronization (`wait`)
- Error handling in system calls
- Shell command parsing
- Understanding how real Unix shells work internally

The long-term goal is to evolve this project into a **systems experimentation environment** for advanced OS concepts.


---


## Current Features

- Interactive command prompt
- Built-in commands:
  - `cd`
  - `pwd`
  - `exit`
- External command execution using:
  - `fork()`
  - `execvp()`
  - `wait()`
- Proper error handling:
  - Fork failure
  - Exec failure


--- 

## To run the program:

### Compile

From the project root directory: 

```bash
make 
```

Run

```bash
./bin/mysh
```

Clean compiled files 

```bash
make clean
```
