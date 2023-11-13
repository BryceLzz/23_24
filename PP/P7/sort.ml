let rec insert x = function
[] -> [x]
| h::t -> if x <= h then x :: h :: t
else h :: insert x t
;;

let rec isort = function
[] -> []
| h::t -> insert h (isort t)
;;

let rec rango n =
  if n <= 0 then []
  else n :: rango (n - 1)
;;

let bigl = rango 10000
;;

let insert_t x lst =
  let rec insert_aux a = function
    | [] -> List.rev (x :: a)
    | h::t -> if x <= h then List.rev_append a (x :: h :: t)
              else insert_aux (h :: a) t
  in insert_aux [] lst
;;

let isort_t lst =
  let rec isort_aux a = function
    | [] -> a
    | h::t -> isort_aux (insert_t h a) t
  in isort_aux [] lst
;;

let rec rlist n =
  if n <= 0 then []
  else
    let random_value = Random.int 1000 in
    random_value :: rlist (n - 1)
;;

let () = Random.self_init ()
;;

let lc1 = List.init 10000 (fun x -> x)
let lc2 = List.init 20000 (fun x -> x)
;;
let ld1 = List.init 10000 (fun x -> 9999 - x)
let ld2 = List.init 20000 (fun x -> 19999 - x)
;;
let lr1 = List.init 10000 (fun _ -> Random.int 1000)
let lr2 = List.init 20000 (fun _ -> Random.int 1000)
;;

(*Pruebas para saber si dan el mismo resultado*)
let _ = assert (isort lc1 = isort_t lc1)
let _ = assert (isort lc2 = isort_t lc2)
;;
let _ = assert (isort ld1 = isort_t ld1)
let _ = assert (isort ld2 = isort_t ld2)
;;
let _ = assert (isort lr1 = isort_t lr1)
let _ = assert (isort lr2 = isort_t lr2)
;;

let crono f x =
let t = Sys.time () in
let _ = f x in
Sys.time () -. t
;;

(* Comparando para ver la diferencia de tiempos entre ambas funciones *)
let time_lr2_isort = crono isort lr2
let time_lr2_isort_t = crono isort_t lr2
;;

let rec isort_g cmp lst =
  let rec insert x lst =
    match lst with
    | [] -> [x]
    | h :: t ->
      if cmp x h then x :: h :: t
      else h :: insert x t
  in
  let rec isort_aux a = function
    | [] -> a
    | h :: t -> isort_aux (insert h a) t
  in
  isort_aux [] lst
;;


let rec split l = match l with
h1::h2::t -> let t1, t2 = split t
in h1::t1, h2::t2
| _ -> l, []
;;

let rec merge (l1,l2) = match l1, l2 with
[], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
else h2 :: merge (l1, t2)
;;

let rec msort l = match l with
[] | [_] -> l
| _ -> let l1, l2 = split l
in merge (msort l1, msort l2)
;;

(*Pruebas para saber si dan el mismo resultado*)
let _ = assert (msort lc1 = isort lc1)
let _ = assert (msort lc2 = isort lc2)
;;
let _ = assert (msort ld1 = isort ld1)
let _ = assert (msort ld2 = isort ld2)
;;
let _ = assert (msort lr1 = isort lr1)
let _ = assert (msort lr2 = isort lr2)
;;

let rec rango2 n =
  if n <= 0 then []
  else n :: rango2 (n - 1)
;;
let bigl2 = List.rev (rango2 10000) @ rango2 10000
;;

let split_t lst =
  let rec split_aux a1 a2 = function
    | [] -> (List.rev a1, List.rev a2)
    | h1::h2::t -> split_aux (h1::a1) (h2::a2) t
    | [x] -> (List.rev (x::a1), List.rev a2)
  in
  split_aux [] [] lst
;;

let merge_t (l1, l2) =
  let rec merge_aux a l1 l2 =
    match l1, l2 with
    | [], l | l, [] -> List.rev_append a l
    | h1::t1, h2::t2 ->
      if h1 <= h2 then merge_aux (h1::a) t1 l2
      else merge_aux (h2::a) l1 t2
  in
  merge_aux [] l1 l2
;;

let rec msort' lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let l1, l2 = split_t lst in
    merge_t (msort' l1, msort' l2)
;;

let bigl3 = List.init 1000000 (fun x -> x)
;;


let time_msort' lst = crono msort' lst
;;
let time_lc1_msort' = time_msort' lc1
let time_lc2_msort' = time_msort' lc2
let time_ld1_msort' = time_msort' ld1
let time_ld2_msort' = time_msort' ld2
let time_lr1_msort' = time_msort' lr1
let time_lr2_msort' = time_msort' lr2
;;

let time_lr1_msort = crono msort lr1
let time_lr1_msort' = crono msort' lr1
;;
let time_lr2_msort = crono msort lr2
let time_lr2_msort' = crono msort' lr2
;;


let rec msort_g cmp lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let l1, l2 = split_t lst in
    merge_t (msort_g cmp l1, msort_g cmp l2)
;;
