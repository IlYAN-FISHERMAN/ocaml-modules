let rec crossover l1 l2 =
    let rec contains a lst =
        match lst with
        | [] -> false
        | x :: _ when x = a -> true
        | _ :: rest -> contains a rest
    in
    match l1 with
    | [] -> []
    | x :: rest when contains x l2 -> x :: crossover rest l2
    | _ :: rest -> crossover rest l2
