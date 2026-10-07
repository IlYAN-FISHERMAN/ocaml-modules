let my_sleep () = Unix.sleep 1

let () =
    if Array.length Sys.argv = 2 then
        let str = int_of_string_opt Sys.argv.(1) in
        for _ = 1 to Option.value str ~default:0
        do
            my_sleep ()
        done
