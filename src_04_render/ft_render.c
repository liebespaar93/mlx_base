#include "ft_param.h"

#include <stdio.h>

int	ft_render(t_param *param)
{
	if (ft_control(param->control, param->camera))
	{
		printf("?? : %d %d \n" , param->control->keyboard->x, param->control->keyboard->y);
		printf("?? : %d %d \n" , param->control->mouse->x_angle, -param->control->mouse->y_angle);
		printf("?? : %f %f %f \n" , param->camera->position.x, param->camera->position.y, param->camera->position.z);
		printf("?? : %f %f %f \n" , param->camera->axis.x, param->camera->axis.y, param->camera->axis.z);
		param->control->mouse->x_angle = 0;
		param->control->mouse->y_angle = 0;
		param->control->keyboard->x = 0;
		param->control->keyboard->y = 0;
		fflush(stdout);
		//ft_draw();
	}
	return (0);
}