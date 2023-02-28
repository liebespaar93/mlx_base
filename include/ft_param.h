
#ifndef FT_PARAM_H
# define FT_PARAM_H

typedef struct s_param	t_param;
typedef struct s_mlx	t_mlx;

# include "ft_camera.h"
# include "ft_control.h"

# define WIN_WIDTH   700
# define WIN_HEIGHT  700

# define CANVAS_X		0
# define CANVAS_Y		0
# define CANVAS_WIDTH	WIN_WIDTH
# define CANVAS_HEIGHT	WIN_HEIGHT

typedef struct s_mlx
{
	void		*mlx_ptr;
	void		*win_ptr;
	void		*img_ptr;
	char		*buffer;
	char		*back_buffer;

	int			bits_per_pixel;
	int			size_line;
	int			endian;
}	t_mlx;

typedef struct s_param
{
	t_mlx		mlx;

	t_camera	*camera;
	t_control	*control;

	void		*data;
}	t_param;


t_param *ft_param_init();

#endif
