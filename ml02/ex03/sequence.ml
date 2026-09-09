let rec encode l =
    let rec count lst i =
        match lst with
        | [] -> i
        | [_] -> (i + 1)
        | x :: y :: rest when x = y -> count ( y :: rest) (i + 1)
        | _ :: _ :: _ -> i + 1
    in
        let rec jump lst n =
            match lst with
            | _ :: rest when n > 0 -> jump rest (n - 1)
            | _ -> lst
    in
    match l with
    | [] -> []
    | [x] -> ([1, x])
    | x :: _ -> let n = count l 0 in
                   (n, x) :: encode (jump l n)

let convert (x, y) =
    if x = 0 then [y]
    else if x = 1 then ["1"; y]
    else if x = 2 then ["2"; y]
    else ["3"; y]


let rec append l1 l2 =
    match l1 with
    | [] -> l2
    | x :: rest -> x :: append rest l2

let rec decode lst =
    match lst with
    | [] -> []
    | x :: rest ->
            append (convert x) (decode rest)

let rec converte_list_to_string lst =
    match lst with
    | [] -> ""
    | x :: rest ->
            x ^ (converte_list_to_string rest)

let sequence n =
    if n < 0 then "Error"
    else if n = 0 then "Sequence start with 1"
    else
        let rec aux acc i =
            if i >= n then converte_list_to_string acc
            else
                let x = encode acc in let y = decode x in aux y (i + 1)
        in
        aux ["1"] 1
