(* min_weight.ml *)
open List

exception Invalid_argument of string

type point = int * int

let rec is_valid_coord m n (i, j) =
  i >= 0 && i < m && j >= 0 && j < n

let rec has_duplicates lst =
  let rec aux seen = function
    | [] -> false
    | x :: xs -> if mem x seen then true else aux (x :: seen) xs
  in
  aux [] lst

let valid_path m n ini fin path =
  let rec is_valid_path = function
    | [] -> true
    | [p] -> p = fin
    | p1 :: p2 :: ps ->
        is_valid_coord m n p1
        && is_valid_coord m n p2
        && (fst p1 = fst p2 || snd p1 = snd p2)
        && is_valid_path (p2 :: ps)
  in
  is_valid_coord m n ini
  && is_valid_coord m n fin
  && path <> []
  && hd path = ini
  && last path = fin
  && not (has_duplicates path)
  && is_valid_path path

let path_weight v path =
  let rec calculate_weight = function
    | [] -> 0
    | (i, j) :: ps -> v.(i).(j) + calculate_weight ps
  in
  calculate_weight path

let min_weight_path v ini fin =
  let m = Array.length v in
  let n = Array.length v.(0) in
  if m = 0 || n = 0 || exists (fun row -> exists (fun x -> x <= 0) row) v
  then raise (Invalid_argument "min_weight_path")
  else
    let rec explore current_path min_weight =
      let current_weight = path_weight v current_path in
      if current_path = [] || current_path = [ini] then
        if current_path = [] then raise (Invalid_argument "min_weight_path")
        else [ini]
      else if current_path = [fin] && current_weight < min_weight then
        current_path
      else if current_weight >= min_weight then []
      else
        let (i, j) = hd current_path in
        let neighbors =
          [(i, j + 1); (i, j - 1); (i + 1, j); (i - 1, j)]
          |> filter (is_valid_coord m n)
          |> filter (fun p -> not (mem p current_path))
        in
        let candidate_paths =
          map (fun neighbor -> explore (neighbor :: current_path) min_weight) neighbors
        in
        let valid_candidates = filter (fun p -> p <> []) candidate_paths in
        if valid_candidates = [] then []
        else min valid_candidates ~compare:(fun p1 p2 ->
          compare (path_weight v p1) (path_weight v p2)
        )
    in
    let result = explore [fin] max_int in
    if result = [] then raise (Invalid_argument "min_weight_path") else result
