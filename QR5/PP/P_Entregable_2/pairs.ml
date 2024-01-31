(* next *)

let next (x, y) =
  if (x + y) mod 2 = 0 then
    if y = 0 then (x + 1, 0)
    else (x - 1, y + 1)
  else
    if x = 0 then (0, y + 1)
    else (x + 1, y - 1)
;;


(* steps_from *)

let rec steps_from (x, y) n =
  if n = 0 then (x, y)
  else steps_from (next (x, y)) (n - 1)
;;


(* pair *)

let pair n =
  steps_from (0, 0) n
;;
