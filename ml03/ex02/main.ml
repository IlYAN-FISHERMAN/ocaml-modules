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
    print_string "->\nbest: "; print_endline (Card.toStringVerbose (Card.best c1));

    (*
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
    print_newline();
    *)

    print_newline();
    print_newline();

    let t1 = Card.generate_random_card() in
    let t2 = Card.generate_random_card() in
    print_endline ("card1: " ^ (Card.toStringVerbose t1) ^ " | card2: " ^ (Card.toStringVerbose t2));
    print_string "compare: "; print_int (compare t1 t2); print_newline();
    print_endline ("max: " ^ (Card.toStringVerbose (Card.max t1 t2)));
    print_endline ("min: " ^ (Card.toStringVerbose (Card.min t1 t2)));
    print_endline ("card1 isOf Club: " ^ (if Card.isOf t1 Card.Color.Club then "true" else "false"));
    print_endline ("card2 isOf Club: " ^ (if Card.isOf t2 Card.Color.Club then "true" else "false"));
    print_endline ("card1 Value: " ^ (Card.Value.toStringVerbose (Card.getValue t1)));
    print_endline ("card2 Value: " ^ (Card.Value.toStringVerbose (Card.getValue t2)));
    print_endline ("card1 Color: " ^ (Card.Color.toStringVerbose (Card.getColor t1)));
    print_endline ("card2 Color: " ^ (Card.Color.toStringVerbose (Card.getColor t2)));
    print_newline()
