let examples_of_file file_path =
    let lst = ref [] in
    (try
        let file = open_in file_path in
        try
            while true do
                let line = input_line file in
                if String.length line = 0 then ()
                else if String.starts_with ~prefix:"#" line then ()
                else
                    begin
                        let string_list = String.split_on_char ',' line in
                        let tab = Array.of_list string_list in
                        let len = Array.length tab in
                        let electron = tab.(len - 1) in
                        let ftab = ref [||] in
                        for x = 0 to Array.length tab - 2
                        do
                            ftab := Array.append !ftab [|float_of_string tab.(x)|]
                        done;
                        lst := (!ftab, electron) :: !lst;
                    end
            done with
        | End_of_file -> close_in file;
    with
    | Sys_error msg -> print_endline (Sys.argv.(0) ^ " " ^ msg); exit 1);
    List.rev !lst

let () =
    if Array.length Sys.argv = 2 then
        let lst = examples_of_file Sys.argv.(1) in
        List.iter (fun (ftab, electron) ->
            Array.iter (fun f -> print_string (string_of_float f ^ ",")) ftab;
            print_endline electron
        ) lst
    else
        print_endline ("Usage: " ^ Sys.argv.(0) ^ ": ./file.csv")
