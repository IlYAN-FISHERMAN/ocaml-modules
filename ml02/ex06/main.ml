let () =
    Random.self_init ();
    print_endline "[Begin tests]\n";


    print_endline "[Normal tests, use all function]";
    let hel = (Rna.generate_helix 10) in
    print_endline ("Helix -> " ^ (Rna.helix_to_string hel));
    print_endline ("Rna   -> " ^ (Rna.rna_to_string (Rna.generate_rna hel)));
    let compl = Rna.complementary_helix hel in
    print_endline ("Compl of heli, changed to Rna -> " ^ (Rna.rna_to_string (Rna.generate_rna compl)));
    print_endline "\n";

    print_endline "[Test with generate_rna 0 and -1]";
    print_endline (Rna.rna_to_string (Rna.generate_rna (Rna.generate_helix 0)));
    print_endline (Rna.rna_to_string (Rna.generate_rna (Rna.generate_helix (-1))));
    print_endline "\n";


    print_endline "[Test manually]";
    print_string "with None -> ";
    let man = [Rna.generate_nucleotide 'A'; Rna.generate_nucleotide 'X'] in
    print_endline ("Helix -> " ^ (Rna.helix_to_string man));
    print_endline ("Rna   -> " ^ (Rna.rna_to_string (Rna.generate_rna man)));
    print_newline();
    let last = [Rna.generate_nucleotide 'A'; Rna.generate_nucleotide 'T'; Rna.generate_nucleotide 'C'; Rna.generate_nucleotide 'G'; Rna.generate_nucleotide 'A'] in
    print_endline ("Subject -> [" ^ (Rna.helix_to_string last) ^ "] to rna -> [" ^ (Rna.rna_to_string (Rna.generate_rna last)) ^ "]")
