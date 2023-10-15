(*val sumto : int -> int*)
let rec sumto n =
if n <= 0 then 0
  else n + sumto (n - 1);;


(*val exp10 : int -> int*)
let rec exp10 n =
  if n = 0 then 1
  else 10 * exp10 (n - 1);;


(*val num_cifras : int -> int*)
(*Versión no óptima*)
let rec num_cifras n =
  if n < 0 then num_cifras (-n)
  else if n < 10 then 1
  else 1 + num_cifras (n / 10);;


(*Versión óptima*)
let rec num_cifras n = (*n >= 0*)
  if n < 10 then 1
  else 1 + num_cifras (n / 10);;
  
let num_cifras n = 
  num_cifras (abs n);;
  

(*val sum_cifras : int -> int*)
(*Versión no óptima*)
let rec sum_cifras n =
  if n < 0 then sum_cifras (-n)
  else if n < 10 then n
  else (n mod 10) + sum_cifras (n / 10);;
  
  
(*Versión óptima*)
let rec sum_cifras n = (*n >= 0*)
  if n < 10 then n
  else (n mod 10) + sum_cifras (n / 10);;
  
let sum_cifras n = 
  sum_cifras (abs n);;
