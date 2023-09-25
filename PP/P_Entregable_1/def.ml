(*Definición de un valor de tipo int (v) a partir de una expresión con una función predefinida*)
let v = int_of_string "45";;


(*Definición de un valor de tipo float (w) a partir de una expresión con al menos 4 operadores infijos*)
let w = 3.0 +. 2.5 *. 1.2 /. 0.5;;


(*Definición de un valor de tipo char (x) a partir de una expresión que contiene una frase if-then-else*)
let x =
  let cond = true in
  if cond then 'X' else 'Y';;


(*Definición de un valor de tipo bool (y) a partir de una expresión que contiene funciones u operadores*)
let y = (10 > 5) && (not false);;


(*Definición de un valor de tipo string (z) a partir de una expresión que contiene una sub-expresión de tipo int*)
let z = string_of_int (3 * 4);;
