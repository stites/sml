(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1 = only_capitals ["a","b","c"] = []

val test2 = longest_string1 ["A","bc","C"] = "bc"

val test3 = longest_string2 ["A","bc","C"] = "bc"

val test4a0=  longest_string3 ["A","bc","C"] = "bc"
val test4a1=  longest_string3 ["Aarst","bc","C"] = "Aarst"
val test4a2=  longest_string3 ["A","barstttc","C"] = "barstttc"
val test4a3=  longest_string3 ["Aa","bc","C"] = "Aa"
val test4a4=  longest_string3 [] = ""

val test4b0= longest_string4 ["A","B","C"] = "C"
val test4b1= longest_string4 ["A","BC","C"] = "BC"
val test4b2= longest_string4 ["",""] = ""
val test4b3= longest_string4 [] = ""
val test50 = longest_capitalized ["A","bc","C"] = "A";
val test51 = longest_capitalized ["a","bc","C"] = "C";
val test53 = longest_capitalized ["A","Bc","C"] = "Bc";
val test54 = longest_capitalized ["a","bc","c"] = "";

val test61 = rev_string "abc" = "cba";
val test60 = rev_string "" = "";
val test61 = rev_string "abcd" = "dcba";

val test70 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test71 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,4] = 4
val test72 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,4] = 4
val test73 = first_answer (fn x => if x > 3 then SOME x else NONE) [4] = 4
val test74 = first_answer (fn x => if x > 3 then SOME x else NONE) [4,5] = 4
val test75 = first_answer (fn x => if x > 3 then SOME x else NONE) [4,5,6] = 4
val test76 = ((first_answer (fn x => if x = 1 then SOME x else NONE) [3])
             ; false ) handle NoAnswer => true

val test80 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test81 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,1,1] = SOME [1,1,1]
val test82 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1] = SOME [1]
val test83 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val test84 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,2] = NONE

val test9a1 = count_wildcards Wildcard = 1
val test9a0 = count_wildcards (TupleP [Wildcard, (ConstP 5)])= 1
val test9a3 = count_wildcards( ConstructorP("SOME",(TupleP [(Variable "x"), (ConstP 3)])) )= 0
val test9a2 = count_wildcards( TupleP [(Variable "s"),( TupleP [(Variable "t"), Wildcard])])= 1
val test9a4 = count_wildcards( TupleP [(Variable "s"),( TupleP [Wildcard, Wildcard])])= 2

val test9b  = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b1 = count_wild_and_variable_lengths  Wildcard = 1
val test9b0 = count_wild_and_variable_lengths  (TupleP [Wildcard, (ConstP 5)])= 1
val test9b3 = count_wild_and_variable_lengths ( ConstructorP("SOME",(TupleP [(Variable "x"), (ConstP 3)])) )= 1
val test9b2 = count_wild_and_variable_lengths ( TupleP [(Variable "s"),( TupleP [(Variable "t"), Wildcard])])= 3
val test9b4 = count_wild_and_variable_lengths ( TupleP [(Variable "s"),( TupleP [Wildcard, Wildcard])])= 3



val test9c0 = count_some_var ("x", Variable("x")) = 1;
val test9b1 = count_some_var ("x", ( TupleP [(Variable "s"),( TupleP [Wildcard, Wildcard])]) )= 0
val test9b4 = count_some_var ("x", ( TupleP [(Variable "x"),( TupleP [Wildcard, Wildcard])]) )= 1

val test100 = check_pat(Variable("x")) = true
val test101 = check_pat(TupleP [(Variable "s"),
                       (TupleP [Wildcard, Wildcard])]) = true
val test104 = check_pat(TupleP [(Variable "x"),
                       (TupleP [(Variable "x"), Wildcard])]) = false


val test120 = first_match (Const 7) [ConstP 7] = (SOME [ ]);
val test121 = first_match (Const 7) [ConstP 0] = NONE
val test122 = first_match (Const 8) [Variable "b", Variable "k"] = SOME [("a",Const(8))]
val test123 = first_match Unit [UnitP] = SOME []
