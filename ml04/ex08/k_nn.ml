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

let k_nn (rlist : radar list) (k: int) ((r, _) : radar) =
        match rlist with
        | [] -> failwith "k_nn: empty training set"
        | _ when k <= 0 -> failwith "k_nn: k must be positive"
        | _ ->
            begin
                let lst = ref (List.map (fun (tab, name) -> (eu_dist tab r, name)) rlist) in
                lst := List.stable_sort (fun (x, _) (y, _) -> compare x y) !lst;
                lst := List.filteri (fun i _ -> i < k) !lst;
                let class_map = ref [] in
                List.iter (fun (_, current_name) ->
                    if List.exists (fun (name_tmp, _) -> current_name = name_tmp) !class_map then
                        ()
                    else
                        begin
                            let vote = ref 0 in
                            List.iter (fun (_, last_name) -> if last_name = current_name then vote := !vote + 1) !lst;
                            class_map := !class_map @ [(current_name, !vote)]
                        end
                ) !lst;
                class_map := List.stable_sort (fun (_ , vote1) (_, vote2) -> compare vote2 vote1) !class_map;
                let (last, _) = List.hd !class_map in
                last
            end

let () =
    if Array.length Sys.argv = 3 then
        print_endline (k_nn (examples_of_file Sys.argv.(1)) (int_of_string Sys.argv.(2)) ([|1.; 0. ; 0.99025; -2.05785; 0.99793; -0.13009; 0.98663; -0.19430; 0.99374; -0.25843; 0.92738; -0.30130; 0.92651; -0.37965; 0.89812; -0.43796; 0.84922; -0.52064; 0.87433; -0.57075; 0.79016; -0.59839; 0.74725; -0.64615; 0.68282; -0.68479; 0.65247; -0.73174; 0.61010; -0.75353; 0.54752; -0.80278; 0.49195; -0.83245|],  "g"))
    else
        print_endline ("Usage: " ^ Sys.argv.(0) ^ ": ./file.csv K")
