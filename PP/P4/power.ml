(* power *)

let rec power x y =
  if y = 0 then 1
  else x * power x (y - 1)
;;


(* power' *)

let rec power' x y =
  if y = 0 then 1
  else if y mod 2 = 0 then
    let n = power' x (y / 2) in
    n * n
  else
    x * power' x (y - 1)
;;

(* power' es mejor que power porque no recalcula varias veces las mismas potencias de x ya que emplea la mitad de y *)



(* powerf *)

let rec powerf x n =
  if n = 0 then 1.0
  else x *. powerf x (n - 1)
;;