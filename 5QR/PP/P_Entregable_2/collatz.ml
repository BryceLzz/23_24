let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1


let rec orbit n =
  if n <= 1 then string_of_int n
  else string_of_int n ^ ", " ^ orbit (if n mod 2 = 0 then n / 2 else 3 * n + 1)


let rec length n =
  if n <= 1 then 0
  else 1 + length (if n mod 2 = 0 then n / 2 else 3 * n + 1)


let rec top n =
  if n <= 1 then 1
  else max n (top (if n mod 2 = 0 then n / 2 else 3 * n + 1))


let rec length'n'top n =
  if n <= 1 then (0, 1)
  else
    let (len, h) = length'n'top (if n mod 2 = 0 then n / 2 else 3 * n + 1) in
    (len + 1, max h n)


let rec longest_in m n =
  if m > n then
    failwith "Intervalo no válido"
  else if m = n then
    (m, length m)
  else
    let (lm, ll) = longest_in (m + 1) n in
    let (cm, cl) = length'n'top m in
    if cl > ll then
      (m, cl)
    else
      (lm, ll)


let rec highest_in m n =
  if m > n then
    failwith "Intervalo no válido"
  else if m = n then
    (m, top m)
  else
    let (hm, hh) = highest_in (m + 1) n in
    let th = top m in
    if th > hh then
      (m, th)
    else
      (hm, hh)
