

#include "ft_param.h"
#include "ft_queue.h"
#include "ft_oct_tree.h"
#include <stdlib.h>
#include "ft_render.h"
#include "ft_vector.h"
#include "ft_matrix.h"

#include "ft_quaternion.h"

double	*ft_get_data_position(void	*data)
{
	double	*org_data;

	org_data = (double *)data;
	return (org_data);
}

t_oct_tree *ft_my_oct_tree()
{
	t_oct_tree	*oct_head;
	t_queue		*a;
	double		**b;
	int size;

	size = 50;
    a = NULL;
	b = malloc(sizeof(double [3]) * (size * 2 + 1));
	if (!b)
		return (0);
	for (int i = -size; i < size; i++)
	{
		b[i + size] = malloc(sizeof(double [3]));
		b[i + size][0] = ((float)rand() / RAND_MAX) * 400.0 - 200.0;
		b[i + size][1] = ((float)rand() / RAND_MAX) * 400.0 - 200.0;
		b[i + size][2] = ((float)rand() / RAND_MAX) * 400.0 - 200.0;
        a = ft_queue_add(a, ft_new_queue(b[i + size]));
	}
	oct_head = ft_oct_tree_head_set(a, ft_get_data_position);
    while (a)
    {
	    ft_oct_add(oct_head, a->data, ft_get_data_position);
        a = a->next;
    }
    ft_print_oct_tree(oct_head, ft_get_data_position);
    return (oct_head);
}




void	ft_put_line_oct(t_param *param, t_oct_tree *temp)
{
	t_vec3	rotation;
	t_vec3	point[8];
	t_quaternion q;

	for (int i = 0; i < 8; i++)
	{
		point[i].x = temp->position[0] + temp->size * (1.0 - 2.0 * (!(i & 1))); // 임시 중앙정렬
		point[i].y = temp->position[1] + temp->size * (1.0 - 2.0 * (!(i & 2)));
		point[i].z = temp->position[2] + temp->size * (1.0 - 2.0 * (!(i & 4)));
		q = ft_quaternion_rotation_xyz(param->camera->axis);
		rotation = ft_vec3_mult_mtx4(point[i], ft_mtx4_rot_x(param->camera->axis.x));
		rotation = ft_vec3_mult_mtx4(rotation, ft_mtx4_rot_y(param->camera->axis.y));
		rotation = ft_vec3_mult_mtx4(rotation, ft_mtx4_rot_z(param->camera->axis.z));
		rotation = ft_vec3_add(rotation, ft_vector_3(WIN_WIDTH * 0.5,WIN_WIDTH * 0.5,WIN_WIDTH * 0.5));
		point[i] = rotation;
	}
	for (int i = 0; i < 8; i += 2)
	{
		ft_scanline(ft_vector_2(point[i].x, point[i].y),
			ft_vector_2(point[i + 1].x, point[i + 1].y),
			param, 0x00ff00ff);
	}
	
	for (int i = 0; i < 8; i += 4)
	{
		ft_scanline(ft_vector_2(point[i].x, point[i].y),
			ft_vector_2(point[i + 2].x, point[i + 2].y),
			param, 0x000000ff);
		ft_scanline(ft_vector_2(point[i + 1].x, point[i + 1].y),
			ft_vector_2(point[i + 3].x, point[i + 3].y),
			param, 0x000000ff);
	}
	for (int i = 0; i < 4; i++)
	{
		ft_scanline(ft_vector_2(point[i].x, point[i].y),
			ft_vector_2(point[i + 4].x, point[i + 4].y),
			param, 0x0000ffff);
	}
}

void	ft_put_point(t_param *param, double *position)
{
    int x, y;
	t_vec3	rotation;

    x = y = -2;
	while (x < 2)
	{
		y = -2;
		while (y < 2)
		{
			// ft_backbuffer_put_pixel(position[0] + x + (WIN_WIDTH * 0.5), position[1] + y + (WIN_HEIGHT * 0.5), 0x00ff3333, param); 
			
			rotation = ft_vec3_mult_mtx4(ft_vec3(position), ft_mtx4_rot_x(param->camera->axis.x));
			rotation = ft_vec3_mult_mtx4(rotation, ft_mtx4_rot_y(param->camera->axis.y));
			rotation = ft_vec3_mult_mtx4(rotation, ft_mtx4_rot_z(param->camera->axis.z));
			rotation = ft_vec3_add(rotation, ft_vector_3(WIN_WIDTH * 0.5,WIN_WIDTH * 0.5,WIN_WIDTH * 0.5));

			ft_backbuffer_put_pixel(rotation.x + x, rotation.y + y, 0x00ff3333, param); 
			y++;
		}
		x++;
	}
}

void	ft_draw_ply(t_param *param)
{
	t_oct_tree	*temp;
	t_queue		*queue;
	double		*position;
	
	temp = param->data;
	queue = ft_new_queue(temp);
	while (queue)
	{
		temp = queue->data;
		ft_put_line_oct(param, temp);
		for (int index = 0; index < 8; index++)
		{
			if (temp->next[index])
				queue = ft_queue_add(queue, ft_new_queue(((t_oct_tree *)queue->data)->next[index]));
		}
		if (temp->data_index == 1)
		{
			position = temp->data_list->data;
			ft_put_point(param, position);
		}
		ft_queue_free(&queue);
	}
}