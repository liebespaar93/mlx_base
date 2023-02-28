#include "ft_param.h"

#include <stdio.h>

#include "mlx.h"

#include "test.h"
#include "ft_tool.h"

int	ft_render(t_param *param)
{
	if (ft_control(param->control, param->camera))
	{
		printf("?? : %f %f %f \n" , param->camera->position.x, param->camera->position.y, param->camera->position.z);
		printf("?? : %f %f %f \n" , param->camera->axis.x, param->camera->axis.y, param->camera->axis.z);
		fflush(stdout);
		ft_bzero(param->mlx.back_buffer, param->mlx.size_line * WIN_HEIGHT);
    	ft_draw_ply(param);
		ft_memcpy(param->mlx.buffer, param->mlx.back_buffer, param->mlx.size_line * CANVAS_HEIGHT);
		mlx_clear_window(param->mlx.mlx_ptr,param->mlx.win_ptr);
   		mlx_put_image_to_window(param->mlx.mlx_ptr, param->mlx.win_ptr, param->mlx.img_ptr, CANVAS_X, CANVAS_Y);
	}
	return (0);
}