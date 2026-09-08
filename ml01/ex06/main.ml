let () =
    print_int (Iter.iter (fun x -> x * x) 2 4);
    print_newline ();
    print_int (Iter.iter (fun x -> x * 2) 2 4);
    print_newline ();
    print_int (Iter.iter (fun x -> x * x) 3 4);
    print_newline ();
    print_int (Iter.iter (fun x -> x + 1 * (x - 1)) 10 7);
    print_newline ();
    print_int (Iter.iter (fun x -> x + 1 * (x - 1)) 0 0);
    print_newline ();
    print_int (Iter.iter (fun x -> x + 1 * (x - 1)) (-1) (-1));
    print_newline ();
    print_int (Iter.iter (fun x -> x + 1) 0 5);
    print_newline ()
