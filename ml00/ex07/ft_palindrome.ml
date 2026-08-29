let ft_palindrome (str : string) =
    if (String.length str = 0) then
        false
    else
        let rec aux i j =
            if String.get str i = String.get str j
            then
                if (i = j) || ((i + 1) = j) then
                    true
                else
                    aux (i + 1) (j - 1)
            else
                false
        in
        aux 0 ((String.length str) - 1)
