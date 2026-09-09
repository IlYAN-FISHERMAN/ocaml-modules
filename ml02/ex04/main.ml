let () =
    let n = (Nucleotides.generate_nucleotide 'A')
    in
    print_endline n.phosphate;
    print_endline n.deoxyribose
