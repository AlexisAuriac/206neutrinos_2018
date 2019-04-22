##
## EPITECH PROJECT, 2018
## 206neutrinos
## File description:
## Makefile for 206neutrinos.
##

SRC		=	main.go

SRC		:=	$(addprefix src/, $(SRC))

NAME	=	206neutrinos

all: $(NAME)

$(NAME): $(SRC)
	go build -o $(NAME) $(SRC)

# launch_tests:
# 	go test ./src/

fclean:
	$(RM) $(NAME)

re: fclean all

.PHONY: all fclean re
