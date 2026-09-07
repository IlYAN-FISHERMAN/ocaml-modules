let rec encode l =
    match l with
    | [] -> []
    | [x] -> x
    | x :: y :: rest ->
        begin
            let rec aux prev next acc i =
                if prev = next && List.length acc >= 2 then
                        aux next (List.hd acc) acc (i + 1)
                else
            in
            aux x y rest 0
        end

