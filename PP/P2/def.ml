(*val v : int*)
let v = int_of_string "45";;


(*val w : float*)
let w = 3.0 +. 2.5 *. 1.2 /. 0.5;;


(*val x : char*)
let x =
  let cond = true in
  if cond then 'X' else 'Y';;


(*val y : bool*)
let y = (10 > 5) && (not false);;


(*val z : string*)
let z = string_of_int (3 * 4);;
