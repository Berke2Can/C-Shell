#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdbool.h>


int main() {
	char line[257];

	char *args[64];

	// When shell is initiated
	while(1) {
		printf("mysh> ");
		fflush(stdout);
		
		// Handle input
		if (fgets(line, sizeof(line), stdin) == NULL) {
			break;
		}

		line[strcspn(line, "\n")] = '\0';
	
		// Parse the input string as tokens
		int i = 0;
		char  *token = strtok(line, " ");
		
		while (token != NULL) {
			args[i++] = token;
			token = strtok(NULL, " ");
		}
		args[i] = NULL;
		
		// No input
		if (args[0] == NULL) continue;
	
		// exit functionality
		if (strcmp(args[0], "exit") == 0) {
			exit(EXIT_SUCCESS);
		}
		
		// cd functionality
		else if (strcmp(args[0], "cd") == 0) {
			if (args[1] == NULL) {
				fprintf(stderr, "cd: missing argument\n");
			} else {
				chdir(args[1]);
			}
		}
		
		// pwd functionality 
		else if (strcmp(args[0], "pwd") == 0) {
			char cwd[256];
			if (getcwd(cwd, sizeof(cwd)) != NULL) {
			printf("%s\n", cwd);
		} else {
			perror("getcwd");
		}
		}

		else {
			pid_t pid = fork();
			if (pid < 0) {
				fprintf(stderr, "Failed to create process\n");
				continue;
			}
			else if (pid == 0) {
				execvp(args[0], args);
				fprintf(stderr, "Failed to execute command\n");
				exit(1);
		} else {
			wait(NULL);
		}
		}
	}
	return 0;
}






