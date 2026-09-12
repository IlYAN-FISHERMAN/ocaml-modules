let () =
    Random.self_init();
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_endline (Card.toString (Card.generate_random_card ()));
    print_newline();

    let c1 = let rec aux i =
        if i = 0 then []
        else
            Card.generate_random_card() :: aux (i - 1)
    in aux 5 in
    Card.printVerbose c1;
    print_endline "-> ";
    print_endline "best:\t"; print_endline (Card.toStringVerbose (Card.best c1));

    print_newline();
    let cards = Card.all in
    Card.printVerbose cards;
    print_newline();
    print_newline();

    let c2 = Card.allSpades in
    Card.printVerbose c2;
    print_newline();
    print_newline();

    let c3 = Card.allHearts in
    Card.printVerbose c3;
    print_newline();
    print_newline();

    let c4 = Card.allDiamonds in
    Card.printVerbose c4;
    print_newline();
    print_newline();

    let c5 = Card.allClubs in
    Card.printVerbose c5;
    print_newline();
