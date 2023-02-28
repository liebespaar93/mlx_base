
#ifndef FT_PARAM_H
# define FT_PARAM_H

typedef struct s_param	t_param;
typedef struct s_mlx	t_mlx;

# include "ft_camera.h"
# include "ft_control.h"

# define WIN_WIDTH   500
# define WIN_HEIGHT  500


typedef struct s_mlx
{
	void		*mlx_ptr;
	void		*win_ptr;
	void		*img_ptr;
	char		*buffer;

	int			bits_per_pixel;
	int			size_line;
	int			endian;
}	t_mlx;

typedef struct s_param
{
	t_mlx		mlx;

	t_camera	*camera;
	t_control	*control;
}	t_param;


t_param *ft_param_init();

#endif
