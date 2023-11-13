(* reverse *)

let rec reverse n =
  let rec invertir_aux n acc =
    if n = 0 then acc
    else invertir_aux (n / 10) (acc * 10 + n mod 10)
  in
  invertir_aux n 0
;;


(* palindromo *)

let rec palindromo s =
  let len = String.length s in
  if len <= 1 then true
  else
    s.[0] = s.[len - 1] && palindromo (String.sub s 1 (len - 2))
;;


(* mcd *)

let rec mcd (x, y) =
  if y = 0 then x
  else mcd (y, x mod y)
;;
