# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kyoulee <kyoulee@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/20 10:50:03 by kyoulee           #+#    #+#              #
#    Updated: 2022/09/13 08:36:37 by kyoulee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

TARGET = mlx_base

CC = cc
CXXFLAGS = $(NULL)
CFLAGS = -Wall -Werror -Wextra
DFLAGS = $(NULL) -g
IFLAGS =								\
	-I $(INCLUDE_DIR)					\
	-I $(INCLUDE_MINILIBX_SELECT_DIR)

LDFLAGS = $(NULL)
LDLIBS = $(NULL)

#####***** DIR *****#####

ROOTDIR = $(abspath $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
SRC_01_DIR = $(ROOTDIR)/src_01
OBJ_DIR = $(ROOTDIR)/obj
INCLUDE_DIR = $(ROOTDIR)/include

#####***** SRC *****#####

SRC_01 =	main.c

SRC_01_C = $(addprefix $(SRC_01_DIR)/, $(SRC_01))


OBJS =	$(SRC_01_C:$(SRC_01_DIR)/%.c=$(OBJ_DIR)/%.o)

OBJS_CLEAN = $(OBJS)

#####***** working *****#####

all : $(OBJ_DIR) $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(LDFLAGS) $(LDLIBS) $(OBJS) -o $(TARGET)
	@echo "$(FG_LMAGENTA)$(CC) $(FG_BLUE) $(CFLAGS)"
	@(for i in $(IFLAGS) $(LDFLAGS); do echo $$i; done)
	@echo "$(LDLIBS) $(FG_LCYAN)"
	@(for i in $(OBJS); do echo $$i; done)
	@echo "$(FG_BLUE)-o $(FG_LYELLOW)$(TARGET)$(NO_COLOR)"

$(OBJ_DIR) : 
	mkdir $@

$(OBJ_DIR)/%.o : $(SRC_01_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

debug : 
	$(CC) $(CFLAGS) $(IFLAGS) $(LDFLAGS) $(DFLAGS) $(LDLIBS) $(OBJS) -o debug

#####***** clean *****#####

clean :
	rm -f $(OBJS_CLEAN)

fclean : OBJS_CLEAN+=$(TARGET)
fclean : clean

re : fclean all

.PHONY: all re clean fclean

include Makefile_color.mk
include Makefile_mlx.mk