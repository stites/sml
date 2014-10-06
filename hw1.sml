(* homework 1 for Programming Languages (Coursera / University of Washington) *)

(* 1 *)
(* is_older : (int * int * int) * (int * int * int) -> bool *)
fun is_older (date1 : int*int*int, date2 : int*int*int ) =
  if (#1 date1) <> (#1 date2)
  then (#1 date1) > (#1 date2)
  else if (#2 date1) <> (#2 date2)
    then (#2 date1) > (#2 date2)
    else (#3 date1) <> (#3 date2)

(* 2 *)
(* number_in_month : int*int*int list, int -> int *)
fun number_in_month (dates : (int*int*int) list, month: int) =
  let
    fun subroutine (dates : (int*int*int) list, count : int) =
      if (null dates)
      then count
      else
        if (#2(hd dates) = month)
        then subroutine( tl dates, count+1 )
        else subroutine( tl dates, count   )
  in
    subroutine(dates, 0)
  end
