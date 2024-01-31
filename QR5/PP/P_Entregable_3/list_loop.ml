let length lst =
  let rec length_acc acc = function
    | [] -> acc
    | _ :: t -> length_acc (acc + 1) t
  in
  length_acc 0 lst

let last lst =
  match lst with
  | [] -> failwith "last"
  | _ ->
      let rec find_last acc = function
        | [] -> acc
        | [x] -> x
        | _ :: t -> find_last acc t
      in
      find_last (List.hd lst) (List.tl lst)

let nth lst n =
  let rec nth_rec acc count = function
    | [] -> failwith "nth"
    | h :: t -> if count = n then h else nth_rec h (count + 1) t
  in
  nth_rec (List.hd lst) 0 (List.tl lst)

let rev lst =
  let rec rev_acc acc = function
    | [] -> acc
    | h :: t -> rev_acc (h :: acc) t
  in
  rev_acc [] lst

let append lst1 lst2 =
  let rec append_rec acc = function
    | [] -> acc
    | h :: t -> append_rec (h :: acc) t
  in
  append_rec (rev lst1) lst2

let concat lst =
  let rec concat_acc acc = function
    | [] -> acc
    | h :: t -> concat_acc (append acc h) t
  in
  concat_acc [] lst

let for_all pred lst =
  let rec for_all_rec pred = function
    | [] -> true
    | h :: t -> pred h && for_all_rec pred t
  in
  for_all_rec pred lst

let exists pred lst =
  let rec exists_rec pred = function
    | [] -> false
    | h :: t -> pred h || exists_rec pred t
  in
  exists_rec pred lst

let find_opt pred lst =
  let rec find_opt_rec pred = function
    | [] -> None
    | h :: t -> if pred h then Some h else find_opt_rec pred t
  in
  find_opt_rec pred lst

let iter f lst =
  let rec iter_rec f = function
    | [] -> ()
    | h :: t -> f h; iter_rec f t
  in
  iter_rec f lst

let fold_left f acc lst =
  let rec fold_left_rec f acc = function
    | [] -> acc
    | h :: t -> fold_left_rec f (f acc h) t
  in
  fold_left_rec f acc lst
