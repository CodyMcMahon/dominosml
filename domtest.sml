use "domino.sml";

val domt0 = dominoes(0)
val domt1 = dominoes(1)
val domt2 = dominoes(2)
val domt3 = dominoes(3)
val domt4 = dominoes(4)

val euler0 = Eulers(domt0)
val euler1 = Eulers(domt1)
val euler2 = Eulers(domt2)
val euler3 = Eulers(domt3)
val euler4 = Eulers(domt4)

val flipt0 = flip([]) = []
val flipt1 = flip([(0,0)]) = [(0,0)]
val flipt2 = flip([(2,0),(2,2),(1,2),(1,1),(1,0),(0,0)]) = [(0,2),(2,2),(2,1),(1,1),(1,0),(0,0)]
val flipt3 = flip([(0,2),(2,2),(2,1),(1,1),(1,0),(0,0)]) = [(0,2),(2,2),(2,1),(1,1),(1,0),(0,0)]

val sol0 = solution(0)
val sol1 = solution(1)
val sol2 = solution(2)
val sol3 = solution(3)
val sol4 = solution(4)

val st0 = listAsString(sol0)
val st1 = listAsString(sol1)
val st2 = listAsString(sol2)
val st3 = listAsString(sol3)
val st4 = listAsString(sol4)

(* once you get all the above functions working, uncomment the driver *)
val dt0 = driver(listAsString, solution) 0
val dt1 = driver(listAsString, solution) 1
val dt2 = driver(listAsString, solution) 2
val dt3 = driver(listAsString, solution) 3
val dt4 = driver(listAsString, solution) 4
val dt5 = driver(listAsString, solution) 5

val a = print dt0
val b = print dt1
val c = print dt2
val d = print dt3
val e = print dt4 
val f = print dt5 

