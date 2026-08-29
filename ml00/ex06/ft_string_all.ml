let ft_string_all (f : char -> bool) (str : string) =
    let rec aux i =
        if i < String.length str
        then begin
            if (f (String.get str i) = false)
            then false
            else
                aux (i + 1);
        end
        else
            true
    in
    aux 0
