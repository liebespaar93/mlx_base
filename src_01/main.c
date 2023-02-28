#include <errno.h>

#include "mlx.h"

#include "ft_param.h"
#include "ft_tool.h"
#include "ft_render.h"

#include "../src_00/test.h"

int main(int argc, char const *argv[])
{
    (void)argc;
    (void)argv;
    /* code */
    t_param *param;

    param = ft_param_init();
    if (!param)
        ft_exit_print_error(ENOMEM, "main->ft_param_init()");
    param->data = ft_my_oct_tree();
    ft_draw_ply(param);
    mlx_put_image_to_window(param->mlx.mlx_ptr, param->mlx.win_ptr, param->mlx.img_ptr, CANVAS_X, CANVAS_Y);
    ft_mlx_key_mouse_win_set(param);
	mlx_loop_hook(param->mlx.mlx_ptr, ft_render, param);
    mlx_loop(param->mlx.mlx_ptr);
    return (0);
}
