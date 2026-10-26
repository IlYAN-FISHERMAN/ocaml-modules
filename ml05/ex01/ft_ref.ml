type 'a ft_ref = {
    mutable contents : 'a;
}

let return contents = {contents}

let get x = x.contents

let set x y = x.contents <- y

let bind x (f : 'a -> 'b ft_ref) = f (get x)

let () =
    let str = return "hello guys" in
    print_endline ("str first: " ^ (get str));
    let first = str in
    let tmp = get str in
    set str "Hello World!";
    let other = bind str (fun x -> return (String.length x)) in
    print_string "other: ";
    print_int (get other);
    print_newline();
    
    print_endline ("str: " ^ (get str));
    print_endline ("tmp: " ^ tmp);
    print_endline ("first (should be Hello World): " ^ (get first))
