let is_digit c = c >= '0' && c <= '9'

let is_alpha c = c >= 'a' && c <= 'z'

let () =
    print_string (if (Ft_string_all.ft_string_all is_digit "09876543w21") then "true" else "false");
    print_newline ();
    print_string (if (Ft_string_all.ft_string_all is_digit "0987654321") then "true" else "false");
    print_newline ();
    print_string (if (Ft_string_all.ft_string_all is_digit "") then "true" else "false");
    print_newline ();
    print_string (if (Ft_string_all.ft_string_all is_alpha "dawdsawsdawsd") then "true" else "false");
    print_newline ();
    print_string (if (Ft_string_all.ft_string_all is_alpha "dawdsawsdawsdA") then "true" else "false");
    print_newline ();
