type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree


let rec in_order tree =
  match tree with
  | Empty -> []
  | Node (value, left, right) -> in_order left @ [value] @ in_order right


let rec insert ord tree x =
  match tree with
  | Empty -> Node (x, Empty, Empty)
  | Node (value, left, right) ->
      if ord x value then Node (value, insert ord left x, right)
      else Node (value, left, insert ord right x)


let bst ord l =
  List.fold_left (fun acc x -> insert ord acc x) Empty l


let rec qsort ord lst =
  match lst with
  | [] -> []
  | pivot :: rest ->
      let smaller, larger = List.partition (fun x -> ord x pivot) rest in
      qsort ord larger @ [pivot] @ qsort ord smaller

