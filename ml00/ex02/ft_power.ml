let rec ft_power pow nb =
    if nb < 0 then failwith "can't be negative"
    else if nb = 0 then 1
    else
        let tmp = ft_power pow (nb / 2) in
        if nb mod 2 = 0 then tmp * tmp
        else
            pow * tmp * tmp
