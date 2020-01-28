
(*
JavaInstall["Batik"] := Module[{source, zip, dir, jar},
  source = "http://www.apache.org/dyn/closer.cgi?filename=/xmlgraphics/batik/binaries/batik-bin-1.12.zip&action=download";
  zip = FileNameJoin[{$HomeDirectory, "Downloads", "batik-bin-1.12.zip"}];
  If[FileType[zip] === File, DeleteFile[zip]];
  URLDownload[source, zip];
  dir = FileNameJoin[{$UserBaseDirectory, "ApplicationData", "Java"}];
  If[FileType[dir] =!= Directory, CreateDirectory[dir, CreateIntermediateDirectories -> True]];
  ExtractArchive[zip, dir, OverwriteTarget -> True];
  jar = FileNameJoin[{dir, "batik-1.12"}]; AddToClassPath[jar];
  jar
];
*)

$JavaSourceDirectory = DirectoryName[$InputFileName];
AddToClassPath[ FileNameJoin[{$JavaSourceDirectory,"Apache-Batik"}] ];

JavaImport[filename_String, options___] := Module[{batikDirectory, file, input, stream, output, tmp, transcoder, res},
  JavaBlock[
    file = JavaNew["java.io.File", filename]@toURL[]@toString[];
    input = JavaNew["org.apache.batik.transcoder.TranscoderInput", file];
    tmp = CreateFile[];
    stream = JavaNew["java.io.FileOutputStream", tmp];
    output = JavaNew["org.apache.batik.transcoder.TranscoderOutput", stream];
    transcoder = JavaNew["org.apache.batik.transcoder.image.PNGTranscoder"];
    (* transcoder@addTranscodingHint[PNGTranscoder`KEYUWIDTH, JavaNew["java.lang.Float", 2000.0]]; *)
    transcoder@transcode[input, output];
    stream@flush[];
    stream@close[];
    res = Import[tmp];
    DeleteFile[tmp];
    {"Image" -> res}
  ]
];
