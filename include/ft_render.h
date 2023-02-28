#ifndef FT_RENDER_H
# define FT_RENDER_H

#include "ft_param.h"

int	ft_render(t_param *param);

void	ft_backbuffer_put_pixel(int x, int y, int color, t_param *param);
void	ft_scanline(t_vec2 standard, t_vec2 next, t_param *param, int color);

#endif
