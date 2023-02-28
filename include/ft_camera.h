#ifndef FT_CAMERA_H
# define FT_CAMERA_H

# include "ft_vector.h"

typedef struct s_camera	t_camera;

typedef struct s_camera	
{
    t_vec3  position;
    t_vec3  axis;
}   t_camera;

t_camera    *ft_camera_init();

#endif
