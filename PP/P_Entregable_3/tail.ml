let to0from n =
  let rec aux acc n =
    if n < 0 then acc
    else aux (n :: acc) (n - 1)
  in
  aux [] n

let fromto m n =
  let rec aux acc m n =
    if m > n then acc
    else aux (m :: acc) (m + 1) n
  in
  aux [] m n

let remove x lst =
  let rec aux acc = function
    | [] -> List.rev acc
    | h :: t -> if x = h then List.rev_append acc t
                else aux (h :: acc) t
  in
  aux [] lst

let compress lst =
  let rec aux acc = function
    | h1 :: h2 :: t when h1 = h2 -> aux acc (h2 :: t)
    | h :: t -> aux (h :: acc) t
    | l -> List.rev acc
  in
  aux [] lst

let append' = List.append
let map' = List.map
let fold_right' = List.fold_right

let incseg lst =
  List.fold_right (fun x t -> List.rev_append (List.map ((+) x) t) (x :: t)) lst []
