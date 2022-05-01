# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mkaruvan <mkaruvan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/12 14:40:14 by mkaruvan          #+#    #+#              #
#    Updated: 2022/05/01 14:37:53 by mkaruvan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client.o

SERVER = server.o

CLIENT_B = client_bonus.o

SERVER_B = server_bonus.o

SRC = client.c server.c

SRC_BONUS = client_bonus.c server_bonus.c

CLIENT_NAME = client

SERVER_NAME = server

CLIENT_NAME_B = client_bonus

SERVER_NAME_B = server_bonus

LIBFT_DIR = libft

FT_PRINTF = libftprintf.a

FT_PRINTF_DIR = libft/ft_printf

LIBFT = libft.a

GREEN = \033[1;32m
RED = \033[1;31m
YEL = \033[1;33m
WHT = \033[1;37m
EOC = \033[1;0m

CC = gcc

FLAGS = -Wall -Wextra -Werror

RM = rm -rf

OBJ = $(SRC:.c=.o)

OBJ_BONUS = $(SRC_BONUS:.c=.o)

all: $(LIBFT) $(CLIENT_NAME) $(SERVER_NAME)
		

bonus: $(LIBFT) $(CLIENT_NAME_B) $(SERVER_NAME_B)
		

$(CLIENT_NAME): $(OBJ)
	@echo "$(WHT)compiling minitalk...$(EOC)"
	$(CC) $(CFLAGS) $(CLIENT) -o $@ $(LIBFT_DIR)/$(LIBFT) $(FT_PRINTF_DIR)/$(FT_PRINTF)
	@echo "$(WHT)minitalk build completed...$(EOC)"
	
$(SERVER_NAME): $(OBJ)
	@echo "$(WHT)compiling minitalk...$(EOC)"
	$(CC) $(CFLAGS) $(SERVER) -o $@ $(LIBFT_DIR)/$(LIBFT) $(FT_PRINTF_DIR)/$(FT_PRINTF)
	@echo "$(WHT)minitalk build completed...$(EOC)"

$(CLIENT_NAME_B): $(OBJ_BONUS)
	@echo "$(WHT)compiling minitalk...$(EOC)"
	$(CC) $(CFLAGS) $(CLIENT_B) -o $@ $(LIBFT_DIR)/$(LIBFT) $(FT_PRINTF_DIR)/$(FT_PRINTF)
	@echo "$(WHT)minitalk build completed...$(EOC)"
	
$(SERVER_NAME_B): $(OBJ_BONUS)
	@echo "$(WHT)compiling minitalk...$(EOC)"
	$(CC) $(CFLAGS) $(SERVER_B) -o $@ $(LIBFT_DIR)/$(LIBFT) $(FT_PRINTF_DIR)/$(FT_PRINTF)
	@echo "$(WHT)minitalk build completed...$(EOC)"
	
$(LIBFT) : 
	@make -C $(LIBFT_DIR)
	@make -C $(FT_PRINTF_DIR)

clean:
	@echo "$(WHT)removing object files...$(EOC)"
	@make -C $(LIBFT_DIR) clean
	@make -C $(FT_PRINTF_DIR) clean
	@$(RM) server.o client.o
	@$(RM) server_bonus.o client_bonus.o

fclean:
	@echo "$(WHT)removing build files...$(EOC)"
	@make -C $(LIBFT_DIR) fclean
	@make -C $(FT_PRINTF_DIR) fclean
	@make -C ./ clean
	@$(RM) server client server_bonus client_bonus

re:
	@make fclean
	@make all

bonusre:
	@make fclean
	@make bonus

norm:
	@norminette -R CheckForbiddenSourceHeader *.c

.PHONY:	all bonus clean fclean re norm
