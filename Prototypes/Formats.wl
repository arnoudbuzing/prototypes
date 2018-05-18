FormatDetect[ format_String, data:(_String|_List|_ByteArray)] := Module[ {ba},
  ba = Switch[ data,
    _String, StringToByteArray[data],
    _List, ByteArray[data],
    _ByteArray, data
  ];
  Which[
    format === "PNG", SameQ[ ba, ByteArray[{137, 80, 78, 71, 13, 10, 26, 10}] ],
    format === "JPEG" || format === "JPG", SameQ[ ba, ByteArray[{255,216,255}] ],
    format === "GIF", SameQ[ ba, ByteArray[{71,73,70,56}] ]
  ]
]
