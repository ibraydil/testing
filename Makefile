# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pokuzmic <pokuzmic@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/07 12:00:00 by dibrayev          #+#    #+#              #
#    Updated: 2026/10/08 11:17:06 by pokuzmic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= push_swap

CC			= cc
CFLAGS		= -Wall -Wextra -Werror

LIBFT_DIR	= libft
LIBFT		= $(LIBFT_DIR)/libft.a

INCLUDES	= -I. -I$(LIBFT_DIR)

MAIN		= main.c

SRCS		= $(MAIN) \
			  operations/swap.c \
			  operations/push.c \
			  operations/rotate.c \
			  operations/reverse_rotate.c \
			  flags/options.c \
			  flags/benchmark.c \
			  parsing/parsing_utils.c \
			  parsing/parsing_args.c \
			  parsing/parsing_split.c \
			  parsing/stack_init.c \
			  algorithms/disorder.c \
			  algorithms/simple_algorithm.c \
			  algorithms/medium_utils.c \
			  algorithms/medium_sort.c \
			  algorithms/medium_push_back.c \
			  algorithms/complex.c \
			  algorithms/adaptive.c

OBJS		= $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -L$(LIBFT_DIR) -lft -o $(NAME)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

%.o: %.c push_swap.h
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
