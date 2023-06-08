(* ::Package:: *)

Quit[]


Needs[ "WikiTools`", FileNameJoin[{NotebookDirectory[],"WikiTools.wl"}] ]
PacletDirectoryLoad["~/Projects"]
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
With[{qds = QD[ring],tqds = TQDS[ring]},
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
	qdim = simplify[ Sqrt[TQDS[ring]] ],
	SMat,
	TMat,
	simplermat},
	{ SMat, TMat } = Values[ modData ];
	simplermat =  simplify[ qdim * SMat ];
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
					particlesString, 
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
				Length[ucs[[1]]] == 2,
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
		
		math[
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


sectionCategorifications[ring_FusionRing] := 
With[{
	fc = FC[ring]},
	StringJoin[
		"# Categorifications\n\n",
		Which[ 
			(MemberQ[ fc ] @ notcat) && CommutativeQ[ring],
				"This fusion ring has no categorifications because of the [[Zero spectrum criterion|zero spectrum criterion]]",
			(MemberQ[ fc ] @ notuncat) && CommutativeQ[ring],
				"This fusion ring has no unitary categorifications because of the [[Commutative Schur product criterion|commutative Schur product criterion]]",
			True,
				""
		]
	]
];

notcat = Developer`ToPackedArray @ Import["/home/gertvercleyen/Projects/anyoncatalog/FusionRings/notcat.wdx"];
notuncat = Developer`ToPackedArray @ Import["/home/gertvercleyen/Projects/anyoncatalog/FusionRings/notuncat.wdx"];


sectionData[ring_FusionRing] := Module[{ dir, mtLink, qdsLink, characterLink, smatrixlinks, twistfactorslinks, nMats },
	dir= "data/FusionRings/"<> frPrefix[ring] <> "/";
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


QuietEcho[ 
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

