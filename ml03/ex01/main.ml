let rec toString convert lst = 
    match lst with
    | [] -> ""
    | [x] -> convert x
    | x :: rest ->
            (convert x) ^ " " ^ (toString convert rest)

let () =
    let value = Value.all in
    print_endline (toString (fun x -> string_of_int (Value.toInt x)) value);
    print_endline (toString Value.toString value);
    print_endline (toString Value.toStringVerbose value);

    print_endline (try
            toString (fun x -> Value.toStringVerbose (Value.next x)) value with
    | Invalid_argument msg -> msg);

    print_endline (try
            toString (fun x -> Value.toStringVerbose (Value.previous x)) value with
    | Invalid_argument msg -> msg);

    let n = [Value.T2; Value.T3; Value.T4; Value.T5; Value.T6; Value.T7; Value.T8; Value.T9; Value.T10; Value.Jack; Value.Queen; Value.King] in
    print_endline (try
            toString (fun x -> Value.toStringVerbose (Value.next x)) n with
    | Invalid_argument msg -> msg);

    let p = [Value.T3; Value.T4; Value.T5; Value.T6; Value.T7; Value.T8; Value.T9; Value.T10; Value.Jack; Value.Queen; Value.King; Value.As] in
    print_endline (try
            toString (fun x -> Value.toStringVerbose (Value.previous x)) p with
    | Invalid_argument msg -> msg)
