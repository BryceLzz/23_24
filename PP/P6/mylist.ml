(* mylist.ml *)

let hd = function
  | h :: _ -> h
  | [] -> failwith "hd -> lista vacia"

let tl = function
  | _ :: t -> t
  | [] -> failwith "tl -> lista vacia"

let length lst =
  let rec length_aux acc = function
    | [] -> acc
    | _ :: t -> length_aux (acc + 1) t
  in
  length_aux 0 lst

let compare_lengths l1 l2 =
  let rec compare_lengths_aux l1 l2 =
    match (l1, l2) with
    | ([], []) -> 0
    | ([], _) -> -1
    | (_, []) -> 1
    | (_ :: t1, _ :: t2) -> compare_lengths_aux t1 t2
  in
  compare_lengths_aux l1 l2

let compare_length_with lst n =
  let rec compare_length_with_aux lst n =
    match (lst, n) with
    | ([], 0) -> 0
    | ([], _) -> -1
    | (_ :: t, n') when n' > 0 -> compare_length_with_aux t (n' - 1)
    | (_, _) -> 1
  in
  compare_length_with_aux lst n

let init n f =
  let rec init_aux acc i =
    if i < 0 then acc
    else init_aux (f i :: acc) (i - 1)
  in
  init_aux [] (n - 1)

let nth lst n =
  let rec nth_aux lst n =
    match (lst, n) with
    | ([], _) -> failwith "nth -> indice fuera de rango"
    | (h :: _, 0) -> h
    | (_ :: t, n') when n' > 0 -> nth_aux t (n' - 1)
    | (_, _) -> failwith "nth -> indice negativo"
  in
  nth_aux lst n

let append lst1 lst2 =
  let rec append_aux acc lst =
    match lst with
    | [] -> acc
    | h :: t -> append_aux (h :: acc) t
  in
  append_aux lst2 (rev_append [] lst1)

let rev_append lst1 lst2 =
  let rec rev_append_aux acc lst =
    match lst with
    | [] -> acc
    | h :: t -> rev_append_aux (h :: acc) t
  in
  rev_append_aux lst2 lst1

let rev lst =
  let rec rev_aux acc lst =
    match lst with
    | [] -> acc
    | h :: t -> rev_aux (h :: acc) t
  in
  rev_aux [] lst

let concat lst =
  let rec concat_aux acc lst =
    match lst with
    | [] -> acc
    | h :: t -> concat_aux (append h acc) t
  in
  concat_aux [] (rev lst)

let flatten lst =
  let rec flatten_aux acc lst =
    match lst with
    | [] -> acc
    | h :: t -> flatten_aux (append h acc) t
  in
  flatten_aux [] (rev lst)

let split lst =
  let rec split_aux acc1 acc2 lst =
    match lst with
    | [] -> (rev acc1, rev acc2)
    | (x, y) :: t -> split_aux (x :: acc1) (y :: acc2) t
  in
  split_aux [] [] lst

let combine lst1 lst2 =
  let rec combine_aux acc lst1 lst2 =
    match (lst1, lst2) with
    | ([], []) -> rev acc
    | (h1 :: t1, h2 :: t2) -> combine_aux ((h1, h2) :: acc) t1 t2
    | (_, _) -> failwith "combine -> las listas tienen diferentes longitudes"
  in
  combine_aux [] lst1 lst2

let map f lst =
  let rec map_aux acc lst =
    match lst with
    | [] -> rev acc
    | h :: t -> map_aux (f h :: acc) t
  in
  map_aux [] lst

let map2 f lst1 lst2 =
  let rec map2_aux acc lst1 lst2 =
    match (lst1, lst2) with
    | ([], []) -> rev acc
    | (h1 :: t1, h2 :: t2) -> map2_aux (f h1 h2 :: acc) t1 t2
    | (_, _) -> failwith "map2 -> las listas tienen diferentes longitudes"
  in
  map2_aux [] lst1 lst2

let rev_map f lst =
  let rec rev_map_aux acc lst =
    match lst with
    | [] -> rev acc
    | h :: t -> rev_map_aux (f h :: acc) t
  in
  rev_map_aux [] lst

let for_all p lst =
  let rec for_all_aux p lst =
    match lst with
    | [] -> true
    | h :: t -> p h && for_all_aux p t
  in
  for_all_aux p lst

let exists p lst =
  let rec exists_aux p lst =
    match lst with
    | [] -> false
    | h :: t -> p h || exists_aux p t
  in
  exists_aux p lst

let mem x lst =
  let rec mem_aux x lst =
    match lst with
    | [] -> false
    | h :: t -> x = h || mem_aux x t
  in
  mem_aux x lst

let find p lst =
  let rec find_aux p lst =
    match lst with
    | [] -> failwith "find -> elemento no encontrado"
    | h :: t -> if p h then h else find_aux p t
  in
  find_aux p lst

let filter p lst =
  let rec filter_aux p lst =
    match lst with
    | [] -> rev []
    | h :: t -> if p h then filter_aux p t else filter_aux p t
  in
  filter_aux p lst

let find_all p lst = filter p lst

let partition p lst =
  let rec partition_aux p lst =
    match lst with
    | [] -> (rev [], rev [])
    | h :: t ->
        let (yes, no) = partition_aux p t in
        if p h then (h :: yes, no) else (yes, h :: no)
  in
  partition_aux p lst

let fold_left f acc lst =
  let rec fold_left_aux f acc lst =
    match lst with
    | [] -> acc
    | h :: t -> fold_left_aux f (f acc h) t
  in
  fold_left_aux f acc lst

let fold_right f lst acc =
  let rec fold_right_aux f lst acc =
    match lst with
    | [] -> acc
    | h :: t -> f h (fold_right_aux f t acc)
  in
  fold_right_aux f lst acc

let assoc x lst =
  let rec assoc_aux x lst =
    match lst with
    | [] -> failwith "assoc -> elemento no encontrado"
    | (key, value) :: t -> if x = key then value else assoc_aux x t
  in
  assoc_aux x lst

let mem_assoc x lst =
  let rec mem_assoc_aux x lst =
    match lst with
    | [] -> false
    | (key, _) :: t -> x = key || mem_assoc_aux x t
  in
  mem_assoc_aux x lst

let remove_assoc x lst =
  let rec remove_assoc_aux x lst =
    match lst with
    | [] -> []
    | (key, value) :: t -> if x = key then t else (key, value) :: remove_assoc_aux x t
  in
  remove_assoc_aux x lst
