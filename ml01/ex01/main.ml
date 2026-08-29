let () =
    if (Array.length Sys.argv = 1) then
        begin
            print_endline (Repeat_string.repeat_string ~str:"hey" 2);
            print_endline (Repeat_string.repeat_string 0)
        end
    else if (Array.length Sys.argv = 3) then
        begin
            let tmp = Sys.argv.(1) in
            let nb = int_of_string_opt Sys.argv.(2) in
            print_endline (Repeat_string.repeat_string ~str:tmp (Option.value nb ~default:0));
        end
    else
        print_endline "usage : dune exec ex00/main.exe -- <number>\n"
