let () =
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) 1 10);
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) 4 10);
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) 6 42);
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) 313 0);
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) 5 5);
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) (-4) (-10));
    print_newline();
    print_float (Ft_sum.ft_sum (fun i -> float_of_int (i * i)) (-10) (-4));
    print_newline()
