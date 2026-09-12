module Color = struct
    type t = Spade | Heart | Diamond | Club
    let all : t list = [Spade; Heart; Diamond; Club]

    let toString color =
        match color with
        | Spade -> "S"
        | Heart -> "H"
        | Diamond -> "D"
        | Club -> "C"

    let toStringVerbose color =
        match color with
        | Spade -> "Spade"
        | Heart -> "Heart"
        | Diamond -> "Diamond"
        | Club -> "Club"
end


module Value = struct

type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As
let all : t list = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

let toInt value  =
    match value with
    | T2 -> 1
    | T3 -> 2
    | T4 -> 3
    | T5 -> 4
    | T6 -> 5
    | T7 -> 6
    | T8 -> 7
    | T9 -> 8
    | T10 -> 9
    | Jack -> 10
    | Queen -> 11
    | King -> 12
    | As -> 13

let toString value =
    match value with
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "J"
    | Queen -> "Q"
    | King -> "K"
    | As -> "A"

let toStringVerbose value =
    match value with
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "Jack"
    | Queen -> "Queen"
    | King -> "King"
    | As -> "As"

let next value =
    match value with
    | T2 -> T3
    | T3 -> T4
    | T4 -> T5
    | T5 -> T6
    | T6 -> T7
    | T7 -> T8
    | T8 -> T9
    | T9 -> T10
    | T10 -> Jack
    | Jack -> Queen
    | Queen -> King
    | King -> As
    | As -> invalid_arg "Value.next: As has no successor"

let previous value =
    match value with
    | T2 -> invalid_arg "Value.previous: T2 has no predecessor"
    | T3 -> T2
    | T4 -> T3
    | T5 -> T4
    | T6 -> T5
    | T7 -> T6
    | T8 -> T7
    | T9 -> T8
    | T10 -> T9
    | Jack -> T10
    | Queen -> Jack
    | King -> Queen
    | As -> King
end

type t = {
    color : Color.t;
    value : Value.t;
}

let newCard value color = {color; value}

let getColor card = card.color

let getValue card = card.value

let compare card1 card2 =
    if Value.toInt card1.value < Value.toInt card2.value then -1
    else if Value.toInt card1.value = Value.toInt card2.value then 0
    else 1

let max card1 card2 =
    if compare card1 card2 < 0 then card2
    else card1

let min card1 card2 =
    if compare card1 card2 <= 0 then card1
    else card2

let isOf card color = (card.color = color)

let isSpade card = isOf card Color.Spade

let isHeart card = isOf card Color.Heart

let isDiamond card = isOf card Color.Diamond
 
let isClub card = isOf card Color.Club

let toString card = (Value.toString card.value) ^ (Color.toString card.color)

let toStringVerbose card = 
    "Card(" ^ (Value.toStringVerbose card.value) ^ ", " ^ (Color.toStringVerbose card.color) ^ ")"

let print cards =
    List.iter (fun x -> print_endline (toString x)) cards

let printVerbose cards =
    List.iter (fun x -> print_endline (toStringVerbose x)) cards

let allOfColor color = List.map (fun x -> newCard x color) Value.all

let allHearts = allOfColor Color.Heart

let allDiamonds = allOfColor Color.Diamond

let allClubs = allOfColor Color.Club

let allSpades = allOfColor Color.Spade

let all = allSpades @ allHearts @ allDiamonds @ allClubs

let best cards =
    match cards with
    | [] -> invalid_arg "Card.best: Empty list"
    | x :: rest -> List.fold_left max x rest
