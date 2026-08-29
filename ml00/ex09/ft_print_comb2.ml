let ft_print_comb2 () =
    let rec q b1 b2 = 
        if b2 > 99 then ()
        else begin
            if (b1 < 10) then
                print_char '0';
            print_int b1;
            print_char ' ';
            if (b2 < 10) then
                print_char '0';
            print_int b2;
            if b1 = 98 && b2 = 99 then
                print_char '\n'
            else
               begin
                    print_char ',';
                    print_char ' '
               end;
            q b1 (b2 + 1)
        end
    in
    let rec r b1 =
        if b1 > 98 then ()
        else begin
            q b1 (b1 + 1);
            r (b1 + 1)
        end
    in
    r 0
