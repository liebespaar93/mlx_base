
#include <stdlib.h>

#include "ft_camera.h"
#include "ft_tool.h"

t_camera    *ft_camera_init()
{
	t_camera    *camera;

	camera = malloc(sizeof(t_camera));
	if (!camera)
		return (NULL);
	ft_bzero(&camera->position, sizeof(t_vec3));
	camera->axis = ft_vector_3(0.0, 0.0, 1.0);
	return (camera);
}