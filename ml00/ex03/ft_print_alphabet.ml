let ft_print_alphabet () = 
    let rec print (nb : int) =
        if nb <= 122
        then
         begin
          print_char(char_of_int(nb));
          print (nb + 1);
        end

    in print 97;
    print_char ('\n')
