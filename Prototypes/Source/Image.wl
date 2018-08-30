(* image extensions *)

ImageStrictlyPortraitQ[image_Image] := Less @@ ImageDimensions[image]
ImageStrictlyPortraitQ[___] := False

ImagePortraitQ[image_Image] := LessEqual @@ ImageDimensions[image]
ImagePortraitQ[___] := False

ImageStrictlyLandscapeQ[image_Image] := Greater @@ ImageDimensions[image]
ImageStrictlyLandscapeQ[___] := False

ImageLandscapeQ[image_Image] := GreaterEqual @@ ImageDimensions[image]
ImageLandscapeQ[___] := False

ImageSquareQ[image_Image] := Equal @@ ImageDimensions[image]
ImageSquareQ[___] := False

Image3DCubeQ[image_Image3D] := Equal @@ ImageDimensions[image]
Image3DCubeQ[___] := False

ImageCropResize[image_Image, dims_List] := First[ ConformImages[ {image}, dims, "Fill"]]
ImageCropResize[___] := $Failed

AlphaChannelQ[image_Image] := If[RemoveAlphaChannel[image] == image, False, True]
AlphaChannelQ[image_Image3D] := If[RemoveAlphaChannel[image] == image, False, True]
AlphaChannelQ[___] := False


(* animations *)

CreateGIFAnimation[
  name_String /; StringEndsQ[name, ".gif"],
  list_List] := Module[{object},
  object = CloudObject["animations/" <> name];
  Export[object, list, "GIF"];
  SetPermissions[object, "Public"];
  object
  ];


CaptureFromIPCamera[ffmpeg_String, rtsp_String] := 
 Module[{tmp, result},
  tmp = CreateFile[CreateUUID[] <> ".jpg"];
  RunProcess[{ffmpeg, "-y", "-i", rtsp, "-vframes", "1", tmp}];
  result = Import[tmp];
  DeleteFile[tmp];
  result
  ]
