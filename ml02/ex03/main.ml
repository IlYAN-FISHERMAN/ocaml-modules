let () =
    let nb = 10 in
    if nb < 20 then
        let rec aux i =
            if i > nb then ()
            else
                begin
                    print_endline (Sequence.sequence i);
                    aux (i + 1)
                end
    in
    aux 1
    else
        print_endline (Sequence.sequence 20)
