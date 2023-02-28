#ifndef FT_CONTROL_H
# define FT_CONTROL_H

typedef struct s_control	t_control;

# include "control/ft_mac_keyboard.h"
# include "control/ft_mac_mouse.h"
# include "control/ft_mac_win.h"
# include "control/mac_keycode.h"
# include "control/mac_mousecode.h"
# include "ft_param.h"


typedef struct s_control
{
	t_keyboard	*keyboard;
	t_mouse		*mouse;
}   t_control;

void		ft_mlx_key_mouse_win_set(t_param *param);

int			ft_control(t_control *control, t_camera *camera);
t_control	*ft_control_init();

#endif
