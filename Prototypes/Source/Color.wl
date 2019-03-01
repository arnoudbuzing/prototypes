RGBColor255[r_Integer, g_Integer, b_Integer] := RGBColor[r/255., g/255., b/255.];
RGBColor255[r_Integer, g_Integer, b_Integer, a_Integer] := RGBColor[r/255., g/255., b/255., a/255.];

Redder[color_, fraction_:1/3] := Blend[{color, Red}, fraction];
Bluer[color_, fraction_:1/3] := Blend[{color, Blue}, fraction];
Greener[color_, fraction_:1/3] := Blend[{color, Green}, fraction];
Yellower[color_, fraction_:1/3] := Blend[{color, Yellow}, fraction];
Oranger[color_, fraction_:1/3] := Blend[{color, Orange}, fraction];
Pinker[color_, fraction_:1/3] := Blend[{color, Red}, fraction];
Purpler[color_, fraction_:1/3] := Blend[{color, Purple}, fraction];
Blacker[color_, fraction_:1/3] := Blend[{color, Black}, fraction];
Grayer[color_, fraction_:1/3] := Blend[{color, Gray}, fraction];
Whiter[color_, fraction_:1/3] := Blend[{color, White}, fraction];
