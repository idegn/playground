(* 問8.5 *)
type ekimei_t = {
  kanji : string;
  kana : string;
  romaji : string;
  shozoku : string;
}
(* 問8.6 *)
let hyoji eki = match eki with
    {kanji = kanji;
     kana = kana;
     romaji = romaji;
     shozoku = shozoku} ->
    (shozoku ^ ", " ^ kanji ^ " (" ^ kana ^ ")")
					     
     
(* let htest1 = hyoji{kanji = "茗荷谷"; kana = "みょうがだに"; *)
(* 		  romaji = "myogadani"; shozoku = "丸ノ内線"} *)
(* 		  = "丸ノ内線, 茗荷谷 (みょうがだに)" ;; *)
		      
(* hyoji {kanji = "茗荷谷"; kana = "みょうがだに";romaji = "myogadani"; *)
(*        shozoku = "丸の内線"} *)
	
(* 問8.7 *)
type ekikan_t = {
  kiten : string;
  shuten : string;
  keiyu : string;
  kyori : float;
  jikan : int;
}

		  
(* 問9.9 *)
(* 問9.10 *)
