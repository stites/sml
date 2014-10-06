(* homework 1 for Programming Languages (Coursera / University of Washington) *)

(* 1 *)
(* is_older : *)
fun is_older (date1 : int*int*int, date2 : int*int*int ) =
  if (#1 date1) > (#1 date2)
  then false
  else 
    if (#1 date1) < (#1 date2)
    then true
    else 
      if (#1 date1) = (#1 date2)
      then is_older(tl(date1), tl(date2))
      else false
