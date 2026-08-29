let ft_print_rev (str : string) =
    let rec print (len : int) = 
        if (len >= 0)then
            begin
                print_char str.[len];
                print (len - 1);
            end
        else ()
    in
    print (String.length str - 1);
