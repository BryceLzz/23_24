(* Definición de is_prime *)
let is_prime n =
  let rec check_from i =
    i >= n || (n mod i <> 0 && check_from (i + 1))
  in
  check_from 2;;


(* Función para encontrar el siguiente número primo mayor que n *)
let rec next_prime n =
  if is_prime n then n else next_prime (n + 1);;


(* Función para encontrar el último número primo menor o igual que n *)
let rec previous_prime_to n =
  if is_prime n then n else previous_prime_to (n - 1);;


(* Función is_prime2 más eficiente *)
let is_prime2 n =
  let rec check_from i =
    i * i > n || (n mod i <> 0 && check_from (i + 1))
  in
  n > 1 && check_from 2;;
