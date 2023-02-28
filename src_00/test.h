#ifndef TEST_H
# define TEST_H

#include "ft_param.h"
#include "ft_queue.h"
#include "ft_oct_tree.h"
#include <stdlib.h>
void	ft_draw_ply(t_param *param);

void	ft_put_point(t_param *param, double *position);
void	ft_put_line_oct(t_param *param, t_oct_tree *temp);
t_oct_tree *ft_my_oct_tree();
double	*ft_get_data_position(void	*data);

#endif
