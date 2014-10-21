(* Dan Grossman, Coursera PL, HW2 Provided Code *)
(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (str, list) =
  let fun subroutine (s, l) =
    case l of [] => []
    | head::tail => if (same_string(head,s)) then tail else head::subroutine(s,tail)
  in
    let val res = subroutine(str,list) in
      if (res = list) then NONE else SOME res
    end
  end
(* got so close! unfortunately there's not a whole lotta time left... *)
(* fun all_except_option (str, list) =
   case list of [] => NONE
    | head::[]     => if same_string(str, head) then SOME [] else NONE
    | head::tail   => (case all_except_option(str, tail) of NONE => NONE
                       | SOME lst => if same_string(str, head)
                          then SOME lst
                          else SOME (head::lst))
*)
fun get_substitutions1 (str_lst_lst, str) =
    case str_lst_lst of [] => []
    | str_lst::[]   => (case all_except_option(str, str_lst) of
                          NONE => []
                        | SOME lst => lst)
    | str_lst::rest => (case all_except_option(str, str_lst) of
                          NONE =>     get_substitutions1(rest, str)
                        | SOME lst => lst@get_substitutions1(rest, str))

fun get_substitutions2 (str_lst_lst, str) =
    let fun subroutine(next_tl, acc) =
      case next_tl of [] => acc
      | head::tail =>  (case all_except_option(str, head) of
                          NONE => subroutine(tail, acc)
                        | SOME lst => subroutine(tail, acc@lst) )
    in subroutine(str_lst_lst, []) end

fun similar_names (sll, fullname) =
    let fun make_names (name_list, md, lt) =
      case name_list of [] => []
      | head::tail => {first=head,middle=md,last=lt}::make_names(tail,md,lt)
    in
      case fullname of
        {first=x,middle=y,last=z} => fullname::make_names(get_substitutions2(sll, x), y, z)
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)
