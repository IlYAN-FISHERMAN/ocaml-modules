let rec ft_countdown (nb : int) = 
    if nb <= 0 then
        begin
            print_int 0;
            print_char '\n'
        end
    else
        begin
            print_int nb;
            print_char '\n';
            ft_countdown (nb - 1)
        end
