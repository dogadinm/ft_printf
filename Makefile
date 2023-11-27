# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mdogadin <mdogadin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/25 12:14:44 by mdogadin          #+#    #+#              #
#    Updated: 2023/11/01 11:44:39 by mdogadin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
LIBFTNAME = libft.a
CC = cc
CFLAGS = -Wall -Werror -Wextra
LIBFTDIR = ./libft

SRCS = 	ft_printf.c \
		ft_putnbr.c \
		ft_putnbr_hexad.c \
		ft_putnbr_unsigned.c \
		ft_putptr.c \
		ft_putstr.c \

OBJS = $(SRCS:.c=.o)

all: $(NAME)

makelibft:
	make -C $(LIBFTDIR)
	cp $(LIBFTDIR)/$(LIBFTNAME) .
	mv $(LIBFTNAME) $(NAME)

$(NAME): makelibft $(OBJS)
	ar -r $(NAME) $(OBJS)

clean:
	rm -f $(OBJS)
	cd $(LIBFTDIR) && make clean
	
fclean: clean
	rm -f $(NAME)
	cd $(LIBFTDIR) && make fclean
	
re: fclean all

