(* ::Package:: *)

PacletDirectoryLoad["~/Projects"];
<<Anyonica`


(* EXPORTING DATA *)

Options[exportData] = { "OverWrite" -> False }
exportCats[ r_FusionRing, opts:OptionsPattern[] ] :=
Module[
	{ cats, codes, groupedByFSymb, ring, hexSol, perm, dir },
	cats = FusionCategories[r];
	codes = FormalCode /@ cats;
	
	ring = SortedRing @ r;
	perm = WhichPermutation[ r, ring ];
	If[ 
		perm != Range[ Rank[ ring ] ],
		Print["Check permuted solutions for ring with code ", FC[ring]];
		cats = PermutedFusionCategory[ #, perm ]& /@ cats 
	];
	
	groupedByFSymb = GroupBy[ cats, Extract[5] @* FormalCode ];
	(* Set export directory *)
	dir = "/home/gert/Tests/Projects/anyonwiki.github.io/data/FusionCategories/";
	
	Export[ 
		dir<>CodeToFileName[ ring ]<>"/"<>CodeToFileName[ring]<>"_structconst.txt",  
		NZSC[ring], 
		"Table" 
	];
	
	Do[
		Export[ (* EXPORT F SYMBOLS *)
			StringJoin[
				dir,
				CodeToFileName[ ring ],
				"/pentsol_",
				ToString[ FormalCode[groupedByFSymb[[i,1]]][[5]] ],
				".txt" 
			],
			prepSol @ FSymbols @ groupedByFSymb[[i,1]],
			"Table"
		];
		Do[
			hexSol = RSymbols @ cat;
			If[ 
				!MissingQ[hexSol],
				Export[ 
					StringJoin[ 
						dir,
						CodeToFileName[ ring ],
						"/hexsol_",
						ToString[FormalCode[cat][[5]]],
						"_",
						ToString[FormalCode[cat][[6]]],
						".txt"
					],
					prepSol @ hexSol,
					"Table"
				]
			],
			{ cat, groupedByFSymb[[i]] } 
		]
		,
		{i,Length[groupedByFSymb]}
	]
]


CodeToFileName[ ring_FusionRing ]:=
	ToString[ FC @ ring] //
	StringReplace[
		{
			"{" -> "FR_",
			", " -> "_",
			"}" -> ""
		}
	];

prepSol[sol_] := 
	Map[ 
		ToString,
		MapAt[
		(Sequence@@(DecimalForm/@ReIm[N[#,{Infinity,64}]]))&,
		Append@@@List@@@sol/.(\[ScriptCapitalF]|\[ScriptCapitalR])->List,{All,-1}],
		{2}
	];


(*
Do[ 
	PrintTemporary[r];
	If[ 
		FusionCategories[r] =!= {},
		exportCats[ r ]
	],
	{ r, Cases[ FRL, ring_ /; Mult[ring] == 1 && Rank[ring] < 8 ] }
]*)


TableRow[ cat_ ] := 
	Module[ { fc, ns, rks, fpds, us, bs, fs, rs, names, ts, ss, linkDir },
		ts = ToString;
		fc = FormalCode @ cat;
		ss = "_{"<> ts[fc[[-2]] ] <>","<> ts[ fc[[-1]] ] <>"}";
		linkDir = "data/NumericCategories/" <> CodeToFileName[ FusionRing @ cat ] <> "/";
		
		If[  
			Length[ names = Names @ FusionRing[ cat ] ] != 0,
			ns = "[ $ [" <> ts[ TeXForm @ names[[1]] ] <> "]"<> ss <> " $"<>"](% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>" %)",
			ns = "[ $ [" <> fcToTexString[ fc[[;;4]] ]<>"]" <> ss <> "$"<>"](% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>" %)"
		];
		
		rks = ts @ Rank @ cat;
		
		fpds = ts @ N @ TQDS[cat];
		
		us = If[ UnitaryQ[cat], "T", "F" ];
		
		bs = If[ BraidedQ[cat], "T", "F" ];
		
		fs =  "[$ [F-\\text{symbols}]_{"<> ts[fc[[5]]]<> "} $ ]({% link "<> linkDir <> "pentsol_" <> ts[ fc[[5]] ]<>".txt" <>" %})";
		
		rs =  
			If[
				BraidedQ[cat],
				"[$ [R-\\text{symbols}]"<> ss <> " $ ]({% link "<> linkDir <> "hexsol_" <> ts[fc[[5]]] <> "_" <> ts[fc[[6]]] <> ".txt" <> " %})",
				""
			];
		
		"| " <> StringRiffle[ { ns, rks,  fpds, us, bs, fs, rs}, " | "  ] <> " |\n"	
	];
	
fcToTexString[ {a_,b_,c_,d_} ]:=
	"FR^{"<>ToString[a]<>","<>ToString[b]<>","<>ToString[c]<>"}_{"<>ToString[d]<>"}";




StringJoin@@(TableRow /@ FCL)
