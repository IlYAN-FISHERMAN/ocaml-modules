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
