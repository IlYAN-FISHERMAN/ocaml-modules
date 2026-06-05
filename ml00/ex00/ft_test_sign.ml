let ft_test_sign nb = 
    match nb with
    | nb when nb >= 0 ->
            print_endline "positif"
    | _ ->
            print_endline "negatif"
