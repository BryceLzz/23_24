let rec fib n =
  if n <= 1 then n
  else fib (n - 1) + fib (n - 2)

let fibto n =
  for i = 0 to n do
    Printf.printf "%d " (fib i)
  done;
  print_newline ()

let () =
  if Array.length Sys.argv <> 2 then
    Printf.printf "Uso: %s <n>\n" Sys.argv.(0)
  else
    let n = int_of_string Sys.argv.(1) in
    if n < 0 then
      Printf.printf "El número no puede ser negativo.\n"
    else
      fibto n