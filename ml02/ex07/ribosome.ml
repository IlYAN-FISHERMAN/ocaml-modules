type phosphate    =  string
type deoxyribose  =  string

type nucleobase = A | T | C | G | U | None

type nucleotide = {
    phosphate : phosphate;
    deoxyribose : deoxyribose;
    nucleobase : nucleobase;
}

type helix = nucleotide list

type rna = nucleobase list

type aminoacid = Stop | Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly
               | His | Ile | Leu | Lys | Met | Phe | Pro | Ser | Thr
               | Trp | Tyr | Val

type proteine = aminoacid list

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
            | U -> '?'
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
            | U -> "U"
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

let rec rna_to_string (rn : rna) = 
    match rn with
    | [] -> ""
    | x :: rest ->
            (match x with
            | A -> "A"
            | T -> "T"
            | C -> "C"
            | G -> "G"
            | U -> "U"
            | None -> "?") ^ (rna_to_string rest)

let rec generate_rna hel =
    match hel with
    | [] -> []
    | x :: rest ->
            (match x.nucleobase with
            | A -> U
            | T -> A
            | C -> G
            | G -> C
            | U -> U
            | None -> None) :: (generate_rna rest)


let rec generate_bases_triplets rna = 
    match rna with
    | a :: b :: c :: rest -> (a, b, c) :: generate_bases_triplets rest
    | _ -> []

let rec string_of_protein acid = 
    match acid with
    | [] -> ""
    | x :: rest ->
            "[" ^ (match x with
            | Ala -> "Ala"
            | Arg -> "Arg"
            | Asn -> "Asn"
            | Asp -> "Asp"
            | Cys -> "Cys"
            | Gln -> "Gln"
            | Glu -> "Glu"
            | Gly -> "Gly"
            | His -> "His"
            | Ile -> "Ile"
            | Leu -> "Leu"
            | Lys -> "Lys"
            | Met -> "Met"
            | Phe -> "Phe"
            | Pro -> "Pro"
            | Ser -> "Ser"
            | Thr -> "Thr"
            | Trp -> "Trp"
            | Tyr -> "Tyr"
            | Val -> "Val"
            | Stop -> "Stop") ^ "] " ^ (string_of_protein rest)

let decode_arn rna =
    let rec aux prot =
        match prot with
        | [] -> []
        | x :: rest ->
                let tmp =
                (match x with
                | (U, A, A) | (U, A, G) | (U, G, A) -> Stop
                | (G, C, A) | (G, C, C) | (G, C, G) | (G,C,U) -> Ala
                | (A,G,A) | (A,G,G) | (C,G,A) | (C,G,C) | (C,G,G) | (C,G,U) -> Arg
                | (A,A,C) | (A,A,U) -> Asn
                | (G,A,C) | (G,A,U) -> Asp
                | (U,G,C) | (U,G,U) -> Cys
                | (C,A,A) | (C,A,G) -> Gln
                | (G,A,A) | (G,A,G) -> Glu
                | (G,G,A) | (G,G,C) | (G,G,G) | (G,G,U) -> Gly
                | (C,A,C) | (C,A,U) -> His
                | (A,U,A) | (A,U,C) | (A,U,U) -> Ile
                | (C,U,A) | (C,U,C) | (C,U,G) | (C,U,U) | (U,U,A) | (U,U,G) -> Leu
                | (A,A,A) | (A,A,G) -> Lys
                | (A,U,G) -> Met
                | (U,U,C) | (U,U,U) -> Phe
                | (C,C,C) | (C,C,A) | (C,C,G) | (C,C,U) -> Pro
                | (U,C,A) | (U,C,C) | (U,C,G) | (U,C,U) | (A,G,U) | (A,G,C) -> Ser
                | (A,C,A) | (A,C,C) | (A,C,G) | (A,C,U) -> Thr
                | (U,G,G) -> Trp
                | (U,A,C) | (U,A,U) -> Tyr
                | (G,U,A) | (G,U,C) | (G,U,G) | (G,U,U) -> Val
                | _ -> Stop)
                in
                if tmp = Stop then []
                else
                    tmp :: (aux rest)
    in
    aux (generate_bases_triplets rna) 
