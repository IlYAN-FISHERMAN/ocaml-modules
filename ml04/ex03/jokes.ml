let () = 
    Random.self_init();

    if Array.length Sys.argv = 2 then
        begin
            let lst = ref [] in
            (try
                let file = open_in Sys.argv.(1) in
                try
                    while true do
                        let line = input_line file in
                        if String.length line = 0 then ()
                        else
                            lst := line :: !lst;
                    done with
                | End_of_file -> close_in file;
            with
            | Sys_error msg -> print_endline ("joke: " ^ msg); exit 1);

            let tab = Array.of_list !lst in
            if Array.length tab = 0 then
                print_endline "Empty file"
            else
            begin
                let joke = tab.(Random.int (Array.length tab)) in
                let lst = String.split_on_char '|' joke in
                match lst with
                | [x; y] ->
                        begin
                            print_endline x;
                            print_endline (" - " ^ y)
                        end
                | _ -> print_endline joke
            end
        end
    else
        print_endline ("jokes: Usage: dune exec " ^ Sys.argv.(0) ^ " -- <file.name>")
