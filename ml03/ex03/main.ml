let () =
    print_string "Deck 1 verbose -> ";
    let d1 = Deck.newDeck () in
    List.iter (fun x -> print_string (x ^ " ")) (Deck.toStringListVerbose d1);
    print_newline ();
    print_newline ();
    print_string "Deck 2 verbose -> ";
    let d2 = Deck.newDeck () in
    List.iter (fun x -> print_string (x ^ " ")) (Deck.toStringListVerbose d2);
    print_newline ();
    print_newline ();

    print_string "Deck 1 -> ";
    List.iter (fun x -> print_string (x ^ " ")) (Deck.toStringList d1);
    print_newline ();
    print_newline ();
    print_string "Deck 2 -> ";
    List.iter (fun x -> print_string (x ^ " ")) (Deck.toStringList d2);
    print_newline ();
    print_newline ();


    print_newline ();
    print_newline ();
    print_string "Time to draw ! from d1 -> ";
    let (card, d1a) = Deck.drawCard d1 in
    print_string ((Deck.Card.toString card) ^ " ");
    let (card, d1b) = Deck.drawCard d1a in
    print_string ((Deck.Card.toString card) ^ " ");
    let (card, d1c) = Deck.drawCard d1b in
    print_endline ((Deck.Card.toString card) ^ " ");
    print_string "d1 after -> ";
    List.iter (fun x -> print_string (x ^ " ")) (Deck.toStringList d1c);

    print_newline ();
    print_newline ();
    print_endline (try
    let rec print_deck deck = 
        let (card, d1) = Deck.drawCard deck in
        print_endline (Deck.Card.toString card);
        print_deck d1
    in
    print_deck d1c with
    | Failure msg -> msg);
