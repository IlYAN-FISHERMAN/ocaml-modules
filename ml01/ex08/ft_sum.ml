let ft_sum f a b =
    if b < a then nan
    else
        let rec aux acc i =
            if i > b then acc
            else
                aux (acc +. (f i)) (i + 1)
        in
        aux 0. a
