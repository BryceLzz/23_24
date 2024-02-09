(*х - у;;*)
(*Error: el valor de las variables no está establecido.
  En este caso, indica que el valor de x no está establecido por ser la primera
  en la frase*)


let x = 1;;
(*val x : int = 1*)


(*x - У;;*)
(*Error: el valor de la variable y no está establecido*)


let y = 2;;
(*val y : int = 2*)


x - y;;
(*- : int = -1*)


(*let x = y in x - y;;*)
(function x -> x - y) y;;
(*- : int = 0*)


x - y;;
(*- : int = -1*)


(*z;;*)
(*Error: el valor de las variable z no está establecido*)


let z = x + y;;
(*val z : int = 3*)


z;;
(*- : int = 3*)


let x = 5;;
(*val x : int = 5*)


x + y;;
(*- : int = 7*)


z;;
(*- : int = 3*)


(*let y = 5 in x + y;;*)
(function y -> x + y) 5;;
(*- : int = 10*)


x + y;;
(*- : int = 7*)


(*let x = x + y in let y = x * y in x + y + z;;*)
(function x -> (function y -> x + y + z) (x * y)) (x + y);;
(*- : int = 24*)


x + y + z;;
(*- : int = 10*)


function x -> 2 * x;;
(*- : int -> int = <fun>*)


(function x -> 2 * x) (2 + 1);;
(*- : int = 6*)


(function x -> 2 * x) 2 + 1;;
(*- : int = 5*)


let f = function x -> 2 * x;;
(*val f : int -> int = <fun>*)


f;;
(*- : int -> int = <fun>*)


f (2 + 1);;
(*- : int = 6*)


f 2 + 1;;
(*- : int = 5*)

f x;;
(*- : int = 10*)


let x = 100;;
(*val x : int = 100*)


f x;;
(*- : int = 200*)


let m = 1000;;
(*val m : int = 1000*)


let g = function x -> x + m;;
(*val g : int -> int = <fun>*)


g;;
(*- : int -> int = <fun>*)


g 3;;
(*- : int = 1003*)


(*g 3.0;;*)
(* Error de tipo: la función espera un int, no un float*)


let m = 7;;
(*val m : int = 7*)


g 3;;
(*- : int = 1003*)


let istrue = function true -> true;;
(*Advertencia: el patrón no es exhaustivo*)
(*val istrue : bool -> bool = <fun>*)

istrue;;
(*- : bool -> bool = <fun>*)


istrue (1 < 2);; 
(*- : bool = true*)


istrue (2 < 1);; 
(*Exception: Match_failure (//toplevel//, 1, 13).*)


(*istrue 0;;*)
(*Error de tipo: la función espera un bool, no un int*)


let iscero_v1 = function 0 -> true;;
(*Advertencia: el patrón no es exhaustivo*)
(*val iscero_v1 : int -> bool = <fun>*)


iscero_v1 0;;
(*- : bool = true*)


(*iscero_v1 0.;;*)
(* Error de tipo: la función espera un int, no un float*)


iscero_v1 1;;
(*Exception: Match_failure (//toplevel//, 1, 16).*)


let iscero_v2 = function 0 -> true | _ -> false;;
(*val iscero_v2 : int -> bool = <fun>*)


iscero_v2 0;;
(*- : bool = true*)


iscero_v2 1;;
(*- : bool = false*)


(*iscero_v2 0.;;*)
(* Error de tipo: la función espera un int, no un float*)


let all_to_true = function true -> true | false -> true;;
(*val all_to_true : bool -> bool = <fun>*)


all_to_true (1 < 2);;
(*- : bool = true*)


all_to_true (2 < 1);;
(*- : bool = true*)


(*all_to_true 0;;*)
(*Error de tipo: la función espera un bool, no un int*)


let first_all_to_true = all_to_true;;
(*val first_all_to_true : bool -> bool = <fun>*)


let all_to_true = function x -> true;;
(*val all_to_true : 'a -> bool = <fun>*)


all_to_true (1 < 2);; 
(*- : bool = true*)


all_to_true (2 < 1);;
(*- : bool = true*)


all_to_true 0;;
(*- : bool = true*)


(*first_all_to_true 0;;*)
(*Error de tipo: la función espera un bool, no un int*)
