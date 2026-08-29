let repeat_x nb = 
    if (nb < 0) then
        "Error"
    else
            let rec aux str i = 
                if i < nb then
                    aux (str ^ "x") (i + 1)
                else
                    str
    in
    aux "" 0
