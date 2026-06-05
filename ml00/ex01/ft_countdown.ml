let rec ft_countdown nb = 
    if nb <= 0 then
        begin
            print_int 0;
            print_newline()
        end
    else
        begin
            print_int nb;
            print_newline();
            ft_countdown (nb - 1)
        end
