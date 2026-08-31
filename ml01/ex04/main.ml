let () =
    print_int (Fibonacci.fibonacci (-42));
    print_newline();
    print_int (Fibonacci.fibonacci 1);
    print_newline();
    print_int (Fibonacci.fibonacci 2);
    print_newline();
    print_int (Fibonacci.fibonacci 3);
    print_newline();
    print_int (Fibonacci.fibonacci 6);
    print_newline();
    print_int (Fibonacci.fibonacci 18); (*2 584*)
    print_newline();
    print_int (Fibonacci.fibonacci 42); (*267 914 296*)
    print_newline()
