let sum x y = x +. y

let () = 
    let nb = sum 17.42 42.58 in
    print_string "nb = 17.42 + 42.58 = ";
    print_float nb;
    print_newline();

    let add = sum nb nb in
    print_string "nb + nb = ";
    print_float add;
    print_newline();

    let max = sum max_float max_float in
    print_string "max_float + max_float = ";
    print_float max;
    print_newline();

    let min = sum (min_float -. max_float) (min_float) in
    print_string "(min_float -. max_float) + (min_float) = ";
    print_float min;
    print_newline();

    let t = sum (-10.) 10. in
    print_string "-10. + 10. = ";
    print_float t;
    print_newline();

    let r = sum 1e16 1. in
    print_string "1e16 + 1. = ";
    print_float r;
    print_newline();

    let b = sum 0.1 0.2 in
    Printf.printf "0.1 + 0.2 is different than 0.3, first = %.17g, second = %.17g" b 0.3;
    print_newline();

    let c = sum infinity neg_infinity in
    print_string "infinity + neg_infinity = ";
    print_float c;
    print_newline()
