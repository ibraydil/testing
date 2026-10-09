/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   complex.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pokuzmic <pokuzmic@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/10/06 14:47:41 by dibrayev          #+#    #+#             */
/*   Updated: 2026/10/08 16:17:23 by pokuzmic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

static int	get_max_bits(int size)
{
	int	max_bits;

	max_bits = 0;
	while (((size - 1) >> max_bits) != 0)
		max_bits++;
	return (max_bits);
}

static int	values_to_ranks(t_stack *a)
{
	int	*sorted;
	int	i;
	int	j;

	sorted = sorted_copy(a);
	if (sorted == NULL)
		return (0);
	i = 0;
	while (i < a->size)
	{
		j = 0;
		while (sorted[j] != a->data[i])
			j++;
		a->data[i] = j;
		i++;
	}
	free(sorted);
	return (1);
}

static void	radix_pass(t_ps *ps, int bit, int size)
{
	int	j;

	j = 0;
	while (j++ < size)
	{
		if (((ps->a.data[0] >> bit) & 1) == 1)
			ft_ra(ps);
		else
			ft_pb(ps);
	}
	while (ps->b.size > 0)
		ft_pa(ps);
}

void	radix_sort(t_ps *ps)
{
	int	i;
	int	size;
	int	max_bits;

	if (!values_to_ranks(&ps->a))
	{
		selection_sort(ps);
		return ;
	}
	size = ps->a.size;
	max_bits = get_max_bits(size);
	i = -1;
	while (++i < max_bits)
		radix_pass(ps, i, size);
}
