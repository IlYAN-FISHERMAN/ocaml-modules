let eu_dist a b =
    let acc = ref 0. in
    for i = 0 to Array.length b - 1
    do
        acc :=  !acc +. (a.(i) -. b.(i)) ** 2.
    done;
    sqrt !acc

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

type radar = float array * string

let one_nn (rlist : radar list) ((r, _) : radar) =
        match rlist with
        | [] -> failwith "one_nn: empty training set"
        | (hd, electron) :: lst ->
            let name = ref electron in
            let dist = ref (eu_dist hd r) in
            List.iter (fun (x, y) ->
                let eu = eu_dist x r in
                if eu < !dist then
                begin
                    dist := eu;
                    name := y
                end) lst;
            !name

let () =
    if Array.length Sys.argv = 2 then
        print_endline (one_nn (examples_of_file Sys.argv.(1)) ([|1.; 0. ; 0.99025; 1.|],  "d"))
    else
        print_endline ("Usage: " ^ Sys.argv.(0) ^ ": ./file.csv")
