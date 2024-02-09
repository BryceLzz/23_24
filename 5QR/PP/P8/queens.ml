type position = int * int

let is_safe pos queens =
  let safe_from_queen queen =
    let (row, col) = queen in
    let (row', col') = pos in
    row <> row' && col <> col' && abs (row - row') <> abs (col - col')
  in
  List.for_all safe_from_queen queens

let rec place_queen row queens n =
  if row > n then [queens]
  else
    List.fold_left
      (fun acc col ->
        let pos = (row, col) in
        if is_safe pos queens then
          acc @ place_queen (row + 1) (pos :: queens) n
        else acc)
      [] (List.init n (fun x -> x + 1))

let queens n =
  let rec place_queen row queens =
    if row > n then [queens]
    else
      List.fold_left
        (fun acc col ->
          let pos = (row, col) in
          if is_safe pos queens then
            acc @ place_queen (row + 1) (pos :: queens)
          else acc)
        [] (List.init n (fun x -> x + 1))
  in
  place_queen 1 []

let is_queens_sol n sol =
  List.length sol = n &&
  List.for_all (fun (row, col) -> row > 0 && row <= n && col > 0 && col <= n) sol &&
  List.length (List.sort_uniq compare sol) = n &&
  let rec is_safe_list queens =
    match queens with
    | [] -> true
    | pos :: rest -> is_safe pos rest && is_safe_list rest
  in
  is_safe_list sol
