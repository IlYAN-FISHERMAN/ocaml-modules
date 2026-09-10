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
