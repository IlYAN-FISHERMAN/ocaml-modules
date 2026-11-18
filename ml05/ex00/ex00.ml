module StringSet = Set.Make(String)

let () =
    (*
    let set = List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty in
    StringSet.iter print_endline set;
    print_endline (StringSet.fold ( ^ ) set "");
    print_newline ();
    *)

    let first = StringSet.add "hello" StringSet.empty in
    print_int (StringSet.cardinal first);
    print_newline();
    let second = StringSet.add "hello 2" first in
    print_int (StringSet.cardinal first);
    print_newline();
    StringSet.iter print_endline second;

    print_newline();
    print_newline();

    print_endline "hash: ";

    let ht = Hashtbl.create 10 in
    print_int (Hashtbl.length ht);
    print_newline();

    Hashtbl.add ht "lol" "eheh";
    print_int (Hashtbl.length ht);
    print_newline();
