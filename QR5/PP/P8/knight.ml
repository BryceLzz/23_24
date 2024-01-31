exception Not_found

type position = int * int

let valid_moves m n obstacles pos =
  let moves = [(2, 1); (2, -1); (-2, 1); (-2, -1); (1, 2); (1, -2); (-1, 2); (-1, -2)] in
  List.filter
    (fun (dr, dc) ->
      let r, c = pos in
      let nr, nc = r + dr, c + dc in
      nr >= 0 && nr < m && nc >= 0 && nc < n && not (List.mem (nr, nc) obstacles))
    moves

let rec tour m n obstacles ini fin =
  let rec explore path visited pos =
    if pos = fin then List.rev path
    else
      let moves = valid_moves m n obstacles pos in
      let next_moves = List.filter (fun p -> not (List.mem p visited)) moves in
      match next_moves with
      | [] -> raise Not_found
      | next_pos :: _ ->
          explore (next_pos :: path) (pos :: visited) next_pos
  in
  explore [ini] [] ini

let rec min_tour m n obstacles ini fin =
  let rec explore path visited pos =
    if pos = fin then List.rev path
    else
      let moves = valid_moves m n obstacles pos in
      let next_moves = List.filter (fun p -> not (List.mem p visited)) moves in
      match next_moves with
      | [] -> raise Not_found
      | _ ->
          let paths =
            List.map
              (fun next_pos -> explore (next_pos :: path) (pos :: visited) next_pos)
              next_moves
          in
          List.fold_left
            (fun acc p -> if List.length p < List.length acc then p else acc)
            (List.hd paths) paths
  in
  explore [ini] [] ini

let min_tour4D m n obstacles ini fin =
  let adjust_coordinates (r, c) = (r mod m, c mod n) in
  let adjusted_ini = adjust_coordinates ini in
  let adjusted_fin = adjust_coordinates fin in
  let adjusted_obstacles = List.map adjust_coordinates obstacles in
  min_tour m n adjusted_obstacles adjusted_ini adjusted_fin
