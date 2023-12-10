#load "bintree.cmo";;

open Bintree;;


let rec is_bst ord tree =
  let values = in_order tree in
  List.for_all2 ord values (List.tl values)


let bfs tree =
  let rec aux queue acc =
    match queue with
    | [] -> List.rev acc
    | Empty :: tl -> aux tl acc
    | Node (value, left, right) :: tl -> aux (tl @ [left; right]) (value :: acc)
  in
  aux [tree] []


let bfs' tree =
  let rec aux queue acc =
    match queue with
    | [] -> List.rev acc
    | Empty :: tl -> aux tl acc
    | Node (value, left, right) :: tl ->
        let new_queue = tl @ [left; right] in
        aux new_queue (value :: acc)
  in
  aux [tree] []


let rec perfecto tree =
  let rec height t =
    match t with
    | Empty -> 0
    | Node (_, left, right) -> 1 + max (height left) (height right)
  in
  let rec node_count t =
    match t with
    | Empty -> 0
    | Node (_, left, right) -> 1 + node_count left + node_count right
  in
  let h = height tree in
  let n = node_count tree in
  n = int_of_float (2. ** float_of_int h) - 1


let casi_completo tree =
  let rec is_last_level count level t =
    match t with
    | Empty -> count = level
    | Node (_, left, right) ->
        is_last_level count (level + 1) left && is_last_level count (level + 1) right
  in
  let rec last_level_count t =
    match t with
    | Empty -> 0
    | Node (_, left, right) ->
        if left = Empty && right = Empty then 1
        else last_level_count left + last_level_count right
  in
  let rec count_levels t =
    match t with
    | Empty -> 0
    | Node (_, left, right) -> 1 + max (count_levels left) (count_levels right)
  in
  let levels = count_levels tree in
  let last_level = levels - 1 in
  is_last_level (last_level_count tree) 0 tree
