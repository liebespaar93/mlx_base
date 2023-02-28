/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_tool.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kyoulee <kyoulee@student.42seoul.kr>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/23 09:54:18 by kyoulee           #+#    #+#             */
/*   Updated: 2023/02/28 17:47:36 by kyoulee          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_MINIRT_TOOL_H
# define FT_MINIRT_TOOL_H

# include <sys/_types/_size_t.h>

void	ft_bzero(void *s, size_t n);

size_t	ft_strlen(const char *str);

void	*ft_zeromalloc(void **ptr, size_t size);

void	ft_exit_error(int error);
void	ft_exit_print_error(int error, char *str);

#endif
