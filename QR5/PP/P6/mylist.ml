let hd = function
  | h :: _ -> h
  | [] -> failwith "hd: lista vacía"

let tl = function
  | _ :: t -> t
  | [] -> failwith "tl: lista vacía"

let length lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | _ :: t -> aux (acc + 1) t
  in
  aux 0 lst

let compare_lengths l1 l2 =
  let rec aux lst1 lst2 =
    match (lst1, lst2) with
    | ([], []) -> 0
    | ([], _) -> -1
    | (_, []) -> 1
    | (_ :: t1, _ :: t2) -> aux t1 t2
  in
  aux l1 l2

let compare_length_with lst n =
  let rec aux l m =
    match (l, m) with
    | ([], 0) -> 0
    | ([], _) -> -1
    | (_ :: t, n') when n' > 0 -> aux t (n' - 1)
    | (_, _) -> 1
  in
  aux lst n

let init n f =
  let rec aux acc m =
    if m <= 0 then acc
    else aux (f (m - 1) :: acc) (m - 1)
  in
  aux [] n

let nth lst n =
  let rec aux l m =
    match (l, m) with
    | ([], _) -> failwith "nth: índice fuera de rango"
    | (h :: _, 0) -> h
    | (_ :: t, n') when n' > 0 -> aux t (n' - 1)
    | (_, _) -> failwith "nth: índice negativo"
  in
  aux lst n

let append lst1 lst2 =
  let rec aux l1 l2 =
    match l1 with
    | [] -> l2
    | h :: t -> h :: aux t l2
  in
  aux lst1 lst2

let rev_append lst1 lst2 =
  let rec aux l1 l2 =
    match l1 with
    | [] -> l2
    | h :: t -> aux t (h :: l2)
  in
  aux lst1 lst2

let rev lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h :: t -> aux (h :: acc) t
  in
  aux [] lst

let concat lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h :: t -> aux (append acc h) t
  in
  aux [] lst

let flatten lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h :: t -> aux (append acc h) t
  in
  aux [] lst

let split lst =
  let rec aux acc1 acc2 l =
    match l with
    | [] -> (rev acc1, rev acc2)
    | (x, y) :: t -> aux (x :: acc1) (y :: acc2) t
  in
  aux [] [] lst

let combine lst1 lst2 =
  let rec aux acc l1 l2 =
    match (l1, l2) with
    | ([], []) -> rev acc
    | (h1 :: t1, h2 :: t2) -> aux ((h1, h2) :: acc) t1 t2
    | (_, _) -> failwith "combine: las listas tienen longitudes diferentes"
  in
  aux [] lst1 lst2

let map f lst =
  let rec aux acc l =
    match l with
    | [] -> rev acc
    | h :: t -> aux (f h :: acc) t
  in
  aux [] lst

let map2 f lst1 lst2 =
  let rec aux acc l1 l2 =
    match (l1, l2) with
    | ([], []) -> rev acc
    | (h1 :: t1, h2 :: t2) -> aux (f h1 h2 :: acc) t1 t2
    | (_, _) -> failwith "map2: las listas tienen longitudes diferentes"
  in
  aux [] lst1 lst2

let rev_map f lst =
  let rec aux acc l =
    match l with
    | [] -> rev acc
    | h :: t -> aux (f h :: acc) t
  in
  aux [] lst

let for_all p lst =
  let rec aux l =
    match l with
    | [] -> true
    | h :: t -> p h && aux t
  in
  aux lst

let exists p lst =
  let rec aux l =
    match l with
    | [] -> false
    | h :: t -> p h || aux t
  in
  aux lst

let mem x lst =
  let rec aux l =
    match l with
    | [] -> false
    | h :: t -> x = h || aux t
  in
  aux lst

let find p lst =
  let rec aux l =
    match l with
    | [] -> failwith "find: elemento no encontrado"
    | h :: t -> if p h then h else aux t
  in
  aux lst

let filter p lst =
  let rec aux acc l =
    match l with
    | [] -> rev acc
    | h :: t -> if p h then aux (h :: acc) t else aux acc t
  in
  aux [] lst

let find_all p lst = filter p lst

let partition p lst =
  let rec aux acc1 acc2 l =
    match l with
    | [] -> (rev acc1, rev acc2)
    | h :: t -> if p h then aux (h :: acc1) acc2 t else aux acc1 (h :: acc2) t
  in
  aux [] [] lst

let fold_left f acc lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h :: t -> aux (f acc h) t
  in
  aux acc lst

let fold_right f lst acc =
  let rec aux l acc =
    match l with
    | [] -> acc
    | h :: t -> f h (aux t acc)
  in
  aux (rev lst) acc

let assoc x lst =
  let rec aux l =
    match l with
    | [] -> failwith "assoc: elemento no encontrado"
    | (key, value) :: t -> if x = key then value else aux t
  in
  aux lst

let mem_assoc x lst =
  let rec aux l =
    match l with
    | [] -> false
    | (key, _) :: t -> x = key || aux t
  in
  aux lst

let remove_assoc x lst =
  let rec aux acc l =
    match l with
    | [] -> rev acc
    | (key, value) :: t -> if x = key then aux acc t else aux ((key, value) :: acc) t
  in
  aux [] lst
