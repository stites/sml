(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test1a = all_except_option("string", []) = NONE
val test1b = all_except_option("string", ["ar"]) = NONE
val test10 = all_except_option("string", ["ar", "arst"]) = NONE
val test11 = all_except_option("string", ["string"]) = SOME []
val test12 = all_except_option("string", ["arst","string"]) = SOME ["arst"]
val test14 = all_except_option("string", ["arst","tsra","string"]) = SOME ["arst","tsra"]
val test15 = all_except_option("string", ["arst","tsra","string","test"]) = SOME       ["arst","tsra","test"]
val test16 = all_except_option("string", ["arst","tsra","string","test","tset"]) = SOME ["arst","tsra","test","tset"]
val test17 = all_except_option("string", ["tsra","string","test","tset"])   =SOME     ["tsra","test","tset"]
val test18 = all_except_option("string", ["string","test","tset"])             =SOME ["test","tset"]

val test20 = get_substitutions1([["foo"],["there"]], "foo") = []
val test2a = get_substitutions1([[],["arst"]], "foo") = []
val test21 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") =  ["Fredrick","Freddie","F"]
val test22 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey","Geoff","Jeffrey"]

val test30 = get_substitutions2([["foo"],["there"]], "foo") = []
val test3a = get_substitutions2([[],["arst"]], "foo") = []
val test31 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") =  ["Fredrick","Freddie","F"]
val test32 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey","Geoff","Jeffrey"]



val test40 = similar_names([[]], {first="Fred", middle="W", last="Smith"}) = 	    [{first="Fred", last="Smith", middle="W"}]
val test41 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

(*
val test5 = card_color((Clubs, Num 2)) = Black

val test6 = card_value((Clubs, Num 2)) = 2

val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true

val test9 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4

val test10 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)
*)
