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
fun get_nth (strings : string list, n : int) =
  let
    fun subroutine (strings : string list, index : int) =
      if (index = 1)
      then hd strings
      else subroutine(tl strings, index-1)
  in
    subroutine(strings, n)
  end

(* 7 *)
(* val date_to_string = fn : int * int * int -> string *)
fun date_to_string ( date : (int*int*int) ) =
  get_nth([
           "January",
           "February",
           "March",
           "April",
           "May",
           "June",
           "July",
           "August",
           "September",
           "October",
           "November",
           "December"
         ], #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
(* 8 *)
(* val number_before_reaching_sum = fn : int * int list -> int *)
fun number_before_reaching_sum ( sum : int , int_list : int list ) =
  let
    fun subroutine ( items : int list, current_item : int,  current_sum : int ) =
      if (items = [] orelse (current_item + current_sum >= sum))
      then current_item
      else subroutine(tl items, hd items, current_item + current_sum)
  in
    subroutine(tl int_list, hd int_list,  0)
  end
(* val what_month = fn : int -> int *)
(* val month_range = fn : int * int -> int list *)
(* val oldest = fn : (int * int * int) list -> (int * int * int) option *)
