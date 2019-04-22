##
## EPITECH PROJECT, 2018
## 206neutrinos
## File description:
## Makefile for 206neutrinos.
##

MAIN	=	main.js

NAME	=	206neutrinos

all: $(NAME)

$(NAME):
	echo '#!/bin/node' > $(NAME)
	cat $(MAIN) >> $(NAME)
	chmod +x $(NAME)

build:
	./compile.sh

fclean:
	$(RM) $(NAME)

re: fclean all

.PHONY: all $(NAME) build fclean re
