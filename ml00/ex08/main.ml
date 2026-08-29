let () =
    print_endline (Ft_rot_n.ft_rot_n 10 "dawd");
    print_endline (Ft_rot_n.ft_rot_n 1 "ABCDEFH10ABCDEFG");
    print_endline (Ft_rot_n.ft_rot_n 500 "ABCDEFH10ABCDEFG");
    print_endline (Ft_rot_n.ft_rot_n 10 "dawd");
    print_endline (Ft_rot_n.ft_rot_n 10 "dawd");

    print_newline();

    print_endline (Ft_rot_n.ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
    print_endline (Ft_rot_n.ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
    print_endline (Ft_rot_n.ft_rot_n 42 "0123456789");
    print_endline (Ft_rot_n.ft_rot_n 2 "OI2EAS67B9");
    print_endline (Ft_rot_n.ft_rot_n 0 "Damned !");
    print_endline (Ft_rot_n.ft_rot_n 42 "");
    print_endline (Ft_rot_n.ft_rot_n 1 "NBzlk qnbjr !");

    (*# ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz";;
    - : string= "bcdefghijklmnopqrstuvwxyza"
    # ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz";;
    - : string= "nopqrstuvwxyzabcdefghijklm"
    # ft_rot_n 42 "0123456789";;
    - : string= "0123456789"
    # ft_rot_n 2 "OI2EAS67B9";;
    - : string= "QK2GCU67D9"
    # ft_rot_n 0 "Damned !";;
    - : string= "Damned !"
    # ft_rot_n 42 "";;
    - : string= ""
    # ft_rot_n 1 "NBzlk qnbjr !";;
    - : string= "OCaml rocks !"*)
