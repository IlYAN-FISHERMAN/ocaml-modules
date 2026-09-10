let () =
    Random.self_init ();
    print_endline "[Begin tests]\n";


    print_endline "[Normal tests, use all function]";
    let hel = (Helix.generate_helix 10) in
    print_endline (Helix.helix_to_string hel);
    let compl = Helix.complementary_helix hel in
    print_endline (Helix.helix_to_string compl);
    print_endline "\n";

    print_endline "[Test with generate_helix 0 and -1]";
    print_endline (Helix.helix_to_string (Helix.generate_helix 0));
    print_endline (Helix.helix_to_string (Helix.generate_helix (-1)));
    print_endline "\n";


    print_endline "[Test manually]";
    let man = [Helix.generate_nucleotide 'A'; Helix.generate_nucleotide 'X'] in
    print_endline (Helix.helix_to_string man);
    print_endline (Helix.helix_to_string (Helix.complementary_helix man));
    print_newline();
