let check label expected actual =
	let status = if expected = actual then "OK  " else "FAIL" in
	print_endline (status ^ " | " ^ label
	               ^ " | expected: \"" ^ expected
	               ^ "\" | got: \"" ^ actual ^ "\"")



let () =
	print_endline "\n[Automated checks]";

	check "AUGUUUGCA"
	  "[Met] [Phe] [Ala] "
	  (Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[A;U;G;U;U;U;G;C;A]));

	check "AUGUUUGC (incomplete triplet)"
	  "[Met] [Phe] "
	  (Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[A;U;G;U;U;U;G;C]));

	check "AUGUUUUAAAUG (stop)"
	  "[Met] [Phe] "
	  (Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[A;U;G;U;U;U;U;A;A;A;U;G]));

	check "UAAAUG (stop first)"
	  ""
	  (Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[U;A;A;A;U;G]));

	check "empty rna"
	  ""
	  (Ribosome.string_of_protein (Ribosome.decode_arn []));

	check "AU (fewer than 3)"
	  ""
	  (Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[A;U]));

	check "complementary_helix ATCG"
	  "TAGC"
	  (Ribosome.helix_to_string (Ribosome.complementary_helix
	     [Ribosome.generate_nucleotide 'A'; Ribosome.generate_nucleotide 'T';
	      Ribosome.generate_nucleotide 'C'; Ribosome.generate_nucleotide 'G']));

	check "generate_rna ATCGA (subject example)"
	  "UAGCU"
	  (Ribosome.rna_to_string (Ribosome.generate_rna
	     [Ribosome.generate_nucleotide 'A'; Ribosome.generate_nucleotide 'T';
	      Ribosome.generate_nucleotide 'C'; Ribosome.generate_nucleotide 'G';
	      Ribosome.generate_nucleotide 'A']));

    print_newline();
	Random.self_init ();

	print_endline "[Triplets]";
	let r1 = Ribosome.[A; U; G; U; U; U; G; C; A] in
	print_endline ("AUGUUUGCA -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn r1));

	print_endline "\n[Triplet incomplet ignore]";
	let r2 = Ribosome.[A; U; G; U; U; U; G; C] in
    print_endline ("AUGUUUGC -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn r2));

	print_endline "\n[Arret au premier Stop]";
	let r3 = Ribosome.[A; U; G; U; U; U; U; A; A; A; U; G] in
	print_endline ("AUGUUUUAAAUG -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn r3));

	print_endline "\n[Stop en premier]";
	let r4 = Ribosome.[U; A; A; A; U; G] in
	print_endline ("UAAAUG -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn r4));

	print_endline "\n[Rna vide]";
	print_endline ("[] -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn []));

	print_endline "\n[Moins de 3 bases]";
	print_endline ("AU -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn Ribosome.[A; U]));

	print_endline "\n[Chaine complete]";
	let h = Ribosome.generate_helix 15 in
	print_endline ("Helix   -> " ^ Ribosome.helix_to_string h);
	let r = Ribosome.generate_rna h in
	print_endline ("Rna     -> " ^ Ribosome.rna_to_string r);
	print_endline ("Protein -> " ^ Ribosome.string_of_protein (Ribosome.decode_arn r))

(*
	      AUGUUUGCA      → MetPheAla
	      AUGUUUGC       → MetPhe          (le GC incomplet est ignoré)
	      AUGUUUUAAAUG   → MetPhe          (arrêt au UAA, le AUG suivant n'est pas traduit)
	      UAAAUG         → (vide)          (Stop dès le premier triplet)
	      []             → (vide)
	      AU             → (vide)
	 *)
