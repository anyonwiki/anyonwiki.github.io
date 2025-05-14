(* ::Package:: *)

Quit[]


Needs[ "WikiTools`", FileNameJoin[{NotebookDirectory[],"WikiTools.wl"}] ]
<<Anyonica`


Options[RingPage] = {
	"SimplifyDimensionsBy" -> Identity,
	"SimplifyCharactersBy" -> Identity,
	"SimplifyModularDataBy" -> Identity
};

RingPage[ fusionRing_, opts:OptionsPattern[] ] :=
Module[{ dl = "\n\n", simQ, simC, simM, ring },

	simQ = OptionValue["SimplifyDimensionsBy"];
	simC = OptionValue["SimplifyCharactersBy"];
	simM = OptionValue["SimplifyModularDataBy"];

  ring = SortedRing @ fusionRing;

	StringJoin[
		pageTitle[ring],
		dl,
		sectionMultTable[ring],
		dl,
		sectionQuantumDimensions[ring, "SimplifyBy" -> simQ ],
		dl,
		sectionCharacters[ring, "SimplifyBy" -> simC ],
		dl,
		sectionModularData[ring, "SimplifyBy" -> simM ],
		dl,
		sectionAdjointFusionRing[ring],
		dl,
		sectionUniversalGrading[ring],
		dl,
		sectionCategorifications[ring],
		dl,
		sectionData[ring]
	] 
] // AdjustRootObjects

(* Pretty print root objects *)
AdjustRootObjects[s_String] :=
	StringReplace[
		s,
		{
			"\\text{$\\#$"~~n:DigitCharacter..~~"}" -> "x",
			"\\&" -> ""
		}
	];



(*====================================================================*)
(* title of the page  *)

pageTitle[ring_] := 
  StringJoin[
    "---",
    "\n",
    "title: " <> titleString[ ring ],
    "\n",
    "layout: default",
    "\n",
    "keywords: " <> keywords[ring],
    "\n",
    "---",
    "\n",
    "# "<> titleString[ring],
    "\n"
  ]

titleString[ ring_ ] := 
  math[ wikiName[ring] ];

  
keywords[ ring_ ] := 
	StringRiffle[
		ToString/@
		Join[
			{"Fusion Ring"},
			{ StringRiffle[ ToString /@ FC[ring], "_" ]},
			DeleteCases[ Names[ring], n_/; StringContainsQ[n,"Box["] ],
			If[GroupQ[ring], {"Group", "Group Ring"}, {} ],
			If[CommutativeQ[ring],{"Commutative"}, {}],
			If[NilpotentFusionRingQ[ring],{"Nilpotent"},{}]
		],
		", "
	];


(*====================================================================*)
sectionMultTable[ ring_FusionRing ] := Module[{
	fra = FusionRingAutomorphisms[ ring ],
	sfr = SubFusionRings[ ring ], 
	cstring,
	sgstring
	},
	cstring = 
		If[ 
			Length[fra] === 1,
			"",
			cyclesString @ 
			reduceAutomorphisms[
				PermutationCycles/@
				FusionRingAutomorphisms[ ring ]
			]
		];
		
	sgstring =
		If[ 
			Length[sfr] === 0,
			"",
			subGroupString[ ring ]
		];
		
	StringJoin[
		"# Fusion Rules\n\n",
		texTable @ SMT @ ring, 
		"\n",
		cstring,
		sgstring
	]
];	


(*====================================================================*)
Options[ sectionQuantumDimensions ] = {"SimplifyBy" -> Identity};

sectionQuantumDimensions[ring_FusionRing,opts:OptionsPattern[]] := 
With[{qds = FPDims[ring],tqds = FPDim[ring]},
	With[{
	sqds = EchoFunction[ "QDs", Identity ][OptionValue["SimplifyBy"] /@ qds ],
	stqds = EchoFunction["TQDS",Identity][OptionValue["SimplifyBy"] @ tqds] },
	StringJoin[
		"# Quantum Dimensions\n\n",
		wikiTable[
			Prepend[{ "Particle", "Numeric", "Symbolic" }] @ 
			prependParticles @
			Map[ 
				math @* ToString @* TeXForm,
				Transpose[ { N[ Append[ tqds ], 4 ] @ qds, Append[stqds] @ sqds } ],
				{2}
			]
		]
		]
	]
];

prependParticles[tab_] := 
With[{
    particles = Table[ math[ "\\mathbf{" <> ToString[i] <> "}" ], { i, Length[tab] - 1 }  ]
    },
    Transpose @
    Prepend[ Transpose[tab], Append[ math["\\mathcal{D}_{FP}^2"] ] @ particles ]
];


(*====================================================================*)
Options[ sectionCharacters ] = Options[sectionQuantumDimensions];
sectionCharacters[ ring_, opts:OptionsPattern[]] := 
Module[{
	assoTab = 
		sortedCharacterTable @
		ring,
	simplerChars
	},
	simplerChars = OptionValue["SimplifyBy"][ assoTab["Table"] ];
	StringJoin[
		"# Characters\n\n",
		"The symbolic character table is the following\n\n",
		texTable[ 
			EchoFunction[ "Characters", MatrixForm ][ simplerChars ], 
			"Header" -> assoTab["Header"],
			"Alignment" -> "c" 
			], 
		"\n\nThe numeric character table is the following\n\n",
		texTable[ N[assoTab["Table"],4], "Header" -> assoTab["Header"],"Alignment"->"r"]
	] // StringReplace["0.\\, +"~~x__ ~~" i":> x <> " i" ]
];

(* First sorts rows (characters) 
	by dimension, 
	then the real characters before the complex ones, 
	then by total real part (brings quantum dimensions to the top). 
	Then adds particle info.
  Then sorts columns (particles) 
  by increasing quantum dimension, 
  then by increasing value on the last (highest dimensional) character, keeping the vacuum first
*)

sortedCharacterTable[ ring_ ] := Module[{
	chars = FRC @ ring,
	sortRows = 
		SortBy[ { 
			First, 
			Total[ Abs[ Im[ N[#] ] ] ]&, 
			-Total[ Re[ N[#] ] ] & 
			} 
		],
	sortColumns = Function[ mat, 
		Transpose @ 
		SortBy[ Transpose[mat], { 
			#[[1]] =!= unicodeDigits[[2]]&, 
			N[#[[2]]]&, 
			N[#[[-1]]]&
			} 
		]],
		sortedTab
	}, 
	sortedTab = 
		chars // 
		sortRows //
		Prepend[ unicodeDigits[[#+1]]& /@ Range @ Rank @ ring ] //
		sortColumns;
	<|
	  "Table"  -> Rest[sortedTab],
		"Header" -> First[sortedTab]
	|>
]


(*====================================================================*)
Options[sectionModularData] = Options[sectionCharacters];
sectionModularData[ ring_, opts:OptionsPattern[] ] := 
With[{
	sLink = link[math["S"]<>"-matrices", "pages/Concepts/S-Matrix.md"],
	tLink = link["twist factors", "pages/Concepts/TwistFactors.md"]
	},
	StringJoin[
	"# Modular Data\n\n",
	If[ 
		ModularData[ ring ] == {}, 
		StringJoin[
			"This fusion ring does not have any matching ", 
			math["S"], "-and ", math["T"], "-matrices."
		],
		StringJoin[
			"The matching "<> sLink <>" and "<> tLink <>" are the following\n\n", 
			ModularTable[ ring, OptionValue["SimplifyBy"] ]
		]
	]
	]
];

ModularTable[ring_,simplify_] := 
	wikiTable[
		Prepend[ { math["S"]<>"-matrix", "Twist factors"} ] @
		(modDataRow[ring,simplify] /@ ModularData[ring])
	];

modDataRow[ring_,simplify_][modData_] := 
Module[{ 
	qdim = simplify[ Sqrt[FPDim[ring]] ],
	SMat,
	TMat,
	simplermat},
	{ SMat, TMat } = Values[ modData ];
	simplermat =  EchoFunction["ModData",MatrixForm] @ simplify[ qdim * SMat ];
	StringReplace["\n"->""] /@
	{ 
		math[	
		StringJoin @@ (
			ToString @* TeXForm /@ 
			{ 1/qdim, MatrixForm[ simplermat ] }
		)], 
		math[twistFactorsToString[ TMat ]]
	}
];

twistFactorsToString[ mat_ ] := 
	Module[{
	replaceCurly = StringReplace[{"\\{"->"(","\\}"->")"}]  @* ToString @* TeXForm,
	stringListToArray = 
	StringJoin[
		"\\begin{array}{l}",
		StringJoin @@ Riffle[ #," \\\\" ],
		"\\end{array}"
	]&
	},
		stringListToArray[ replaceCurly /@ mat ]
]


(*====================================================================*)
sectionAdjointFusionRing[ ring_FusionRing ] := 
	Module[ { adjRing, particlesString, ringName, alink, ucs },
		adjRing = 
			AdjointFusionRing[ ring ];
		
		ringName = 
			math @ wikiName @ adjRing[[2]];
		
		particlesString = 
			ParticlesString[adjRing[[1]]];
		
		alink = 
			"pages/Concepts/AdjointBasedSubring.md";
		
		ucs = Transpose @
			UCS[ring];
		
		
		StringJoin[
			"# Adjoint Subring\n\n",
			Which[ 
				EquivalentFusionRingsQ[adjRing[[2]],ring],
				"The "<>link[ "adjoint subring", alink ]<>" is the ring itself.",
				Rank[adjRing[[2]]] == 1,
				"The "<> link[ "adjoint subring", alink ]<>" is the trivial ring.", 
				True,
				StringJoin[
					"Particles ", 
					math[ particlesString ], 
					", form the ", 
					link[ "adjoint subring", alink ], 
					link[ ringName, "pages/FRPages/"<>ringFileName[adjRing[[2]]] ], 
					"."
				]
			],
			"\n\nThe ",
			link["upper central series", alink ],
			" is ",
			If[
				Length[ucs[[1]]] == 1,
				"trivial.",
				"the following:\n"<> ucsString[ucs]
			]
		]
	];
	
ucsString[ ucs_ ] := 
	Module[{ subParticles, subRings,supsetStrings, subRingStrings,sr },
		{ subParticles, subRings } =
			ucs;
		supsetStrings = 
			StringJoin[
				"\ \\underset{ ", 
				ParticlesString[ # ], 
				" }{\\supset} \ "
			]& /@
			Rest[subParticles];
		
		subRingStrings =
			wikiName[#,"Short"->True]& /@ 
			subRings;
		
		nmath[
		StringJoin@@
		Riffle[
			subRingStrings,
			supsetStrings
		]
		]
	];
	
ParticlesString[ ind_List ] :=
	StringRiffle[
		"\\mathbf{"<>ToString[#]<>"}"& /@ ind,
		", "
	];


(*====================================================================*)
sectionUniversalGrading[ ring_ ] :=
	Module[ { map, grp, mapString, groupName, multTab },
		{ map, grp } =
			UniversalGrading[ ring ];
		If[ 
			Rank[ grp ] == 1, 
			Return @
			StringJoin[ 
				"# Universal grading\n\n",
				"This fusion ring allows only the trivial grading." 
			]
		];
		
		mapString = 
			MapString[ map ];
		
		groupName = 
			math @ wikiName[ grp, "Short" -> True ];
		
		multTab = 
			texTable[ SMT[ grp ] ]//
			StringReplace["\\mathbf{"~~(x:NumberString)~~"}":>"\\mathbf{"<>x<>"}'"];
		
		StringJoin[ 
			"# Universal grading\n\n",
			"Each particle can be graded as follows: ",
			mapString,
			", where the degrees form the group ",
			groupName, 
			" with multiplication table:\n\n",
			multTab
		]
	];
	
MapString[ map_ ] := 
	Module[{degEq},
		degEq[ i_ -> j_ ] :=
			"\\text{deg}(\\mathbf{" <> ToString[i]<>"}) = \\mathbf{" <> ToString[j] <> "}'";
		math @ 
		StringRiffle[
			degEq /@ map, ", "
		]
	];


Options[sectionCategorifications] = { "SimplifyBy" -> Identity};
sectionCategorifications[ring_FusionRing, OptionsPattern[]] := 
Module[{fc, notcatString, catString, modularString, modCats, modString },

	fc = FC @ ring;
	
	catString = 
		If[ 
			FusionCategories[ring] === {}
			, (* THEN *)
			If[ 
				Rank[ring] <= 7 && Mult[ring] == 1, 
				"This fusion ring is not categorifiable.",
				"We have no data on categorifications of this fusion ring." 
			]
			, (* ELSE *)
			"The fusion ring has the following categorifications:\n\n" <> 
			"|Category|Data| | | | | |\n" <>
			"|:----|:----|:----:|:----:|:----:|:----:|:----:|\n" <>
			StringJoin @@ ( FusionTableRow /@ FusionCategories[ring] ) <>
			"\n\n"
		];
		Echo[OptionValue["SimplifyBy"];
	modCats = Select[ FusionCategories[ring], ModularQ ];
	modString = 
		If[ 
			Length @ modCats == 0,
			"None of these fusion categories are modular.",
			StringJoin[
				"Of these categories, 
				"ToString[ Length @ modCats ], 
				" are modular. They have the following data:\n\n",
				"|Category|Data| | | |\n" <>
				"|:----|:----|:----:|:----:|:----:|\n" <>
				StringJoin @@ ( modDataCatRow[ #, OptionValue["SimplifyBy"] ]& /@ modCats ),
				"\n\n"
			]
		];
	
	StringJoin[
		"# Categorifications\n\n",
		catString,
		modString
	]
];

FusionTableRow[ cat_ ] := 
	Module[ { fc, ns, rks, fpds, uS, bS, sS, rS, mS, fs, rs, names, ts, ss, dataDir, ds, zipfn },
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
		
		If[  
			Length[ names = Names @ FusionRing[ cat ] ] != 0,
			ns = "[ $$ [" <> ts[ TeXForm @ names[[1]] ] <> "]"<> ss <> " $$ "<>" ]({% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})",
			ns = "[ $$ [" <> fcToTexString[ fc[[;;4]] ]<>"]" <> ss <> " $$ "<>" ](% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})"
		];
		
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
		
		"| " <> StringRiffle[ { ns, ds, bS, uS, sS, rS, mS}, " | "  ] <> " |\n"
	] // FixLatex;
	
fcToTexString[ {a_,b_,c_,d_} ]:=
	"FR^{" <> ToString[a] <> "," <> ToString[b] <> "," <> ToString[c] <> "}_{" <> ToString[d] <> "}";

modDataCatRow[ cat_, simplify_ ] := 
	Module[ { fc, ns, rks, fpds, uS, bS, sS, rS, mS, fs, rs, names, ts, ss, dataDir, ds, zipfn, sMat, twists, sMatString, twistsString },
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
		
		If[  
			Length[ names = Names @ FusionRing[ cat ] ] != 0,
			ns = "[ $$ [" <> ts[ TeXForm @ names[[1]] ] <> "]"<> ss <> " $$ "<>" ]({% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})",
			ns = "[ $$ [" <> fcToTexString[ fc[[;;4]] ]<>"]" <> ss <> " $$ "<>" ](% link pages/FRPages/"<>CodeToFileName[ FusionRing @ cat]<>".md %})"
		];

		uS = If[ 
			UnitaryQ[cat], 
			"{::nomarkdown} <img src=\"/images/Unitary.png\" style=\"width:auto;height:40px;\"> {:/}", 
			"" 
		];
		
		{ sMat, twists } =  ModularData @ cat;
		
		{ sMatString, twistsString } = 
				modDataRow[ FusionRing @ cat, simplify ][ <| "SMatrix" -> sMat, "Twists" -> { Values @ twists } |> ];
			
		ds = "[data]({% link " <> zipfn <> " %})";
		
		"| " <> StringRiffle[ { ns, ds, uS, sMatString, twistsString }, " | "  ] <> " |\n"
	] // FixLatex;


FixLatex[str_String] := 
	str //
	StringReplace["\\unicode{22ca}" -> "\\rtimes "] //
	StringReplace[Shortest["\\text{$\\times $"~~x__~~"}"] :> "\\times \\text{"<>x<>"}" ] //
	StringReplace[Shortest["\\left.\\text{"~~x__~~"}"~~y__~~"\\right)"] :>"\\text{"<>x<>"} "<>y<>")" ] //
	StringReplace[Shortest["\\text{"~~x__~~"$\\times $"~~y__~~"}"] :> "\\text{"<>x<>"} \\times \\text{" <> y <> "}"] //
	StringReplace[Shortest["\\text{"~~P___~~"SU(2}"] :> "\\text{"<>P<>"SU}(2" ]//
	StringReplace[ "\\text{}" ->""] //
	StringReplace["Rep(}" -> "Rep}("] //
	StringReplace["TY(}" -> "TY}("] //
	StringReplace["HI(}" -> "HI}("] //
	StringReplace["Adj(}" -> "Adj}("];


sectionData[ring_FusionRing] := Module[{ dir, mtLink, qdsLink, characterLink, smatrixlinks, twistfactorslinks, nMats },
	dir= "data/FusionRings/" <> frPrefix[ring] <> "/";
	nMats = Length @ MD[ring];
	
	mtLink = link[ "Multiplication Table", dir <> "multtab.csv" ];
	qdsLink = link[ "Quantum Dimensions", dir <> "qdims.csv"];
	characterLink = link[ "Character Table", dir <> "chars.csv" ];

	smatrixlinks = 
		Table[ 
			link[ "S-Matrix " <> ToString[i], dir <> "smat_"<>ToString[i]<>".csv" ],
			{ i, nMats }
		];
		
	twistfactorslinks =
		Table[ 
			link[ "Twist Factors" <> ToString[i], dir <> "twistfactors_"<>ToString[i]<>".csv" ], 
			{ i, nMats }
		];
		  
	StringJoin[
		"# Data\n\n",
		"Download links for numeric data:\n",
		StringRiffle[
			{
			"",
			mtLink,
			qdsLink,
			characterLink,
			Sequence @@ 
			MapThread[ StringJoin, {smatrixlinks,Table[", ",{i,nMats}],twistfactorslinks} ]
			},
			"\n* "
		]
	]
]




(*QuietEcho[ 
	Export[ 
		"/home/gertvercleyen/Projects/anyonwiki.github.io/pages/FRPages/"<>ringFileName[#],
		RingPage[#],
		"TEXT"
	]&/@ Cases[FRL,r_/;Mult[r]===1]
]


QuietEcho@Table[
Print[r];
RingPage[r],
{r,Cases[FRL,r_/;Mult[r]===1]}];
*)


(* Fix sections on Adjoint subring table *)
filenames = FileNames[ All, "/Users/gertvercleyen/Projects/anyonwiki.github.io/pages/FRPages"];

fnToRing[fn_]:= FRBC @ ToExpression@StringReplace[fn, __~~"FR_"~~x__~~".md":> "{"<>StringReplace[x,"_"->","]<>"}"];
Monitor[
Do[
	str = Import[fn,"Text"];
	str2 = 
		StringReplace[
			str,
			"# Adjoint Subring" ~~ __ ~~ "# Universal" :> sectionAdjointFusionRing[SortedRing[fnToRing[fn]]] <> "\n\n# Universal"
		];
	Export[fn, str2, "Text" ]
	, { fn, filenames }
],
fn
]


sectionAdjointFusionRing[SortedRing @ FRBC @ {5,1,0,3}]


upperCentralSeries[ ring_FusionRing?FusionRingQ ] :=
  DeleteDuplicatesBy[
  Most @
  FixedPointList[
    AdjointFusionRing @* Last,
    { Range @ Rank @ ring, ring }
  ],Last
  ];




upperCentralSeries[ SortedRing @ FRBC @ {5,1,0,3} ]
