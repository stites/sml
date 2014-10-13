(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


(* user-defined tests are post-fixed with a _ followed by the test index *)

val test1_i = is_older((1,2,3),(2,3,4)) = true
val test1_0 = is_older((1,2,3),(1,3,4)) = true
val test1_1 = is_older((1,2,3),(1,2,4)) = true
val test1_2 = is_older((1,2,3),(1,2,3)) = false
val test1_3 = is_older((1,2,4),(1,2,3)) = false
val test1_4 = is_older((1,3,4),(1,2,3)) = false
val test1_5 = is_older((2,3,4),(1,2,3)) = false

val test2_i = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2_0 = number_in_month([(2012,2,28),(2013,2,1)], 2) = 2
val test2_1 = number_in_month([(2012,2,28),(2013,2,1)], 1) = 0
val test2_2 = number_in_month([], 2) = 0

val test3_i = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_0 = number_in_months([],[2,3,4]) = 0
val test3_1 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0

val test4_i = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4_0 = dates_in_month([],2) = []
val test4_1 = dates_in_month([(2012,2,28),(2013,12,1)],3) = []
val test4_2 = dates_in_month([(2012,2,28),(2013,2,1)],2) = [(2012,2,28),(2013,2,1)]

val test5_i = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5_0 = dates_in_months([],[2,3,4]) = []
val test5_1 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5_2 = dates_in_months([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)]
val test5_3 = dates_in_months([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[1,5,7]) = []

val test6_i = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6_0 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi"

val test7_i = date_to_string((2014, 10, 9)) = "October 9, 2014"
val test7_0 = date_to_string((2013, 6, 1)) = "June 1, 2013"

val test8_i = number_before_reaching_sum(1,   [1,2,3,4,5]) = 0
val test8_0 = number_before_reaching_sum(2,   [1,2,3,4,5]) = 1
val test8_1 = number_before_reaching_sum(3,   [1,2,3,4,5]) = 1
val test8_2 = number_before_reaching_sum(4,   [1,2,3,4,5]) = 2
val test8_3 = number_before_reaching_sum(5,   [1,2,3,4,5]) = 2
val test8_4 = number_before_reaching_sum(6,   [1,2,3,4,5]) = 2
val test8_5 = number_before_reaching_sum(7,   [1,2,3,4,5]) = 3
val test8_6 = number_before_reaching_sum(8,   [1,2,3,4,5]) = 3
val test8_7 = number_before_reaching_sum(9,   [1,2,3,4,5]) = 3
val test8_8 = number_before_reaching_sum(10,  [1,2,3,4,5]) = 3
val test8_9 = number_before_reaching_sum(11,  [10,2,3,4,5]) = 1
val test8_a = number_before_reaching_sum(12,  [1,2,3,4,5]) = 4
val test8_b = number_before_reaching_sum(13,  [1,2,3,4,5]) = 4
val test8_c = number_before_reaching_sum(14,  [1,2,3,4,5]) = 4
val test8_d = number_before_reaching_sum(15,  [1,2,3,4,5]) = 4
val test8_e = number_before_reaching_sum(16,  [1,2,3,4,5]) = 5
val test8_f = number_before_reaching_sum(17,  [1,2,3,4,5]) = 5
val test8_g = number_before_reaching_sum(100, [1,2,3,4,5]) = 5

val test9_0 = what_month(70) = 3
val test9_1 = what_month(1)   = 1
val test9_2 = what_month(365) = 12

val test10_i = month_range(31, 34) = [1,2,2,2]
val test10_0 = month_range(32, 31) = []
val test10_1 = month_range(31, 31) = [1]
val test10_2 = month_range(31, 32) = [1,2]

(*
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
*)
