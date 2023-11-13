let rec rango n =
  if n <= 0 then []
  else n :: rango (n - 1)


let bigl = rango 10000


let insert_t x lst =
  let rec insert_aux a = function
    | [] -> List.rev (x :: a)
    | h::t -> if x <= h then List.rev_append acc (x :: h :: t)
              else insert_aux (h :: a) t
  in insert_aux [] lst


let isort_t lst =
  let rec isort_aux a = function
    | [] -> List.rev a
    | h::t -> isort_aux (insert_t h a) t
  in isort_aux [] lst


let rec rlist n =
  if n <= 0 then []
  else
    let random_value = Random.int 1000 in
    random_value :: rlist (n - 1)
;;

let () = Random.self_init ();;


let lc1 = List.init 10000 (fun x -> x)
let lc2 = List.init 20000 (fun x -> x)

let ld1 = List.init 10000 (fun x -> 9999 - x)
let ld2 = List.init 20000 (fun x -> 19999 - x)

let lr1 = List.init 10000 (fun _ -> Random.int 1000)
let lr2 = List.init 20000 (fun _ -> Random.int 1000)


(*Pruebas para saber si dan el mismo resultado*)
let _ = assert (isort lc1 = isort_t lc1)
let _ = assert (isort lc2 = isort_t lc2)

let _ = assert (isort ld1 = isort_t ld1)
let _ = assert (isort ld2 = isort_t ld2)

let _ = assert (isort lr1 = isort_t lr1)
let _ = assert (isort lr2 = isort_t lr2)


(* Comparando para ver la diferencia de tiempos entre ambas funciones *)
let time_lr2_isort = crono isort lr2
let time_lr2_isort_t = crono isort_t lr2


let rec isort_g cmp lst =
  let rec insert x lst =
    match lst with
    | [] -> [x]
    | h :: t ->
      if cmp x h then x :: h :: t
      else h :: insert x t
  in
  let rec isort_aux a = function
    | [] -> List.rev a
    | h :: t -> isort_aux (insert h a) t
  in
  isort_aux [] lst
;;


(*Pruebas para saber si dan el mismo resultado*)
let _ = assert (msort lc1 = isort lc1)
let _ = assert (msort lc2 = isort lc2)

let _ = assert (msort ld1 = isort ld1)
let _ = assert (msort ld2 = isort ld2)

let _ = assert (msort lr1 = isort lr1)
let _ = assert (msort lr2 = isort lr2)

let rec rango2 n =
  if n <= 0 then []
  else n :: range (n - 1)

let bigl2 = List.rev (range 10000) @ range 10000
