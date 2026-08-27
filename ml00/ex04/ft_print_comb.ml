let ft_print_comb () = 
    let rec p (n1 : int) (n2 : int) (n3 : int) =
        if n3 > 9 then ()
        else begin
            print_int n1;
            print_int n2;
            print_int n3;
            if n1 <> 7 || n2 <> 8 || n3 <> 9
            then
                print_string ", "
            else
                print_string "\n";
            p n1 n2 (n3 + 1)
        end
    in
    let rec q (n1 : int) (n2 : int) =
        if n2 > 8 then ()
        else begin
            p n1 n2 (n2 + 1);
            q n1 (n2 + 1);
        end
    in
    let rec r (n1 : int) = 
        if n1 > 7 then ()
        else begin
            q n1 (n1 + 1);
            r (n1 + 1);
        end
    in r 0;
