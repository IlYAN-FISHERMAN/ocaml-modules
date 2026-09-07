let leibniz_pi delta =
    if delta < 0. then -1
    else if delta = 0. then 0
    else 
        let pi = 4. *. (atan 1.)
        in
        let rec aux (acc : float) (i : int) =
            (*
            print_float acc;
            print_newline();
            *)
            if acc -. pi > 0. && acc -. pi <= delta then i
            else if acc -. pi < 0. && pi -. acc <= delta then i
            else if (i mod 2 = 0) then
                aux (acc +. (4. /. float_of_int (2 * i + 1))) (i + 1)
            else
                aux (acc +. (-4. /. float_of_int (2 * i + 1))) (i + 1)
        in
        aux 0. 0
