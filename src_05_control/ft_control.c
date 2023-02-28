#include <stdlib.h>
#include <math.h>

#include "mlx.h"

#include "ft_tool.h"
#include "ft_matrix.h"
#include "ft_vector.h"
#include "ft_control.h"

int	ft_key_update(t_keyboard *keyboard, t_camera *camera)
{
	t_vec3	axis;

	if (keyboard->x || keyboard->y)
	{
		if (keyboard->y)
			camera->position = ft_vec3_add(camera->position, ft_vec3_mult(camera->axis, keyboard->y));
		if (keyboard->x)
		{
			axis = ft_vec3_mult_mtx4(camera->axis , ft_mtx4_rot_y(-M_PI * 0.5));
			camera->position = ft_vec3_add(camera->position, ft_vec3_mult(axis, keyboard->x));
		}
		return (1);
	}
	return (0);
}

int	ft_mouse_update(t_mouse *mouse, t_camera *camera)
{
	if (mouse->x_angle || mouse->y_angle)
	{
		if (mouse->x_angle)
			camera->axis = ft_vec3_mult_mtx4(camera->axis , ft_mtx4_rot_x(mouse->x_angle * 0.01));
		if (mouse->y_angle)
			camera->axis = ft_vec3_mult_mtx4(camera->axis , ft_mtx4_rot_y(-mouse->y_angle * 0.01));
		return (1);
	}
	return (0);
}

void	ft_mlx_key_mouse_win_set(t_param *param)
{
	mlx_hook(param->mlx.win_ptr, 2, 0, ft_key_down, param->control->keyboard);
	mlx_key_hook(param->mlx.win_ptr, ft_key_up, param->control->keyboard);
	mlx_mouse_hook(param->mlx.win_ptr, ft_mouse_down, param->control->mouse);
	mlx_hook(param->mlx.win_ptr, 5, 0, ft_mouse_up, param->control->mouse);
	mlx_hook(param->mlx.win_ptr, 6, 0, ft_mouse_drag, param->control->mouse);
	mlx_hook(param->mlx.win_ptr, 17, 0, ft_window, param->control->mouse);
}


int ft_control(t_control *control, t_camera *camera)
{
	return (ft_key_update(control->keyboard, camera) + ft_mouse_update(control->mouse, camera));
}

t_control	*ft_control_init()
{
	t_control	*control;

	if (!ft_zeromalloc((void **)&control, sizeof(t_control)))
		return (NULL);
	control->keyboard = ft_keyboard_set();
	control->mouse = ft_mouse_set();
	return (control);
}