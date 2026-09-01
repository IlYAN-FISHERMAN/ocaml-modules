let rec converges (f : 'a -> 'a) (x : 'a) (n : int) =
    if n < 0 then
        false
    else if x = f x then
        true
    else if n = 0 then
        false
    else
        converges f (f x) (n - 1)
