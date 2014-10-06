(* homework 1 for Programming Languages (Coursera / University of Washington) *)

(* 1 *)
(* val is_older = fn : (int * int * int) * (int * int * int) -> bool *)
fun is_older (date1 : int*int*int, date2 : int*int*int ) =
  if   (#1 date1) <> (#1 date2)
  then (#1 date1) <  (#1 date2)
  else if (#2 date1) <> (#2 date2)
    then  (#2 date1) <  (#2 date2)
    else  (#3 date1) <  (#3 date2)

(* 2 *)
(* val number_in_month = fn : (int * int * int) list * int -> int *)
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

(* 3 *)
(* val number_in_months = fn : (int * int * int) list * int list -> int *)
fun number_in_months (dates : (int*int*int) list, months: int list) =
  let
    fun subroutine (months : int list, count : int) =
      if (null months)
      then count 
      else subroutine(tl months, count + number_in_month(dates, hd months))
  in
    subroutine(months, 0)
  end

(* 4 *)
(* val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list *)
fun dates_in_month (dates : (int*int*int) list, month: int) =
  let
    fun subroutine ( dates : (int*int*int) list, dates_in_month : (int*int*int) list ) =
      if (null dates)
      then dates_in_month
      else
        if (#2(hd dates) = month)
        then subroutine( tl dates, dates_in_month@[hd dates] )
        else subroutine( tl dates, dates_in_month )
  in
    subroutine(dates, [])
  end

(* 5 *)
(* val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list *)
fun dates_in_months (dates : (int*int*int) list, months: int list) =
  let
    fun subroutine (months : int list, months_memo : (int*int*int) list) =
      if (null months)
      then months_memo
      else subroutine(tl months, months_memo@dates_in_month(dates, hd months))
  in
    subroutine(months, [])
  end

(* 6 *)
(* val get_nth = fn : string list * int -> string *)
(* val date_to_string = fn : int * int * int -> string *)
(* val number_before_reaching_sum = fn : int * int list -> int *)
(* val what_month = fn : int -> int *)
(* val month_range = fn : int * int -> int list *)
(* val oldest = fn : (int * int * int) list -> (int * int * int) option *)
