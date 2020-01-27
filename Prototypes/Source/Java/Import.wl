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

JavaImport[in_String, "SVG", Method -> "ApacheBatik"] := Module[{file, input, stream, output, tmp, transcoder, res},
  JavaBlock[
    If[Length[Select[JavaClassPath[], StringContainsQ["batik-1.12"]]] == 0, AddToClassPath[ FileNameJoin[{$UserBaseDirectory, "ApplicationData", "Java", "batik-1.12"}]]];
    file = JavaNew["java.io.File", in]@toURL[]@toString[];
    input = JavaNew["org.apache.batik.transcoder.TranscoderInput", file];
    tmp = CreateFile[];
    stream = JavaNew["java.io.FileOutputStream", tmp];
    output = JavaNew["org.apache.batik.transcoder.TranscoderOutput", stream];
    transcoder = JavaNew["org.apache.batik.transcoder.image.PNGTranscoder"];
    transcoder@transcode[input, output];
    stream@flush[];
    stream@close[];
    res = Import[tmp];
    DeleteFile[tmp];
    res
  ]
];
