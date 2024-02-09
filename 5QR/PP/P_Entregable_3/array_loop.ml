let append arr1 arr2 =
  let len1 = Array.length arr1 in
  let len2 = Array.length arr2 in
  let result = Array.make (len1 + len2) arr1.(0) in
  Array.blit arr1 0 result 0 len1;
  Array.blit arr2 0 result len1 len2;
  result

let sub arr ofs len =
  let result = Array.make len arr.(0) in
  Array.blit arr ofs result 0 len;
  result

let copy arr =
  let len = Array.length arr in
  let result = Array.make len arr.(0) in
  Array.blit arr 0 result 0 len;
  result

let fill arr ofs len value =
  for i = ofs to ofs + len - 1 do
    arr.(i) <- value
  done

let blit src src_pos dest dest_pos len =
  for i = 0 to len - 1 do
    dest.(dest_pos + i) <- src.(src_pos + i)
  done

let to_list arr =
  let len = Array.length arr in
  let rec to_list_rec acc i =
    if i < 0 then acc
    else to_list_rec (arr.(i) :: acc) (i - 1)
  in
  to_list_rec [] (len - 1)

let iter f arr =
  let len = Array.length arr in
  for i = 0 to len - 1 do
    f arr.(i)
  done

let fold_left f acc arr =
  let len = Array.length arr in
  let rec fold_left_rec acc i =
    if i < 0 then acc
    else fold_left_rec (f acc arr.(i)) (i - 1)
  in
  fold_left_rec acc (len - 1)

let for_all pred arr =
  let len = Array.length arr in
  let rec for_all_rec pred i =
    i < 0 || (pred arr.(i) && for_all_rec pred (i - 1))
  in
  for_all_rec pred (len - 1)

let exists pred arr =
  let len = Array.length arr in
  let rec exists_rec pred i =
    i >= 0 && (pred arr.(i) || exists_rec pred (i - 1))
  in
  exists_rec pred (len - 1)

let find_opt pred arr =
  let len = Array.length arr in
  let rec find_opt_rec pred i =
    if i < 0 then None
    else if pred arr.(i) then Some arr.(i)
    else find_opt_rec pred (i - 1)
  in
  find_opt_rec pred (len - 1)
