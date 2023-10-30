let rec hd = function
  | h :: _ -> h
  | [] -> failwith "hd -> lista vacía"


let tl = function
  | _ :: t -> t
  | [] -> failwith "tl -> lista vacía"


let rec length lista =
  match lista with
  | [] -> 0
  | _ :: t -> 1 + length t


let rec compare_lengths l1 l2 =
  match (l1, l2) with
  | ([], []) -> 0
  | ([], _) -> -1
  | (_, []) -> 1
  | (_ :: t1, _ :: t2) -> compare_lengths t1 t2


let rec compare_length_with lista n =
  match (lista, n) with
  | ([], 0) -> 0
  | ([], _) -> -1
  | (_ :: t, n') when n' > 0 -> compare_length_with t (n' - 1)
  | (_, _) -> 1


let rec init n f =
  if n <= 0 then []
  else f (n - 1) :: init (n - 1) f


let rec nth lst n =
  match (lst, n) with
  | ([], _) -> failwith "nth -> indice fuera del rango"
  | (h :: _, 0) -> h
  | (_ :: t, n') when n' > 0 -> nth t (n' - 1)
  | (_, _) -> failwith "nth -> indice negativo"


let rec append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | h :: t -> h :: append t lst2


let rec rev_append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | h :: t -> rev_append t (h :: lst2)


let rec rev lst =
  match lst with
  | [] -> []
  | h :: t -> rev_append t [h]


let rec concat lst =
  match lst with
  | [] -> []
  | h :: t -> append h (concat t)


let rec flatten lst =
  match lst with
  | [] -> []
  | h :: t -> append h (flatten t)


let rec split lst =
  match lst with
  | [] -> ([], [])
  | (x, y) :: t ->
      let xs, ys = split t in
      (x :: xs, y :: ys)


let rec combine lst1 lst2 =
  match (lst1, lst2) with
  | ([], []) -> []
  | (h1 :: t1, h2 :: t2) -> (h1, h2) :: combine t1 t2
  | (_, _) -> failwith "combine -> las listas tienen distintas longitudes"


let rec map f lst =
  match lst with
  | [] -> []
  | h :: t -> f h :: map f t


let rec map2 f lst1 lst2 =
  match (lst1, lst2) with
  | ([], []) -> []
  | (h1 :: t1, h2 :: t2) -> f h1 h2 :: map2 f t1 t2
  | (_, _) -> failwith "map2 -> las listas tienen distintas longitudes"


let rec rev_map f lst =
  match lst with
  | [] -> []
  | h :: t -> rev_append (rev_map f t) [f h]


let rec for_all p lst =
  match lst with
  | [] -> true
  | h :: t -> p h && for_all p t


let rec exists p lst =
  match lst with
  | [] -> false
  | h :: t -> p h || exists p t


let rec mem x lst =
  match lst with
  | [] -> false
  | h :: t -> x = h || mem x t


let rec find p lst =
  match lst with
  | [] -> failwith "find -> elemento no encontrado"
  | h :: t -> if p h then h else find p t


let rec filter p lst =
  match lst with
  | [] -> []
  | h :: t -> if p h then h :: filter p t else filter p t


let rec find_all p lst = filter p lst


let rec partition p lst =
  match lst with
  | [] -> ([], [])
  | h :: t ->
      let (yes, no) = partition p t in
      if p h then (h :: yes, no) else (yes, h :: no)


let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | h :: t -> fold_left f (f acc h) t


let rec fold_right f lst acc =
  match lst with
  | [] -> acc
  | h :: t -> f h (fold_right f t acc)


let rec assoc x lst =
  match lst with
  | [] -> failwith "assoc -> elemento no encontrado"
  | (key, value) :: t -> if x = key then value else assoc x t


let rec mem_assoc x lst =
  match lst with
  | [] -> false
  | (key, _) :: t -> x = key || mem_assoc x t


let rec remove_assoc x lst =
  match lst with
  | [] -> []
  | (key, value) :: t -> if x = key then t else (key, value) :: remove_assoc x t
