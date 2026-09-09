let rec print print_elem lst = 
    match lst with
    | [] -> ();
    | x :: rest ->
        print_elem x;
        print_string " ";
        print print_elem rest

let rec addPrefixe p lst = 
    match lst with
    | [] -> lst
    | x :: rest ->
          ((p ^ x) :: addPrefixe p rest)

let rec rev lst acc =
    match lst with
    | [] -> acc
    | x :: rest ->
            rev rest (x :: acc)

let rec append l1 l2 =
    match l1 with
    | [] -> l2
    | x :: rest -> x :: append rest l2

let gray n =
    if n < 0 then
        print_endline "Error"
    else if n = 0 then
        print_endline "0"
    else
        let rec aux acc i =
            if i >= n then print print_string acc
            else
                let added = addPrefixe "0" acc in
                let tmp = addPrefixe "1" (rev acc []) in
                aux (append added tmp) (i + 1)
        in
        aux ["0"; "1"] 1;
        print_newline()
