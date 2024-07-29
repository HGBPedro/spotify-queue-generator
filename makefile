#Makefile to run all scripts at once

queue: authorize
	zsh queue.zsh

authorize: authenticate
	zsh authorize.zsh

authenticate:
	zsh authenticate.zsh

clear_envs:
	yes | cp .env.example .env