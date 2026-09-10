type phosphate    =  string
type deoxyribose  =  string

type nucleobase = A | T | C | G | None

type nucleotide = {
    phosphate : phosphate;
    deoxyribose : deoxyribose;
    nucleobase : nucleobase;
}

type helix = nucleotide list


let generate_nucleotide c =
    {
        phosphate =  "phosphate";
        deoxyribose = "deoxyribose";
        nucleobase = (
            match c with
            | 'A' -> A
            | 'T' -> T
            | 'C' -> C
            | 'G' -> G
            | _ -> None)
    }

let rec complementary_helix hl =
    match hl with
    | [] -> []
    | x :: rest ->
            generate_nucleotide
            (match x.nucleobase with
            | A -> 'T'
            | T -> 'A'
            | C -> 'G'
            | G -> 'C'
            | None -> '?') :: (complementary_helix rest)


let rec helix_to_string hl = 
    match hl with
    | [] -> ""
    | x :: rest ->
            (match x.nucleobase with
            | A -> "A"
            | T -> "T"
            | C -> "C"
            | G -> "G"
            | None -> "?") ^ (helix_to_string rest)

let generate_helix n =
    let rec aux lst i =
        if i > n then lst
        else
            let c = 
                match (Random.int 4) with
                | 0 -> 'A'
                | 1 -> 'T'
                | 2 -> 'C'
                | _ -> 'G' in
            aux ((generate_nucleotide c) :: lst) (i + 1)
    in
    aux [] 1
