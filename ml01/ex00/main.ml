let () =
    if (Array.length Sys.argv = 1) then
        begin
            print_endline (Repeat_x.repeat_x 1);
            print_endline (Repeat_x.repeat_x 5);
            print_endline (Repeat_x.repeat_x (-1));
            print_endline (Repeat_x.repeat_x 0);
            print_endline (Repeat_x.repeat_x 6)
        end
    else if (Array.length Sys.argv = 2) then
        begin
            let tmp = int_of_string_opt Sys.argv.(1) in
            print_endline (Repeat_x.repeat_x (Option.value tmp ~default:0));

            let n = Option.value tmp ~default:0 in
            if (n > 0) then
                print_newline();

            print_string "len: ";
            print_int (String.length (Repeat_x.repeat_x n));
            print_newline ()
        end
    else
        print_endline "usage : dune exec ex00/main.exe -- <number>\n";
