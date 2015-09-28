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
fun card_color (card) =
    case card of
      (Clubs, _) => Black
    | (Spades, _) => Black
    | _          => Red
fun card_value (card) =
    case card of (_, Ace) => 11
    | (_, Queen) => 10
    | (_, Jack) => 10
    | (_, King) => 10
    | (_, Num i) => i
fun remove_card (cs, c, e) =
    let fun subroutine (cs, c) =
        case cs of [] => []
        | head::tail => if c = head then tail else head::subroutine(tail, c)
    in
       let val cards = subroutine(cs, c) in
           if cs = cards then raise e else cards
       end
    end

fun all_same_color (cs) =
    case cs of [] => true
    | c::[] => true
    | c0::tail => (case tail of
                   c1::rest => (card_color(c0) = card_color(c1))
                               andalso all_same_color(rest) )
fun sum_cards (cs) =
    let fun helper (cs, acc) =
      case cs of [] => acc
      | c::tail => helper(tail, acc+card_value(c))
    in
      helper(cs, 0)
    end

fun score (cs, goal) =
    let fun prelim() =
      let val sum = sum_cards(cs) in
        if sum > goal then 3*(sum-goal) else goal - sum
      end
    in
      if all_same_color(cs)
      then prelim() div 2
      else prelim()
    end

fun officiate (cs, ms, goal) =
    let fun game_state(hand, deck, goal, moves) =
      case moves of [] => score(hand, goal)
      | Discard(card)::movesLeft => game_state(remove_card(hand, card, IllegalMove), deck, goal, movesLeft)
      | Draw::movesLeft => (case deck of [] => score(hand, goal)
                 | nextCard::newDeck => if sum_cards(nextCard::hand) > goal
                                        then score(nextCard::hand, goal)
                                        else game_state(nextCard::hand, newDeck, goal, movesLeft)
                )
    in
        game_state([], cs, goal, ms)
    end
