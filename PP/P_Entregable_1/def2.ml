(* Función p que calcula el perímetro de una circunferencia *)
let p radio = 2.0 *. (2.0 *. asin 1.0) *. radio;;


(* Función area que calcula el área de un círculo *)
let area radio = (2.0 *. asin 1.0) *. radio *. radio;;


(* Función absf que calcula el valor absoluto de un número *)
let absf x = if x < 0.0 then -.x else x;;


(* Función even que verifica si un número entero es par *)
let even x = x mod 2 = 0;;


(* Función next3 que calcula el menor múltiplo de 3 mayor o igual que un número entero *)
let next3 x = if x mod 3 = 0 then x else x + (3 - (x mod 3));;


(* Función is_a_letter que verifica si un carácter es una letra del alfabeto inglés *)
let is_a_letter letra =
  (letra >= 'a' && letra <= 'z') || (letra >= 'A' && letra <= 'Z');;


(* Redefinición de la función string_of_bool *)
let string_of_bool b =
  if b then "verdadero" else "falso";;
