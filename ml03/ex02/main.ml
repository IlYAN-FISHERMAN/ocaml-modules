let () =
    let c = Card.newCard Card.Value.T2 Card.Color.Heart in
    print_endline (Card.toString c);
    let cards = Card.all in
    Card.print cards;
    Card.printVerbose cards
