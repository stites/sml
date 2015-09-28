(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
fun only_capitals slist =
  List.filter (fn s => Char.isUpper(String.sub(s,0))) slist

(* experimenting with different function appearances... *)
fun longest_string1 slist =
  let fun bigger (s, acc) = if (String.size(s) > String.size(acc)) then s else acc
  in List.foldl bigger "" slist end

fun longest_string2 slist =
  List.foldl (fn (s, acc) =>
                 if (String.size(s) >= String.size(acc))
                 then s
                 else acc) "" slist

fun longest_string_helper f =
  List.foldl (fn (s, acc) => if f(String.size(s), String.size(acc))
                             then s
                             else acc) ""

val longest_string3 = longest_string_helper (op >)
val longest_string4 = longest_string_helper (op >=)
val longest_capitalized = longest_string3 o only_capitals
val rev_string = String.implode o List.rev o String.explode

fun first_answer optfn slist =
  case slist of [] => raise NoAnswer
    | head::tail => (case optfn head of NONE => first_answer optfn tail | SOME v => v)

fun all_answers optfn slist =
  let fun helper (optfn, slist, acc) =
    case slist of [] => SOME acc | head::tail =>
      (case optfn head of NONE => NONE | SOME v => helper(optfn,tail,v@acc) )
  in helper(optfn, slist, []) end

val count_wildcards = g (fn x => 1) (fn x => 0)
val count_wild_and_variable_lengths = g (fn x => 1) String.size

fun count_some_var (str,p) = g (fn x => 0) (fn x => if str = x then 1 else 0) p

fun check_pat p =
  let
    fun get_strings p =
      case p of Variable x  => [x]
        |         TupleP ps => List.foldl (fn (p,i) => (get_strings p) @ i) [] ps
        | ConstructorP(_,p) => get_strings p
        |                _  => []
    fun uniq_strlist ss =
      case ss of  [] => true
        |   head::[] => true
        | head::tail => not(List.exists(fn x => head = x) tail) andalso uniq_strlist tail
  in
    uniq_strlist(get_strings(p))
  end

fun match (v, p) =
  case (v, p) of ( _ , Wildcard) => SOME []
    |         ( v , Variable sp) => SOME [(sp, v)]
    |              (Unit, UnitP) => SOME []
    |      (Const cv, ConstP cp) => if cv = cp then SOME [] else NONE
    | (Constructor(Cv,Cvs),ConstructorP(Cp,Cps)) => if Cv = Cp then match (Cvs, Cps) else NONE
    |    (Tuple tvs, TupleP tps) => if length tvs = length tps
                                    then all_answers match (ListPair.zip(tvs,tps))
                                    else NONE
    | _  => NONE

fun first_match v ps =
  SOME (first_answer (fn p => match (v, p)) ps) handle NoAnswer => NONE
