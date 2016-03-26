(*dominoes*)
(*simple function that makes the dominoes as you expect 
they are made in a pattern like (4,4)(4,3)...(0,0)*)

fun dominoes(i:int) =
  let
    (*this is the recursive helper function*)
    fun mk(i:int,i2:int,i3:int) =
      case i of
        ~1 =>[]
        |_ =>
        case i2 of
          0 => (i,i2)::mk((i-1),i3-1,i3-1)
          |_=> (i,i2)::mk((i), (i2-1),(i3));
  in 
      mk(i,i,i)
  end

(*Eulers*)
(*Puts the dominoes in the order that is correct for whatever this
game is called.

immediately tosses sets that won't make working sets (sets that end with
an odd number)

can do large data sets quickly*)

fun Eulers(L :(int * int) list) =
  let

  (*gets the biggest domino number to see if the set is worth trying*);
  fun getbiggest(L :(int * int) list,i:int) =
    case L of
      [] => i  

      (*this is just logic for for getting the max basically just 
        "is this bigger or is this bigger" a lot*)

      |_ => if (#1 (hd L)) > (#2 (hd L)) 
              then if i > (#1 (hd L)) 
                then getbiggest( tl L, i) 
            else getbiggest( tl L, (#1 (hd L))) 
            else if i > (#2 (hd L)) 
              then getbiggest( tl L, i) 
            else getbiggest( tl L, (#2 (hd L)))

  (*determines if the set has an odd or even largest number*)
  fun isImpossible(L :(int * int) list) =
    if getbiggest(L,0) mod 2 = 1 then true else false

  (*finds the next domino to be used in the set*)
  fun findNext(L :(int * int) list, i:int) =
  let
    fun rm(L :(int * int) list, i:(int * int)) =
      case L of
        [] => []  
        |_ => if hd L = i then tl L else hd L::rm(tl L, i);

    (*checks through the first number in every domino for a match*)
    fun findFirst(L :(int * int) list, i:int) =
      case L of
        [] => (~1,~1)  
        |_ => if (#1 (hd L)) = i then hd L else findFirst(tl L,i)

    (*checks through the second number in every domino for a match*)
    fun findSecond(L :(int * int) list,i:int) =
      case L of
        [] => (~1,~1)  
        |_ => if (#2 (hd L)) = i then hd L else findSecond(tl L,i);


      val F = findFirst(L , i)
      val S = findSecond(L , i)
    in

       (*this is what the findNext function actually does*)
        case tl L of
          [] => [hd L]
          (*check with findFirst then with findSecond end the list
            with (~1,~1) tuple if it fails.*)
          |_ => if F = (~1,~1) 
                  then if S = (~1,~1) 
                    then [(~1,~1)] 
                  else S::findNext(rm(L,S),(#1 (S))) 
                else F::findNext(rm(L,F),(#2 (F)))

    end
  val RL = tl L
  val RV = hd L
  in  

    (*this is what the Eulers function actually does*)
    if isImpossible(L) then []
    else if L = [] then []
    else case RL of
      [] => [RV]
      |_ => RV::findNext(RL, #2 RV)
  end     

(*flip*)
fun flip(L :(int * int) list) =
  let 
    (*helper for flip*)
    fun helpflip(L :(int * int) list,i : int) =
    let
    in
    case L of
      [] => []
            (*just a should the domino be flipped or not*)
      |_ => if #1 (hd L) = i 
              then (hd L):: helpflip((tl L), #2(hd L)) 

                 (*domino is flipped right here*)
            else (#2 (hd L),#1 (hd L)):: helpflip((tl L), #1(hd L))  
    end
  in
    (*the actual flip function*)
    case L of
      [] => []
      |_ => case tl L of 
        [] => [hd L]
 
             (*this logic is just seeing if it should flip the first domino*)
        |_ => if #1(hd L) = #1(hd(tl L)) 
                then helpflip(L, #2 (hd L))  
              else if #1(hd L) = #1(hd(tl L)) 
                then helpflip(L, #2 (hd L)) 
              else helpflip(L, #1 (hd L))
  end

(*solution*)
(*very simple function*)
fun solution(i:int) =
  flip(Eulers(dominoes(i)));

(*listAsString*)
(*basically a tostring method*)
fun listAsString(L:(int*int) list) =
  let
  in
    case L of
    (*empty list returns an empty string*)
    [] => ""
    |_ => case (tl L) of  
               (*two cases so when it ends it doesn't have a comma there*)
          [] => "(" ^ Int.toString(#1 (hd L)) ^ ", " 
                 ^ Int.toString(#2 (hd L)) ^ ")"

          |_ => "(" ^ Int.toString(#1 (hd L)) ^ ", " 
                 ^ Int.toString(#2 (hd L)) ^  ")" 
                 ^ listAsString(tl L)

  end

(*driver*)
(*simple function*)
fun driver(F1, F2) N =
  F1(F2(N));