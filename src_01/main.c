int main(int argc, char const *argv[])
{
    (void)argc;
    (void)argv;
    /* code */

	ft_draw_ply(&param);
	mlx_put_image_to_window(param->mlx.mlx_ptr, param->mlx.win_ptr, param->mlx.img_ptr, WIN_HEIGHT, WIN_WIDTH);
	mlx_loop_hook(param->mlx.mlx_ptr, ft_loop, &param);
	mlx_loop(param->mlx.mlx_ptr);
    return 0;
}
