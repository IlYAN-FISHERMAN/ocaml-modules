let rec print print_elem lst = 
    match lst with
    | [] -> print_newline();
    | x :: rest ->
        print_char '(';
        print_elem x;
        print_string ") ";
        print print_elem rest

let () =
    print_string "[1;2;3] x [2;3;4]     -> ";
    print print_int (Crossover.crossover [1; 2; 3] [2; 3; 4]);

    print_string "[1;2;3] x [4;5;6]     -> ";
	print print_int (Crossover.crossover [1; 2; 3] [4; 5; 6]);
	
	print_string "[] x [1;2]            -> ";
	print print_int (Crossover.crossover [] [1; 2]);
	
	print_string "[1;2] x []            -> ";
	print print_int (Crossover.crossover [1; 2] []);
	
	print_string "[] x []               -> ";
	print print_int (Crossover.crossover [] []);
	
	print_string "[1;2] x [2;1]         -> ";
	print print_int (Crossover.crossover [1; 2] [2; 1]);
	
	print_string "[1;1;2] x [1;3]       -> ";
	print print_int (Crossover.crossover [1; 1; 2] [1; 3]);
	
	print_string "[1;2;3] x [1;2;3]     -> ";
	print print_int (Crossover.crossover [1; 2; 3] [1; 2; 3]);
	
	print_string "['a';'b'] x ['b';'c'] -> ";
    print print_char (Crossover.crossover ['a'; 'b'] ['b'; 'c']);

    print_string "['1';'24';'76';'42';'13'] x ['1';'7';'13';'414';'876'] -> ";
    print print_int (Crossover.crossover [1; 24; 76; 42 ;13] [1; 7; 13; 414; 876])
