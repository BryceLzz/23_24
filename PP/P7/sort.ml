let rec insert_t x lst =
  let rec insert_aux a = function
    | [] -> List.rev (x :: a)
    | h::t -> if x <= h then List.rev_append a (x :: h :: t)
              else insert_aux (h :: a) t
  in insert_aux [] lst

let rec isort_t lst =
  let rec isort_aux a = function
    | [] -> a
    | h::t -> isort_aux (insert_t h a) t
  in isort_aux [] lst

let rec rlist n =
  if n <= 0 then []
  else
    let random_value = Random.int 1000 in
    random_value :: rlist (n - 1)

let lc1 = List.init 10000 (fun x -> x)
let lc2 = List.init 20000 (fun x -> x)

let ld1 = List.init 10000 (fun x -> 9999 - x)
let ld2 = List.init 20000 (fun x -> 19999 - x)

let lr1 = List.init 10000 (fun _ -> Random.int 1000)
let lr2 = List.init 20000 (fun _ -> Random.int 1000)

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

let bigl2 = List.rev_append (List.init 10000 (fun x -> x)) (List.init 10000 (fun x -> x))

let rec split_t lst =
  let rec split_aux a1 a2 = function
    | [] -> (List.rev a1, List.rev a2)
    | h1::h2::t -> split_aux (h1::a1) (h2::a2) t
    | [x] -> (List.rev (x::a1), List.rev a2)
  in
  split_aux [] [] lst

let rec merge_t (l1, l2) =
  let rec merge_aux a l1 l2 =
    match l1, l2 with
    | [], l | l, [] -> List.rev_append a l
    | h1::t1, h2::t2 ->
      if h1 <= h2 then merge_aux (h1::a) t1 l2
      else merge_aux (h2::a) l1 t2
  in
  merge_aux [] l1 l2

let rec msort' lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let l1, l2 = split_t lst in
    merge_t (msort' l1, msort' l2)

let bigl3 = List.init 1000000 (fun x -> x)

let rec msort_g cmp lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let l1, l2 = split_t lst in
    merge_t (msort_g cmp l1, msort_g cmp l2)
