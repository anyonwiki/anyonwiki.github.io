(* ::Package:: *)

Quit[];


PacletDirectoryLoad["~/Projects"];
<<Anyonica`


FCL[[;;40]]


(* EXPORTING DATA *)

Options[exportData] = { "OverWrite" -> False };
exportCats[ r_FusionRing, opts:OptionsPattern[] ] :=
Module[
	{ cats, ring, perm, dir, fileName, fileNameLong, scfn,scfnLong, fSymb, rSymb, pSymb, zipfn },
	cats = FusionCategories[r];

	ring = SortedRing @ r;
	perm = WhichPermutation[ r, ring ];
	If[
		perm != Range[ Rank[ ring ] ],
		cats = PermutedFusionCategory[ #, perm ]& /@ cats
	];

	(* groupedByFSymb = GroupBy[ cats, Extract[5] @* FormalCode ]; *)
	(* Set export directory *)
	dir = "~/Tests/Projects/anyonwiki.github.io/data/FusionCategories/";

	fileName[ cat_, str_String ] :=
		StringJoin[
			StringRiffle[ FormalCode[cat][[5;;]], "_" ],
			"_",
			str,
			".txt"
		];

	fileNameLong[ cat_, str_String ] :=
		StringJoin[
			dir,
			CodeToFileName @ ring,
			"/cat_",
			StringRiffle[ FormalCode[cat][[5;;]], "_" ],
			"/",
			fileName[cat, str ]
		];

	scfn =  CodeToFileName[ring] <> "_structconst.txt";
	scfnLong = dir <> CodeToFileName[ ring ] <> "/" <> scfn;

	Export[
		scfnLong,
		NZSC[ring],
		"Table"
	];

	Do[
		fSymb = prepSol @ FSymbols @ cat;
		Export[ fileNameLong[ cat, "pentsol" ], fSymb, "Table" ];


		If[ (* Export R-symbols if they exist *)
			!MissingQ[RSymbols@cat],
			rSymb = prepSol @ RSymbols @ cat;
			Export[ fileNameLong[ cat, "hexsol" ], rSymb, "Table" ]
		];

		pSymb = prepSol @ PivotalStructure @ cat;
		Export[ fileNameLong[ cat, "pivsol" ], pSymb, "Table" ];

		zipfn =
			StringJoin[
				dir,
				CodeToFileName @ ring,
				"/data_"<>StringRiffle[ FormalCode[cat][[5;;]], "_" ],
				".zip"
			];
		Export[
			zipfn,
			If[ (* Export R-symbols if they exist *)
				!MissingQ[RSymbols@cat],
				<|
					scfn -> Import[ scfnLong ],
					fileName[ cat, "pentsol" ] -> Import[ fileNameLong[ cat, "pentsol" ] ],
					fileName[ cat, "hexsol" ]  -> Import[ fileNameLong[ cat, "hexsol" ] ],
					fileName[ cat, "pivsol" ]  -> Import[ fileNameLong[ cat, "pivsol" ] ]
				|>,
				<|
					scfn -> Import[ scfnLong ],
					fileName[ cat, "pentsol" ] -> Import[ fileNameLong[ cat, "pentsol" ] ],
					fileName[ cat, "pivsol" ]  -> Import[ fileNameLong[ cat, "pivsol" ] ]
				|>
			],
			"Rules"
		];
		, { cat, cats }
	]
];

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
		Append@@@List@@@sol/.(\[ScriptCapitalF]|\[ScriptCapitalR]|\[ScriptP])->List,{All,-1}],
		{2}
	];


(* EXPORT ALL DATA NUMERICALLY *)

Monitor[
Do[
	If[
		FusionCategories[r] =!= {},
		exportCats[ r ]
	],
	{ r, Cases[ FRL, ring_ /; Mult[ring] == 1 && Rank[ring] < 8 && !MissingQ[FusionCategories@ring ] ] }
],r
]


TableRow[ cat_ ] :=
	Module[ { fc, fns, ns, rks, fpds, uS, bS, sS, rS, mS, fs, rs, names, ts, ss, dataDir, ds, zipfn },
		ts = ToString;
		fc = FormalCode @ cat;
		ss = "_{"<> ts[fc[[-3]] ] <>","<> ts[ fc[[-2]] ] <>"}^{" <> ts[fc[[-1]]] <> "}";
		
		zipfn =
			StringJoin[
				"data/NumericCategories/",
				CodeToFileName @ FusionRing @ cat,
				"/data_"<>StringRiffle[ FormalCode[cat][[5;;]], "_" ],
				".zip"
			];
		fns = "$$ \\text{FC}^" <> ToString @ fc[[;;3]] <>"_"<>ToString @ fc[[4;;]] <> " $$";
		
		ns = 
		If[
			Length[ names = Names @ FusionRing[ cat ] ] == 0,
			"[ $$ [" <> fcToTexString[ fc[[;;4]] ]<>"]" <> ss <> " $$ "<>" ](% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})",
			If[ 
				songNameQ[ names[[1]] ], 
				"[ $$ [" <> fixSongName @ names[[1]]   <> "]"<> ss <> " $$ "<>" ]({% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})", 
				"[ $$ [" <> ts[ TeXForm @ names[[1]] ] <> "]"<> ss <> " $$ "<>" ]({% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})"
			]			
		];

		rks = ts @ Rank @ cat;

		fpds = ts @ N @ FPDim[cat];

		uS = If[
			UnitaryQ[cat],
			"{::nomarkdown} <img src=\"/images/Unitary.png\" style=\"width:auto;height:40px;\"> {:/}",
			""
		];

		bS = If[
			BraidedQ[cat],
			"{::nomarkdown} <img src=\"/images/Braided.png\" style=\"width:auto;height:40px;\"> {:/}",
			""
		];

		sS = If[
			SphericalQ[cat],
			"{::nomarkdown} <img src=\"/images/Spherical.png\" style=\"width:auto;height:40px;\"> {:/}",
			""
		];

		rS = If[
			RibbonQ[cat],
			"{::nomarkdown} <img src=\"/images/Ribbon.png\" style=\"width:auto;height:40px;\"> {:/}",
			""
		];

		mS = If[
			ModularQ[cat],
			"{::nomarkdown} <img src=\"/images/Modular.png\" style=\"width:auto;height:40px;\"> {:/}",
			""
		];

		ds = "[data]({% link " <> zipfn <> " %})";

		"| " <> StringRiffle[ { fns, ns, rks, fpds, ds, bS, uS, sS, rS, mS}, " | "  ] <> " |\n"
	] // FixLatex;

fcToTexString[ {a_,b_,c_,d_} ]:=
	"\\text{FR}^{" <> ToString[a] <> "," <> ToString[b] <> "," <> ToString[c] <> "}_{" <> ToString[d] <> "}";

songNameQ[ s_String ] := StringMatchQ[ s, "\!\(\*TemplateBox[List["~~x__];

fixSongName[ songName_String ] :=
	If[
		songNameQ[songName ],
		songName //
		StringReplace[
		"\!\(\*TemplateBox[List["~~Shortest[x__]~~"\"\","~~Shortest[y__]~~"\"\","~~z__~~"], \"Subsuperscript\", Rule[SyntaxForm, SubsuperscriptBox]]\)":>x<>"@"<>y<>"@"<>z]//
		StringReplace[{"\\\\("->"(","\\\\)"->")","\\\\!"->""}] //
		StringReplace["(\\\\*SubscriptBox[" ~~ Shortest[x__] ~~ ", (" ~~Shortest[ y__] ~~ ")])" :>
		    x <> "_{" <> y <> "}"]//
		StringReplace["*StyleBox["~~x__~~y_?DigitQ~~Shortest[z__]~~"False]]" :> "\\mathbf{"<>y<>"}"]//
		StringReplace[{"[DoubleStruckCapitalZ]"->"\\mathbb{Z}", "[LeftTriangleEqual]"->"\\trianglelefteq","[Cross]"->"\\times"}]//
		StringReplace[{"\\"->"","\""->""}]//
		StringReplace[{"("->"",")"->""}]//
		StringReplace[{"["->"\\left[","]"->"\\right]"}]//
		StringReplace[{"mathbb"->"\\mathbb","tria"->"\\tria","times"->"\\times","mathbf"->"\\mathbf","Id"->"\\text{Id}"}]//
		StringReplace[x__~~"@"~~y__~~"@"~~z__:>x<>"_{"<>y<>"}^{"<>z<>"}"]//
		StringReplace["|"->"\\|"]//
		StringReplace["\\left[CircleTimes\\right]"->"\\otimes"],
		songName
	]


FixLatex[str_String] :=
	str //
	StringReplace["\\unicode{22ca}" -> "\\rtimes "] //
	StringReplace[Shortest["\\text{$\\times $"~~x__~~"}"] :> "\\times \\text{"<>x<>"}" ] //
	StringReplace[Shortest["\\left.\\text{"~~x__~~"}"~~y__~~"\\right)"] :>"\\text{"<>x<>"} "<>y<>")" ] //
	StringReplace[Shortest["\\text{"~~x__~~"$\\times $"~~y__~~"}"] :> "\\text{"<>x<>"} \\otimes \\text{" <> y <> "}"] //
	StringReplace[Shortest["\\text{"~~P___~~"SU(2}"] :> "\\text{"<>P<>"SU}(2" ]//
	StringReplace[ "\\text{}" ->""] //
	StringReplace["Rep(}" -> "Rep}("] //
	StringReplace["TY(}" -> "TY}("] //
	StringReplace["HI(}" -> "HI}("] //
	StringReplace["Adj(}" -> "Adj}("]//
	StringReplace["\\text{Fib$\\otimes $Fib}"->"\\text{Fib}\\otimes\\text{Fib}"]//
	StringReplace["\\text{Potts}"->"\\text{TY}(\\mathbb{Z}_3)"]//
	StringReplace["\\mathbb{Z}_2\\text{$\\otimes $Ising}"->"\\mathbb{Z}_2\\otimes \\text{Ising}"]//
	StringReplace["\\left.\\mathbb{Z}_2\\text{$\\otimes $Rep}(D_3\\right)"->"\\mathbb{Z}_2\\otimes \\text{Rep}(D_3)"] // 
	StringReplace["\\text{Fib$\\otimes $Ising}"->"\\text{Fib}\\otimes\\text{Ising}"]//
	StringReplace["\\times \\text{Rep}"->"\\otimes \\text{Rep}"]//
	StringReplace["\\mathbb{Z}_2\\times \\mathbb{Z}_2]"->"\\mathbb{Z}_2\\otimes \\mathbb{Z}_2]"]//
	StringReplace["\\mathbb{Z}_2\\times \\text{Ising}"->"\\mathbb{Z}_2\\otimes \\text{Ising}"]//
	StringReplace["\\trianglelefteq \\mathbb{Z}_{2}\\otimes\\mathbb{Z}_{2}"->"\\trianglelefteq \\mathbb{Z}_{2}\\times\\mathbb{Z}_{2}"]
	 


StringJoin@@(FixLatex@*TableRow /@ FCL )
