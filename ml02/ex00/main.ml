let rec print print_elem lst = 
    match lst with
    | [] -> print_newline();
    | (n, x) :: rest ->
        print_char '(';
        print_int n;
        print_string ", ";
        print_elem x;
        print_string ") ";
        print print_elem rest

let () =
    print print_int (Encode.encode [1; 1; 1; 1; 1; 14; 14; 14; 14; 14; 42; 444]);
    print print_string (Encode.encode ["hello"; "hello"; "hello"; "hello"; "hello"; "42"; "42"; "42"; "hello world"]);
    print print_int (Encode.encode [1; 1; 1; 1; 1; 14; 14; 14; 14; 14; 42; 444]);
    print print_int (Encode.encode []);
    print print_int (Encode.encode [-1])
