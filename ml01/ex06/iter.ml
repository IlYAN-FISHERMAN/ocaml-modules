let rec iter f x n =
    if n < 0 then
        (-1)
    else if n = 0 then x
    else
        iter f (f x) (n - 1)
