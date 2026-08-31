let () =
    print_int (Tak.tak 1 1 1);
    print_newline ();
    print_int (Tak.tak 2 13 4);
    print_newline ();
    print_int (Tak.tak 8 6 4);
    print_newline ();
    print_newline ();

    print_int (Tak.tak 1 2 3);
    print_newline ();

    print_int (Tak.tak 5 23 7);
    print_newline ();

    print_int (Tak.tak 9 1 0);
    print_newline ();

    print_int (Tak.tak 1 1 1);
    print_newline ();

    print_int (Tak.tak 0 42 0);
    print_newline ();

    print_int (Tak.tak 23498 98734 98776);
    print_newline ();

    print_int (Tak.tak (-1) 1 1);
    print_newline ();

    print_int (Tak.tak 0 0 0);
    print_newline ();

    print_int (Tak.tak 18 12 6);
    print_newline ()

    (*
        # tak 1 2 3;;
        - : int= 3
        # tak 5 23 7;;
        - : int= 7
        # tak 9 1 0;;
        - : int= 1
        # tak 1 1 1;;
        - : int= 1
        # tak 0 42 0;;
        - : int= 0
        # tak 23498 98734 98776;;
        - : int= 98776
     *)
