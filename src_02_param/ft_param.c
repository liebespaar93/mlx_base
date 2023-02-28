#include <errno.h>
#include <stdlib.h>

#include "ft_param.h"
#include "mlx.h"
#include "ft_tool.h"

t_param *ft_param_init()
{
	t_param *param;

	param = malloc(sizeof(t_param));
	if (!param)
		ft_exit_print_error(ENOMEM, "ft_param_init()");
	param->mlx.mlx_ptr = mlx_init();
	param->mlx.win_ptr = mlx_new_window(param->mlx.mlx_ptr, WIN_WIDTH, WIN_HEIGHT, "test");
	param->mlx.img_ptr = mlx_new_image(param->mlx.mlx_ptr, WIN_WIDTH, WIN_HEIGHT);
	param->mlx.buffer = mlx_get_data_addr(param->mlx.img_ptr, &param->mlx.bits_per_pixel, &param->mlx.size_line, &param->mlx.endian);
	param->mlx.back_buffer = malloc(param->mlx.size_line * CANVAS_HEIGHT);
	param->camera = ft_camera_init();
	param->control = ft_control_init();
	if (!param->mlx.back_buffer || !param->camera || !param->control)
		ft_exit_print_error(ENOMEM, "ft_param_init()");
	return (param);
}