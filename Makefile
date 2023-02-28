# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kyoulee <kyoulee@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/20 10:50:03 by kyoulee           #+#    #+#              #
#    Updated: 2023/02/28 19:22:06 by kyoulee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

TARGET = mlx_base

CC = cc
CXXFLAGS = $(NULL)
CFLAGS = -Wall -Werror -Wextra
DFLAGS = $(NULL) -g
IFLAGS =								\
	-I $(INCLUDE_DIR)					\
	-I $(INCLUDE_CONTROL_DIR)			\
	-I $(SRC_00_DIR)

LDFLAGS = $(NULL)
LDLIBS = $(NULL)

#####***** DIR *****#####

ROOTDIR = $(abspath $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
SRC_00_DIR = $(ROOTDIR)/src_00
SRC_01_DIR = $(ROOTDIR)/src_01
SRC_02_PARAM_DIR = $(ROOTDIR)/src_02_param
SRC_03_CAMERA_DIR = $(ROOTDIR)/src_03_camera
SRC_04_RENDER_DIR = $(ROOTDIR)/src_04_render
SRC_05_CONTROL_DIR = $(ROOTDIR)/src_05_control
SRC_MLX_KEYBOARD_DIR = $(SRC_05_CONTROL_DIR)/src_mlx_keyboard
SRC_MLX_MOUSE_DIR = $(SRC_05_CONTROL_DIR)/src_mlx_mouse
SRC_MLX_WIN_DIR = $(SRC_05_CONTROL_DIR)/src_mlx_win

SRC_TOOL_DIR = $(ROOTDIR)/src_tool
SRC_VECTOR_DIR = $(ROOTDIR)/src_vector
SRC_MATRIX_DIR = $(ROOTDIR)/src_matrix
SRC_QUATERNION_DIR = $(ROOTDIR)/src_quaternion

OBJ_DIR = $(ROOTDIR)/obj
INCLUDE_DIR = $(ROOTDIR)/include
INCLUDE_CONTROL_DIR = $(ROOTDIR)/include/control
#####***** SRC *****#####

SRC_00 =	ft_oct_tree.c	\
			ft_queue.c		\
			test.c

SRC_00_C = $(addprefix $(SRC_00_DIR)/, $(SRC_00))

SRC_01 =	main.c

SRC_01_C = $(addprefix $(SRC_01_DIR)/, $(SRC_01))

SRC_02_PARAM =	ft_param.c

SRC_02_PARAM_C = $(addprefix $(SRC_02_PARAM_DIR)/, $(SRC_02_PARAM))

SRC_03_CAMERA =	ft_camera.c

SRC_03_CAMERA_C = $(addprefix $(SRC_03_CAMERA_DIR)/, $(SRC_03_CAMERA))

SRC_04_RENDER =	ft_render.c	\
				ft_scaline.c

SRC_04_RENDER_C = $(addprefix $(SRC_04_RENDER_DIR)/, $(SRC_04_RENDER))

SRC_05_CONTROL =	ft_control.c

SRC_05_CONTROL_C = $(addprefix $(SRC_05_CONTROL_DIR)/, $(SRC_05_CONTROL))



SRC_TOOL =					\
				ft_memcpy.c			\
				ft_bzero.c			\
				ft_error.c			\
				ft_strlen.c			\
				ft_zeromalloc.c

SRC_TOOL_C = $(addprefix $(SRC_TOOL_DIR)/, $(SRC_TOOL))

SRC_VECTOR =						\
				ft_vector_2.c			\
				ft_vector_2_operator.c	\
				ft_vector_3.c			\
				ft_vector_3_operator.c	\
				ft_vector_to.c

SRC_VECTOR_C = $(addprefix $(SRC_VECTOR_DIR)/, $(SRC_VECTOR))

SRC_MATRIX =						\
				ft_matrix_2.c			\
				ft_matrix_2_mult.c		\
				ft_matrix_3.c			\
				ft_matrix_3_mult.c		\
				ft_matrix_3_inverse.c	\
				ft_matrix_4.c			\
				ft_matrix_4_rotation.c	\
				ft_matrix_4_mult.c		\
				ft_matrix_4_inverse.c	\
				ft_matirx_to.c

SRC_MATRIX_C = $(addprefix $(SRC_MATRIX_DIR)/, $(SRC_MATRIX))


SRC_QUATERNION =	ft_quaternion.c				\
						ft_quaternion_aixs.c		\
						ft_quaternion_euler.c		\
						ft_quaternion_matrix.c		\
						ft_quaternion_operator.c	\
						ft_quaternion_roration.c

SRC_QUATERNION_C = $(addprefix $(SRC_QUATERNION_DIR)/, $(SRC_QUATERNION))

SRC_MLX_KEYBOARD =							\
				ft_mac_key_hold.c			\
				ft_mac_key_down.c			\
				ft_mac_key_up.c				\
				ft_mac_keyboard.c

SRC_MLX_KEYBOARD_C = $(addprefix $(SRC_MLX_KEYBOARD_DIR)/, $(SRC_MLX_KEYBOARD))


SRC_MLX_MOUSE =								\
				ft_mac_mouse_down.c			\
				ft_mac_mouse_drag.c			\
				ft_mac_mouse_up.c			\
				ft_mac_mouse.c	

SRC_MLX_MOUSE_C = $(addprefix $(SRC_MLX_MOUSE_DIR)/, $(SRC_MLX_MOUSE))


SRC_MLX_WIN =	ft_mac_win.c

SRC_MLX_WIN_C = $(addprefix $(SRC_MLX_WIN_DIR)/, $(SRC_MLX_WIN))



OBJS =	$(SRC_00_C:$(SRC_00_DIR)/%.c=$(OBJ_DIR)/%.o)						\
		$(SRC_01_C:$(SRC_01_DIR)/%.c=$(OBJ_DIR)/%.o)						\
		$(SRC_02_PARAM_C:$(SRC_02_PARAM_DIR)/%.c=$(OBJ_DIR)/%.o)			\
		$(SRC_03_CAMERA_C:$(SRC_03_CAMERA_DIR)/%.c=$(OBJ_DIR)/%.o)			\
		$(SRC_04_RENDER_C:$(SRC_04_RENDER_DIR)/%.c=$(OBJ_DIR)/%.o)			\
		$(SRC_05_CONTROL_C:$(SRC_05_CONTROL_DIR)/%.c=$(OBJ_DIR)/%.o)		\
		$(SRC_TOOL_C:$(SRC_TOOL_DIR)/%.c=$(OBJ_DIR)/%.o)					\
		$(SRC_VECTOR_C:$(SRC_VECTOR_DIR)/%.c=$(OBJ_DIR)/%.o)				\
		$(SRC_QUATERNION_C:$(SRC_QUATERNION_DIR)/%.c=$(OBJ_DIR)/%.o)		\
		$(SRC_MATRIX_C:$(SRC_MATRIX_DIR)/%.c=$(OBJ_DIR)/%.o)				\
		$(SRC_MLX_KEYBOARD_C:$(SRC_MLX_KEYBOARD_DIR)/%.c=$(OBJ_DIR)/%.o)	\
		$(SRC_MLX_MOUSE_C:$(SRC_MLX_MOUSE_DIR)/%.c=$(OBJ_DIR)/%.o)			\
		$(SRC_MLX_WIN_C:$(SRC_MLX_WIN_DIR)/%.c=$(OBJ_DIR)/%.o)


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

debug : 
	$(CC) $(CFLAGS) $(IFLAGS) $(LDFLAGS) $(DFLAGS) $(LDLIBS) $(OBJS) -o debug -g

$(OBJ_DIR)/%.o : $(SRC_00_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_01_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_02_PARAM_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_03_CAMERA_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_04_RENDER_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_05_CONTROL_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@
	
$(OBJ_DIR)/%.o : $(SRC_MLX_KEYBOARD_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_MLX_MOUSE_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_MLX_WIN_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_TOOL_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_VECTOR_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o : $(SRC_QUATERNION_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@
	
$(OBJ_DIR)/%.o : $(SRC_MATRIX_DIR)/%.c
	$(CC) $(CXXFLAGS) $(CFLAGS) $(IFLAGS) $(DFLAGS) -c $< -o $@


#####***** clean *****#####

clean :
	rm -f $(OBJS_CLEAN)

fclean : OBJS_CLEAN+=$(TARGET)
fclean : clean

re : fclean all

.PHONY: all re clean fclean

include Makefile_color.mk
include Makefile_mlx.mk