CreateNotebookRenderAPI[] := Module[  {function,api,form},
  function = Function[ Module[{nb, co}, nb = Import[URLDownload[#url]]; co = CloudPublish[nb]; HTTPRedirect[First[co]] ]];
  api = APIFunction[{"url" -> "String"}, function, "CloudCDF"];
  CloudDeploy[api, CloudObject["api/render-notebook"],  Permissions -> "Public"];
  form = FormFunction[{"url" -> "String"}, function, "CloudCDF"];
  CloudDeploy[form, CloudObject["form/render-notebook"],  Permissions -> "Public"];
];

RenderOnlineNotebook[ url_ ] :=  Module[{},
  If[ Not @ $CloudConnected, CloudConnect[] ];
  SystemOpen[ First[$CloudRootDirectory] <> "/api/render-notebook?url=" <> URLEncode[url]];
];
