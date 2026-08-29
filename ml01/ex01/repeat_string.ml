let repeat_string ?(str = "x") nb = 
    if (nb < 0) then "Error"
    else
        let rec aux acc i =
            if i >= nb then acc
            else aux (acc ^ str) (i + 1)
        in
        aux "" 0
