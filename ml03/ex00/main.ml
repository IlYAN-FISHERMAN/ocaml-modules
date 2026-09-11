let rec print convert lst = 
    match lst with
    | [] -> ""
    | [x] -> convert x ^ " "
    | x :: rest ->
            (convert x) ^ " " ^ (print convert rest)

let () =
    print_endline (print Color.toString Color.all);
    print_endline (print Color.toStringVerbose Color.all)
