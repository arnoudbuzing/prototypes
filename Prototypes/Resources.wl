$LocalResourceObjects := Map[ ResourceObject, ResourceSystemClient`Private`$localResources];

ResourceObjectManager[resources_] := Module[{},
  Panel @ TextGrid[
   Map[
    {
      With[{object = #},
       DynamicModule[{state},
        state =
         Button["Delete", DeleteObject[object]; state = "Deleted", Appearance->"Palette"];
        Dynamic[state]]],
      #["Name"]
      } &, resources]
      ,Alignment->Left]
];

ResourceObjectDataset[resources_] := Dataset[
  Map[
    Function[{object},
      AssociationMap[ Function[{property}, object[property]], {"ResourceType", "Name", "Description"}]
    ],
    resources
  ]
];


DeletePersistentObjects[] := Module[{objects},
  objects = PersistentObjects[All, #] & /@ {"KernelSession", "FrontEndSession", "Notebook", "Local", "LocalShared", "Cloud"};
  PrintTemporary["Found: " <> ToString[Length[Flatten[objects]]] <> " persistent objects"];
  Map[Map[DeleteObject, #] &, objects];
];
