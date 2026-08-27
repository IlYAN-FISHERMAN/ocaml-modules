let rec ft_power (nb : int) (pow : int) =
    match pow with
    | 0 -> 1
    | _ when pow < 0 -> 0
    | _ when pow mod 2 = 0 ->
            let tmp = ft_power nb (pow / 2) in
            tmp * tmp
    | _ -> nb * ft_power nb (pow - 1)
