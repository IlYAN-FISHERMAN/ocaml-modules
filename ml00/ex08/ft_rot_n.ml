let ft_rot_n n str =
    String.map (fun c ->
        if c >= 'a' && c <= 'z' then
            char_of_int (((int_of_char c - int_of_char 'a' + n) mod 26) + int_of_char 'a')
        else if c >= 'A' && c <= 'Z' then
            char_of_int (((int_of_char c - int_of_char 'A' + n) mod 26) + int_of_char 'A')
        else
            c
    ) str
