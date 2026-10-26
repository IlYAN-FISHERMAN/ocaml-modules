let eu_dist a b =
    let acc = ref 0. in
    for i = 0 to Array.length b - 1
    do
        acc :=  !acc +. (a.(i) -. b.(i)) ** 2.
    done;
    sqrt !acc


let () =
    print_string "(expected sqrt 471855 = ~686.9): ";
    print_float (eu_dist [|1.; 10.; 86.; 753.; 2.; 138.; 8.|] [|312.; 42.; 41.; 525.; 24.; 654.; 239.|]);
    print_newline();

    print_string "(expected 5): ";
    print_float (eu_dist [|0.; 0.|] [|3.; 4.|]);
    print_newline();

    print_string "(expected 5): ";
    print_float (eu_dist [|-2.|] [|3.|]);
    print_newline();

    print_string "(expected 3): ";
    print_float (eu_dist [|0.; 0.; 0.|] [|1.; 2.; 2.|]);
    print_newline();

    print_string "(expected 0.1): ";
    print_float (eu_dist [|0.2|] [|0.3|]);
    print_newline();

    print_string "(expected 8): ";
    let ptA_4d = [|1.0; 2.0; 3.0; 4.0|] in
    let ptB_4d = [|5.0; 6.0; 7.0; 8.0|] in
    print_float (eu_dist ptA_4d ptB_4d);
    print_newline()
