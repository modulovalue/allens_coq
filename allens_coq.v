(* An example for a generic option type. *)
Inductive Nullable (T : Type) : Type :=
  | Some(t: T)
  | None.

(* An example for a generic either type. *)
Inductive Either (L R: Type) : Type :=
  | Left(val: L)
  | Right(val: R).

(* TODO How to match over comparisons? *)
(* TODO What's a Prop? *)
(* TODO digest more of https://clarksmr.github.io/sf-lectures/textbook/lf/toc.html*)
(* TODO continue with 23 https://www.youtube.com/watch?v=VYFTph2izIs&list=PLre5AT9JnKShFK9l9HYzkZugkJSsXioFs&index=23*)
Module Allenalgebra.
  (* TODO how to model product types? *)
  (* TODO how to assert that from <= to? *)
  Inductive AllenInterval : Type :=
    AllenIntervalValue(from : nat) (to : nat).
  
  Inductive AllenPoint : Type := 
    AllenPointValue(val: nat).
    
  Inductive IntervalQueryy : Type := 
    IntervalQueryyVal(from to: nat).
  (* TODO impl definitions for all the comments. *)
  (* TODO given an interval query, provide the correct Allen result. *)
  (* TODO impl allen over a query with an interval and a point. *)
  (* TODO impl allen over a two points. *)
  Inductive Allen : Type := 
(*
A: |-----|
B:           |-----|
a_l < b_l && a_l < b_r && a_r < b_l && a_r < b_r
*)
    | AllenPrecedes
(*
A:   |-----|
B:         |-----|
a_l < b_l && a_l < b_r && a_r == b_l && a_r < b_r
*)
    | AllenMeets
(*
A:     |-----|
B:       |-----|
a_l < b_l && a_l < b_r && a_r > b_l && a_r < b_r
*)
    | AllenOverlaps
(*
A:     |-----|
B:       |---|
a_l < b_l && a_l < b_r && a_r > b_l && a_r == b_r
*)
    | AllenFinishedBy
(*
A:     |-----|
B:       |-|
a_l < b_l && a_l < b_r && a_r > b_l && a_r > b_r
*)
    | AllenContains
(*
A:     |---|
B:     |-----|
a_l == b_l && a_l < b_r && a_r > b_l && a_r < b_r
*)
    | AllenStarts
(*
A:     |-----|
B:     |-----|
a_l == b_l && a_l == b_r && a_r == b_l && a_r == b_r
*)
    | AllenEquals
(*
A:     |-----|
B:     |---|
a_l == b_l && a_l < b_r && a_r > b_l && a_r > b_r
*)
    | AllenStartedBy
(*
A:       |-|
B:     |-----|
a_l > b_l && a_l > b_r && a_r < b_l && a_r < b_r
*)
    | AllenDuring
(*
A:       |---|
B:     |-----|
a_l > b_l && a_l < b_r && a_r > b_l && a_r == b_r
*)
    | AllenFinishes
(*
A:       |-----|
B:     |-----|
a_l > b_l && a_l < b_r && a_r > b_l && a_r > b_r
*)
    | AllenOverlappedBy
(*
A:         |-----|
B:   |-----|
a_l > b_l && a_l == b_r && a_r > b_l && a_r > b_r
*)
    | AllenMetBy
(*
A:           |-----|
B: |-----|
a_l > b_l && a_l > b_r && a_r > b_l && a_r > b_r
*)
    | AllenPrecededBy.
 
  Definition is_preceded_by(a_l a_r: nat) (b_l b_r: nat) : bool :=
    if (leb a_l b_l) then true
    else false.
  
End Allenalgebra.
