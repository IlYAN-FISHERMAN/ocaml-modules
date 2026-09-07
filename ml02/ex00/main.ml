let () =
    let l = (Encode.encode [1; 2; 3]) in
    List.iter
        (fun x ->
            print_int x; print_string " ")
        l;
    print_newline()
