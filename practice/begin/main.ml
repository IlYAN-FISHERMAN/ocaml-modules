let cat x y
    = x ^ y

let () =
    let tmp = cat "hello" " world!" in
    print_endline tmp
