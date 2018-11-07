SetAutoStyleOptions[n_] := With[{c = ColorData[n]},
  SetOptions[$FrontEnd, AutoStyleOptions -> {
    "SymbolContextStyles" -> {"System`" -> {FontColor -> c[22]}, "Global`" -> {FontColor -> c[23]}, Automatic -> {FontColor -> c[24]}},
     "CommentStyle" -> {FontColor -> c[1], ShowAutoStyles -> False, ShowSyntaxStyles -> False, AutoNumberFormatting -> False, TranslationOptions -> {"Enabled" -> False}, FontWeight -> "Normal"},
     "EmphasizedSyntaxErrorStyle" -> {FontColor -> c[2], Background -> White},
     "ExcessArgumentStyle" -> {FontColor -> c[3]},
     "FormattingErrorStyle" -> {FontColor -> c[4], Background -> White},
     "FunctionLocalVariableStyle" -> {FontColor -> c[5]},
     "GlobalToLocalScopeConflictStyle" -> {FontColor -> c[6]},
     "GraphicsCompatibilityProblemStyle" -> {FontColor -> c[7]},
     "LocalScopeConflictStyle" -> {FontColor -> c[8]},
     "LocalVariableStyle" -> {FontColor -> c[9]},
     "MissingArgumentStyle" -> {FontColor -> c[10]},
     "MissingArgumentTemplateStyle" -> {FontColor -> c[11], FontSlant -> "Italic", ShowAutoStyles -> False, ShowSyntaxStyles -> False, AutoNumberFormatting -> False, TranslationOptions -> {"Enabled" -> False}, FontFamily -> "Times", FontWeight -> Plain},
     "MisspelledWordStyle" -> {FontColor -> c[12]},
     "NoKernelPresentStyle" -> {FontColor -> c[13]},
     "OrderOfEvaluationConflictStyle" -> {FontColor -> c[14]},
     "PatternVariableStyle" -> {FontColor -> c[15], FontSlant -> "Italic"},
     "StringStyle" -> {FontColor -> c[16], ShowAutoStyles -> False, ShowSyntaxStyles -> False, AutoNumberFormatting -> False, TranslationOptions -> {"Enabled" -> False}},
     "SymbolShadowingStyle" -> {FontColor -> c[17]},
     "SyntaxErrorStyle" -> {FontColor -> c[18]},
     "UndefinedSymbolStyle" -> {FontColor -> c[19]},
     "UnknownOptionStyle" -> {FontColor -> c[20]},
     "UnwantedAssignmentStyle" -> {FontColor -> c[21]},
     "FormattingErrorTooltips" -> True,
     "HighlightComments" -> True,
     "HighlightEmphasizedSyntaxErrors" -> True,
     "HighlightExcessArguments" -> True,
     "HighlightFormattingErrors" -> True,
     "HighlightFunctionLocalVariables" -> True,
     "HighlightGlobalToLocalScopeConflicts" -> True,
     "HighlightGraphicsCompatibilityProblems" -> True,
     "HighlightLocalScopeConflicts" -> True,
     "HighlightLocalVariables" -> True,
     "HighlightMissingArguments" -> True,
     "HighlightMissingArgumentsWithTemplate" -> False,
     "HighlightMisspelledWords" -> False,
     "HighlightNoKernelPresent" -> True,
     "HighlightOrderOfEvaluationConflicts" -> True,
     "HighlightPatternVariables" -> True,
     "HighlightStrings" -> True,
     "HighlightSymbolContexts" -> True,
     "HighlightSymbolShadowing" -> True,
     "HighlightSyntaxErrors" -> True,
     "HighlightUndefinedSymbols" -> True,
     "HighlightUnknownOptions" -> True,
     "HighlightUnwantedAssignments" -> True
     }];
     SetOptions[$FrontEnd,Background->Black];
     SetOptions[$FrontEnd,FontColor->c[25]];
     SetOptions[$FrontEnd,PanelBoxOptions->{Background->c[26]}];
     SetOptions[$FrontEnd,ButtonBoxOptions->{Background->c[26]}];
     SetOptions[$FrontEnd,CheckboxBoxOptions->{Background->c[26]}];
     SetOptions[$FrontEnd,PaneSelectorBoxOptions->{Background->c[26]}];
  ]




(*

{ActionMenuBoxOptions, AdjustmentBoxOptions, AnimatorBoxOptions, \
BezierCurve3DBoxOptions, BezierCurveBoxOptions, \
BSplineCurve3DBoxOptions, BSplineCurveBoxOptions, \
BSplineSurface3DBoxOptions, ButtonBoxOptions, CheckboxBoxOptions, \
ColorSetterBoxOptions, Graphics3DBoxOptions, Graphics3DBoxOptions, \
Graphics3DBoxOptions, Graphics3DBoxOptions, \
FrontEnd`Graphics3DBoxOptionsMethod, ConicHullRegion3DBoxOptions, \
ConicHullRegionBoxOptions, CounterBoxOptions, DynamicBoxOptions, \
DynamicModuleBoxOptions, DynamicWrapperBoxOptions, ErrorBoxOptions, \
FilledCurveBoxOptions, FormBoxOptions, FractionBoxOptions, \
FrameBoxOptions, GeometricTransformation3DBoxOptions, \
GeometricTransformationBoxOptions, Graphics3DBoxOptions, \
GraphicsBoxOptions, GraphicsComplex3DBoxOptions, \
GraphicsComplexBoxOptions, GraphicsGroup3DBoxOptions, \
GraphicsGroupBoxOptions, GridBoxOptions, HexahedronBoxOptions, \
InputFieldBoxOptions, Inset3DBoxOptions, InsetBoxOptions, \
InterpretationBoxOptions, JoinedCurveBoxOptions, Line3DBoxOptions, \
LineBoxOptions, ListPickerBoxOptions, LocatorBoxOptions, \
LocatorPaneBoxOptions, MultiscriptBoxOptions, NamespaceBoxOptions, \
OpenerBoxOptions, OptionValueBoxOptions, OverlayBoxOptions, \
OverscriptBoxOptions, PaneBoxOptions, PanelBoxOptions, \
PaneSelectorBoxOptions, Point3DBoxOptions, PointBoxOptions, \
Polygon3DBoxOptions, PolygonBoxOptions, PopupMenuBoxOptions, \
PrismBoxOptions, ProgressIndicatorBoxOptions, PyramidBoxOptions, \
RadicalBoxOptions, RadioButtonBoxOptions, Raster3DBoxOptions, \
RasterBoxOptions, RectangleBoxOptions, RefBoxOptions, \
RotationBoxOptions, SetterBoxOptions, Slider2DBoxOptions, \
SliderBoxOptions, SqrtBoxOptions, SubscriptBoxOptions, \
SubsuperscriptBoxOptions, SuperscriptBoxOptions, TableViewBoxOptions, \
TabViewBoxOptions, TagBoxOptions, TemplateBoxOptions, \
TetrahedronBoxOptions, Text3DBoxOptions, TogglerBoxOptions, \
TubeBezierCurveBoxOptions, TubeBoxOptions, \
TubeBSplineCurveBoxOptions, UnderoverscriptBoxOptions, \
UnderscriptBoxOptions, ValueBoxOptions, XSplineCurveBoxOptions}

*)
