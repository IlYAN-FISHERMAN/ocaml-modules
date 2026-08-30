let () =
    print_int (Ackermann.ackermann 3 3);
    print_newline();
    print_int (Ackermann.ackermann 3 8);
    print_newline();
    print_int (Ackermann.ackermann 3 10);
    print_newline();
    print_int (Ackermann.ackermann 4 0);
    print_newline();
    print_int (Ackermann.ackermann 4 1);
    print_newline();
    print_int (Ackermann.ackermann (-1) 7);
    print_newline();
    (*
    print_int (Ackermann.ackermann 4 2); c'est non
    print_newline();
    *)


    (*
        3 3     61              instantané
        3 8     2045            ~1 s
        3 10    8189            ~30 s
        4 0     13              instantané
        4 1     65533           des heures, ou stack overflow
        4 2     2^65536 − 3     jamais
    *)
