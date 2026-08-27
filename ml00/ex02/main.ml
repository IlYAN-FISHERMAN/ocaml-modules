let () =
    let a = Ft_power.ft_power 2 4 in print_int a; (*16*)
    print_newline();
    let a = Ft_power.ft_power 3 0 in print_int a; (*1*)
    print_newline();
    let a = Ft_power.ft_power 0 5 in print_int a; (*0*)
    print_newline();
    let a = Ft_power.ft_power (-0) 42 in print_int a; (*0*)
    print_newline();
    let a = Ft_power.ft_power 5 10 in print_int a; (*9765625*)
    print_newline();
