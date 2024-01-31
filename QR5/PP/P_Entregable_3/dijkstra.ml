open MinPrioQueue

let dijkstra grafo =
  let n = Array.length grafo in
  if n = 0 || Array.length grafo.(0) <> n then
    raise (Invalid_argument "dijkstra: No es una matriz cuadrada")
  else
    let distancias = Array.make_matrix n n None in
    let cola_prioritaria = ref empty in

    for i = 0 to n - 1 do
      for j = 0 to n - 1 do
        match grafo.(i).(j) with
        | Some peso ->
          if peso < 0 then
            raise (Invalid_argument "dijkstra: Se encontró un peso negativo")
          else
            cola_prioritaria := insert !cola_prioritaria peso (i, j)
        | None -> ()
      done
    done;

    let rec procesar_cola () =
      match extract !cola_prioritaria with
      | Some (min_dist, (u, v), nueva_cola) ->
        cola_prioritaria := nueva_cola;

        (match distancias.(u).(v) with
         | Some d when min_dist < d -> ()
         | _ ->
           distancias.(u).(v) <- Some min_dist;
           distancias.(v).(u) <- Some min_dist;

           for i = 0 to n - 1 do
             match grafo.(v).(i) with
             | Some peso ->
               let nueva_distancia = min_dist + peso in
               (match distancias.(u).(i) with
                | Some d when nueva_distancia < d ->
                  distancias.(u).(i) <- Some nueva_distancia;
                  distancias.(i).(u) <- Some nueva_distancia;
                  cola_prioritaria := insert !cola_prioritaria nueva_distancia (u, i)
                | _ -> ())
             | None -> ()
           done);

        procesar_cola ()
      | None -> ()
    in

    procesar_cola ();
    distancias
