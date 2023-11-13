let g1 n =
  match n mod 2 with
  | 0 when n >= 0 -> true
  | -1 -> true
  | _ -> false;;



let g2 n =
  let is_positive = n >= 0 in
  let is_even = n mod 2 = 0 in
  let is_minus_one = n mod 2 = -1 in
  (is_positive && is_even) || is_minus_one;;
