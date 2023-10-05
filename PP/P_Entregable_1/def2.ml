(*val p : float -> float*)
let p radio = 2.0 *. (2.0 *. asin 1.0) *. radio;;


(*val area : float -> float*)
let area radio = (2.0 *. asin 1.0) *. radio *. radio;;


(*val absf : float -> float*)
let absf x = if x < 0.0 then -.x else x;;


(*val even : int -> bool*)
let even x = x mod 2 = 0;;


(*val next3 : int -> int*)
let next3 x = if x mod 3 = 0 then x else x + (3 - (x mod 3));;


(*val is_a_letter : char -> bool*)
let is_a_letter letra =
  (letra >= 'a' && letra <= 'z') || (letra >= 'A' && letra <= 'Z');;


(*val string_of_bool : bool -> string*)
let string_of_bool b =
  if b then "verdadero" else "falso";;
