let fibonacci n =
    if n < 0 then
        (-1)
    else
        let rec aux a b i =
            if i = 0 then
                a
            else
                aux b (a + b) (i - 1)
        in
        aux 0 1 n
