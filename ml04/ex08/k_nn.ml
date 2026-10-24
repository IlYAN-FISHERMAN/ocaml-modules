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
        print_endline (k_nn (examples_of_file Sys.argv.(1)) (int_of_string Sys.argv.(2)) ([|1.; 0.; 0.02337; -0.00592; -0.09924; -0.11949; -0.00763; -0.11824; 0.14706; 0.06637; 0.03786; -0.06302; 0.; 0.; -0.04572; -0.15540; -0.00343; -0.10196; -0.11575; -0.05414; 0.01838; 0.03669; 0.01519; 0.00888; 0.03513; -0.01535; -0.03240; 0.09223; -0.07859; 0.00732; 0.; 0.; -0.00039; 0.12011|], "g"))
    else
        print_endline ("Usage: " ^ Sys.argv.(0) ^ ": ./file.csv K")
