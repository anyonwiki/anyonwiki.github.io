(* ::Package:: *)

<<Anyonica`
Needs[ "WikiTools`", FileNameJoin[{NotebookDirectory[],"WikiTools.wl"}] ]


(* Generate a table of fusion rings *)
ringFileName[ ring_ ] := 
	StringRiffle[ 
		Prepend["FR"] @ ( ToString /@ FC[ring] )
		,
		"_"
	] <> ".md";
	
ringRow[ r_FusionRing, propList_List, dir_ ] :=
	tableRow[ 
		Prepend[ link[ math[ wikiName[r] ], dir <> ringFileName[r] ] ] @
		Map[
			ToString, 
			Through[propList[r]]
		]
	];
	
ringTable[ listOfRings_, propList_, header_, address_ ] := 
	StringRiffle[ 
		Prepend[ tableHeader[header] ] @ 
		Table[
			ringRow[ ring, propList, address ],
			{ ring, listOfRings }
		]
		,
		"\n"
	]


(* Generate the data files *)
exportListString[ list_List ] := 
	StringJoin @@ Riffle[ ToString /@ list, ", " ];

exportMatrixString[ mat_?MatrixQ ] := With[{
		rowToString = Append[ Riffle[ ToString /@ #, ", "], "\n" ]&
	},
	StringDrop[
		StringJoin @ Flatten @ (
			rowToString /@ mat
		),
		-1
	]
];
	
(* Multiplication table *)
exportTensorString[ tab_ ] := 
	With[{
		matrixToSparseFormat = Most[ ArrayRules[ SparseArray[ # ] ] ]/.HoldPattern[ {a__} -> x_ ] :> { a, x }&,
		rowToString = Append[ Riffle[ ToString /@ #, ", "], "\n" ]&
	},
	StringDrop[
		StringJoin @ Flatten @ (
			rowToString /@ matrixToSparseFormat[tab]
		),
		-1
	]
]

exportRingData[ dir_String ][ r_FusionRing ] := Module[{
	ets = exportTensorString,
	ems = exportMatrixString,
	els = exportListString, 
	stNames, 
	stData,
	QDData,
	pref,
	ring
	},
	ring = SortedRing[r];	
	stNames = STNames[ MD[ ring ] ];
	stData  = STData[ MD[ ring ] ];
	QDData  = Append[ N[ FPDim[ring], 16 ] ] @ N[ FPDims[ring], 16 ];
	pref = frPrefix[ring];
	
	CreateDirectory[ FileNameJoin[ { dir, pref } ] ];
	(* Export multtab *)
	Export[
		FileNameJoin[ { dir, pref, "multtab.csv" } ],
		ets[ MT[ ring ] ],
		"Text"
	];
	
	(* Export quantum dimensions *)
	Export[
		FileNameJoin[ { dir, pref, "qdims.csv" } ],
		els[ QDData ],
		"Text"
	];
	
	(* Export character data *)
	Export[
		FileNameJoin[ { dir, pref, "chars.csv" } ],
		ems[ N[FRC[ ring ], 16 ] ],
		"Text"
	];

	(* Export S and T matrices *)
	MapThread[
		Export[
			FileNameJoin[ { dir, pref, #1 <> ".csv" } ], 
			#2,
			"Text"
		]&,
		{ stNames, stData }
	];
];

STNames[ modularData_ ] := With[{
	nTATab = (Length @ Values[#][[2]])& /@ modularData,
	nSMats = Length[modularData] },
	Join[ 
		("smat_" <> ToString[#])& /@ Range[ nSMats ],
		("twistfactors_" <> ToString[#])& /@ Range[nSMats]
	]
];

STData[ modularData_ ] := With[{
	nTATab = (Length @ Values[#][[2]])& /@ modularData,
	nSMats = Length[modularData] 
	},
	Join[
		exportMatrixString[ N[ #["SMatrix"], 16 ] ]& /@ modularData,
		exportMatrixString[ N[ #["TwistFactors"], 16 ] ]& /@ modularData
	]
]


exportRingData["~/Projects/anyonwiki.github.io/data/FusionRings"] /@ Cases[FRL,r_/;Mult[r]===1];


exportRingData["~/Tests/anyonwiki.github.io/data/FusionRings"] /@ FRL[[;;100]];
