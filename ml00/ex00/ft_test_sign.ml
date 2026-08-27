let ft_test_sign (nb : int) = 
    match nb with
    | nb when nb >= 0 ->
            print_endline "positive"
    | _ ->
            print_endline "negative"
