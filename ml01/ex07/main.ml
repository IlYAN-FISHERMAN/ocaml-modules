let () =
    print_string (if (Converges.converges (( * ) 2) 2 5) then "true" else "false");
    print_newline();
    print_string (if (Converges.converges (fun x -> x / 2) 2 3) then "true" else "false");
    print_newline();
    print_string (if (Converges.converges (fun x -> x / 2) 2 3) then "true" else "false");
    print_newline();
    print_string (if (Converges.converges (fun x -> x * x) 2 4) then "true" else "false");
    print_newline()
