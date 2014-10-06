(* homework 1 for Programming Languages (Coursera / University of Washington) *)

(* 1 *)
(* is_older : *)
fun is_older (date1 : int*int*int, date2 : int*int*int ) =
  if (#1 date1) <> (#1 date2)
  then (#1 date1) > (#1 date2)
  else if (#2 date1) <> (#2 date2)
    then (#2 date1) > (#2 date2)
    else (#3 date1) <> (#3 date2)
