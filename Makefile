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
	-I $(INCLUDE_MINILIBX_SELECT_DIR)	\
	-I $(INCLUDE_MLX_DIR)
LDFLAGS =						\
	-L $(MINILIBX_SELECT_DIR)
LDLIBS =											\
	-lmlx -lm -framework OpenGL -framework AppKit

#####***** DIR *****#####

ROOTDIR = $(abspath $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
SRC_01_DIR = $(ROOTDIR)/src_01
OBJ_DIR = $(ROOTDIR)/obj
INCLUDE_DIR = $(ROOTDIR)/include
INCLUDE_MLX_DIR = $(INCLUDE_MINILIBX_SELECT_DIR)
## MODULES ##

MINILIBX_DIR = $(ROOTDIR)/modules/minilibx

ifneq ($(filter m1, $(MAKECMDGOALS)), )
MINILIBX_SELECT = $(MINILIBX_MMS)
MINILIBX_SELECT_DIR = $(MINILIBX_MMS_DIR)
INCLUDE_MINILIBX_SELECT_DIR = $(INCLUDE_MINILIBX_MMS_DIR)
MINILIBX_SELECT_CLEAN = clean_minilibx_mms
else
MINILIBX_SELECT = $(MINILIBX_MACOS)
MINILIBX_SELECT_DIR = $(MINILIBX_MACOS_DIR)
INCLUDE_MINILIBX_SELECT_DIR = $(INCLUDE_MINILIBX_MACOS_DIR)
MINILIBX_SELECT_CLEAN = clean_minilibx_macos
endif

MINILIBX_MACOS = $(MINILIBX_MACOS_DIR)/libmlx.a
MINILIBX_MACOS_DIR = $(MINILIBX_DIR)/minilibx_macos
INCLUDE_MINILIBX_MACOS_DIR = $(MINILIBX_MACOS_DIR)

MINILIBX_MMS = $(MINILIBX_MMS_DIR)/libmlx.dylib
MINILIBX_MMS_DIR = $(MINILIBX_DIR)/minilibx_mms_20191025_beta
INCLUDE_MINILIBX_MMS_DIR = $(MINILIBX_MMS_DIR)

#####***** SRC *****#####

SRC_01 =	main.c

SRC_01_C = $(addprefix $(SRC_01_DIR)/, $(SRC_01))


OBJS =	$(SRC_01_C:$(SRC_01_DIR)/%.c=$(OBJ_DIR)/%.o)

OBJS_CLEAN = $(OBJS)

#####***** working *****#####

all : $(OBJ_DIR) $(TARGET)

$(TARGET) : $(OBJS) $(MINILIBX_SELECT)
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
	
## MODULES ##
$(MINILIBX_MACOS):
	echo "$(FG_MAGENTA)module $(FG_LYELLOW)minilibx_macos$(NO_COLOR) -> $(FG_LCYAN)$(MINILIBX_MACOS)$(NO_COLOR)$(BG_MAKE1)"
	$(MAKE) -C $(MINILIBX_MACOS_DIR)
	@echo "$(NO_COLOR)"

$(MINILIBX_MMS):
	echo "$(FG_MAGENTA)module $(FG_LYELLOW)minilibx_mms$(NO_COLOR) -> $(FG_LCYAN)$(MINILIBX_MMS)$(NO_COLOR)$(BG_MAKE1)"
	$(MAKE) -C $(MINILIBX_MMS_DIR)
	cp $(MINILIBX_MMS) $(ROOTDIR)/
	@echo "$(NO_COLOR)"

#####***** clean *****#####

## MODULES ##
clean_minilibx_macos :
	@echo "clean $(FG_MAGENTA)module $(FG_LYELLOW)$(notdir $(MINILIBX_SELECT))$(NO_COLOR)$(BG_MAKE1)"
	$(MAKE) -C $(MINILIBX_SELECT_DIR) clean 
	@echo "$(NO_COLOR)"

clean_minilibx_mms :
	@echo "clean $(FG_MAGENTA)module $(FG_LYELLOW)$(notdir $(MINILIBX_SELECT))$(NO_COLOR)$(BG_MAKE1)"
	rm -f $(ROOTDIR)/$(notdir $(MINILIBX_MMS))
	$(MAKE) -C $(MINILIBX_MMS_DIR) clean 
	@echo "$(NO_COLOR)"

clean : $(MINILIBX_SELECT_CLEAN)
	rm -f $(OBJS_CLEAN)

fclean : OBJS_CLEAN+=$(TARGET)
fclean : clean

re : fclean all

.PHONY: all re clean fclean clean_minilibx_macos cleanminilibx_mms m1





#####***** COLOR *****#####
BG_RED     = \033[41m
BG_GREEN   = \033[42m
BG_YELLOW  = \033[43m
BG_BLUE    = \033[44m
BG_MAGENTA = \033[45m
BG_CYAN    = \033[46m
BG_LGREY   = \033[47m
BG_DGREY   = \033[100m
BG_LRED    = \033[101m
BG_LGREEN  = \033[102m
BG_LYELLOW = \033[103m
BG_LBLUE   = \033[104m
BG_LMAGENTA= \033[105m
BG_LCYAN   = \033[106m
BG_WHITE   = \033[107m
BG_MAKE1   = \033[48;5;236m
BG_MAKE2   = \033[48;5;238m
BG_MAKE3   = \033[48;5;240m

FG_BLACK   = \033[30m
FG_RED     = \033[31m
FG_GREEN   = \033[32m
FG_YELLOW  = \033[33m
FG_BLUE    = \033[34m
FG_MAGENTA = \033[35m
FG_CYAN    = \033[36m
FG_LGREY   = \033[37m
FG_DGREY   = \033[90m
FG_LRED    = \033[91m
FG_LGREEN  = \033[92m
FG_LYELLOW = \033[93m
FG_LBLUE   = \033[94m
FG_LMAGENTA= \033[95m
FG_LCYAN   = \033[96m
FG_WHITE   = \033[97m
 
CL_BOLD   = \033[1m
CL_DIM    = \033[2m
CL_UDLINE = \033[4m
CL_BLINK  = \033[5m
CL_INVERT = \033[7m
CL_HIDDEN = \033[8m
 
NO_COLOR = \033[0m
