(* general extensions *)

InformationDataset[pattern_] :=  Dataset[Association[ Map[ Function[ # -> ToExpression[# <> "::usage"] ],  Names[pattern]]]];

(* patterns *)

UnmatchQ[expr___] := Not[MatchQ[expr]];

(* language *)

By[head_, data_, func_] := head[ Map[func,data] ];

(* statistics *)

MeanBy[ data_, func_ ] := By[ Mean, data, func];
MedianBy[ data_, func_ ] := By[ Median, data, func];
StandardDeviationBy[ data_, func_ ] := By[ StandardDeviation, data, func ];
VarianceBy[ data_, func_ ] := By[ Variance, data, func ];
CommonestBy[ data_, func_ ] := By[ Commonest, data, func ];
MaxBy[ data_, func_ ] := By[ Max, data, func ];
MinBy[ data_, func_ ] := By[ Min, data, func ];

Rarest[ data_ ] := MinimalBy[Tally[data], Last][[All, 1]];
RarestBy[ data_, func_ ] := By[ Rarest, data, func];


(* random extensions *)
RandomGeoPosition[] := GeoPosition[{RandomReal[{-90, 90}], RandomReal[{-180, 180}]}];


(* typesetting *)

Uniconize[icon_IconizedObject] := First[icon];

(* more parts *)
Second[expr_] := Part[expr,2];
Third[expr_] := Part[expr,3];
Fourth[expr_] := Part[expr,4];
Fifth[expr_] := Part[expr,5];
Sixth[expr_] := Part[expr,6];
Seventh[expr_] := Part[expr,7];
Eighth[expr_] := Part[expr,8];
Ninth[expr_] := Part[expr,9];
Tenth[expr_] := Part[expr,10];
NextToLast[expr_] := Part[expr,-2];
Ultimate[expr_] := Part[expr,-1];
Penultimate[expr_] := Part[expr,-2];
Antepenultimate[expr_] := Part[expr,-3];

Attributes[ElapsedTime] = {HoldRest};
ElapsedTime[unit_,expr_] := UnitConvert[ Quantity[First[AbsoluteTiming[expr]], "Seconds"], unit];


Deconstruct[e_] := Level[e, {-1}, Heads -> True]
