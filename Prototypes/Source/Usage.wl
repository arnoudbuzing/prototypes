InformationDataset::usage = "InformationDataset[ pattern ] gives usage information for functions matching the string pattern";
ImportFiles::usage = "ImportFiles[files, ...] evaluates as Map[Import, files]";
ImportDirectory::usage = "ImportDirectory[dir] imports all files in 'dir'. ImportDirectory[dir,patt] imports all files that match string pattern 'patt'";
GetFiles::usage = "GetFiles[files] evaluates as Map[Get, files]";
DirectoryFileList::usage = "DirectoryFileList[dir] returns all files under directory 'dir' and all its subdirectories";
DirectoryByteCount::usage = "DirectoryByteCount[dir] returns the byte count for directory 'dir'";
DirectorySize::usage = "DirectorySize[dir] returns the byte count for 'dir' as a quantity";
ToStringFileName::usage = "ToStringFileName[file] rewrites file as a classical string filename";
URLHash::usage = "URLHash[url] gives the hash for the content stored at the url";
$InputDirectoryName::usage = "$InputDirectoryName is the directory name for the current value of $InputFileName";
$ExtensionToFormat::usage = "$ExtensionToFormat associates file extensions with their format name";
$FormatToExtension::usage = "$FormatToExtension associates a file format with its list of supported file extensions";
SystemStringOpen::usage = "SystemStringOpen[string] determines the file format for 'string' and opens it with the default application";
(* animation *)
CreateGIFAnimation::usage = "CreateGIFAnimation[name,list] creates a GIF from 'list' and saves it in the Wolfram Cloud";
(* patterns *)
UnmatchQ::usage = "UnmatchQ[expr,form] is the same as Not[MatchQ[expr,form]]";
(* general language *)
By::usage = "By[head, data, func] evaluates as head[Map[func,data]]";
Deconstruct::usage = "Deconstruct[expr] returns the head and arguments of 'expr' as a list; Equivalent to Level[expr,{-1},Heads->True]";
(* statistics *)
MeanBy::usage = "MeanBy[data, func] computes the mean of 'data' by using 'func'";
StandardDeviationBy::usage = "StandardDeviationBy[data, func] computes the standard deviation of 'data' by using 'func'";
MedianBy::usage = "MedianBy[data, func] computes the median of 'data' by using 'func'";
VarianceBy::usage = "VarianceBy[data, func] computes the variance of 'data' by using 'func'";
CommonestBy::usage = "CommonestBy[data, func] computes the commonest value of 'data' by using 'func'";
MinBy::usage = "MinBy[data, func] computes the minimum value of 'data' by using 'func'";
MaxBy::usage = "MaxBy[data, func] computes the maximum value of 'data' by using 'func'";
RarestBy::usage = "RarestBy[data, func] computes the rarest (least common) values of 'data' by using 'func'";
Rarest::usage = "Rarest[data] computes the rarest (least common) values of 'data'";
(* data science *)
DatasetMap::usage = "DatasetMap[func, expr] evaluates as Dataset[AssociationMap[func, expr]]";
DatasetImport::usage = "DatasetImport[file, ...] evaluates as Dataset[Import[ file, ...]]";
DatasetImportFiles::usage = "DatasetImportFiles[files, ...] evaluates as Map[Dataset, ImportFiles[files, ...]]";
(* strings *)
MakeString::usage = "MakeString[expr] turns the unevaluated form of 'expr' into an InputForm string";
StringFirst::usage = "StringFirst[string] returns the first character of 'string'";
StringLast::usage = "StringLast[string] returns the last character of 'string'";
StringRest::usage = "StringRest[string] returns string with the first character removed";
StringMost::usage = "StringMost[string] returns string with the last character removed";
CapitalizeSentences::usage = "CapitalizeSentences[string] capitalizes sentences in the given 'string'";
StringSwap::usage = "StringSwap[string, a \[TwoWayRule] b] swaps 'a' and 'b' in 'string'";
$UUIDStringPattern::usage = "$UUIDStringPattern will StringMatchQ a valid UUID";
(* geographics *)
RandomGeoPosition::usage = "RandomGeoPosition[] picks a random geo position";
(* color *)
RGBColor255::usage = "RGBColor[r,g,b] specifies color using RGB values from the range 0-255";
(* image processing *)
ImageStrictlyPortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than the image height";
ImagePortraitQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is less than or equal to the image height";
ImageStrictlyLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than the image height";
ImageLandscapeQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is greater than or equal to the image height";
ImageSquareQ::usage = "ImageStrictlyPortraitQ[image] returns True if the image width is equal to the image height";
Image3DCubeQ::usage = "Image3DCubeQ[image] returns True if the image width, height, and depth are all equal";
ImageCropResize::usage = "ImageCropResize[image, dims] crops and resize an image to the specified dimensions";
AlphaChannelQ::usage = "AlphaChannelQ[image] returns True if the image has an alpha channel";
CaptureFromIPCamera::usage = "CaptureFromIPCamera[ffmpeg,rtsp] captures a single image from 'rtsp' stream, using external 'ffmpeg' tool";
(* typesetting *)
Uniconize::usage = "Uniconize[icon] turns IconizedObject icon and returns the associated expression";
BoxSyntaxQ::usage = "BoxSyntaxQ[boxes] returns True if the gives boxes can be transformed into an expression without errors, and False otherwise";
ClickToCopy::usage = "ClickToCopy[expr] gives a button which puts 'expr' on the clipboard when clicked";
CopyAsBitmap::usage = "CopyAsBitmap[expr] copies 'expr' as a bitmap";
(* paclet build utilities *)
PacletInformationDataset::usage = "PacletInformationDataset[paclet] returns paclet information as a dataset";
(* github utilities *)
BuildWikiDocumentation::usage = "BuildWikiDocumentation[directory,context] creates wiki pages for the symbols in the given context";
$BuildInfo::usage = "$BuildInfo gives build and version information as a textual string";
BuildInfo::usage = "BuildInfo[] copies build information to the clipboard and returns a button which does the same copy operation";
(* dock *)
DockButton::usage = "DockButton[name] represents a button that can be added to the Prototype dock";
$DockButtons::usage = "$DockButtons is a list of defined dock buttons";
CreateDock::usage = "CreateDock[] adds a dock with useful buttons to your notebook session";
CreateDockButton::usage = "CreateDockButton[ assoc ] creates a new dock button from association 'assoc' and add it to $DockButtons";
(* resources *)
$LocalResourceObjects::usage = "$LocalResourceObjects gives the current local resource objects on your machine";
ResourceObjectManager::usage = "ResourceObjectManager[objects] gives an interface to manage resource objects";
ResourceObjectDataset::usage = "ResourceObjectDataset[objects] gives resource 'objects' as a dataset";
DeletePersistentObjects::usage = "DeletePersistentObjects[] locates and permanently deletes all persistent objects on your local file system (this can not be undone)";
(* shortcut directory names *)
$AppDataDirectory::usage = "$AppDataDirectory (Windows only) typically points to $HomeDirectory\\AppData";
$LocalAppDataDirectory::usage = "$LocalAppDataDirectory (Windows only) typically points to $HomeDirectory\\AppData\\Local";
$RoamingAppDataDirectory::usage = "$RoamingAppDataDirectory (Windows only) typically points to $HomeDirectory\\AppData\\Roaming";
(* ordinal parts *)
Second::usage = "Second[expr] gives Part[expr,2]";
Third::usage = "Third[expr] gives Part[expr,3]";
Fourth::usage = "Fourth[expr] gives Part[expr,4]";
Fifth::usage = "Fifth[expr] gives Part[expr,5]";
Sixth::usage = "Sixth[expr] gives Part[expr,6]";
Seventh::usage = "Seventh[expr] gives Part[expr,7]";
Eighth::usage = "Eighth[expr] gives Part[expr,8]";
Ninth::usage = "Ninth[expr] gives Part[expr,9]";
Tenth::usage = "Tenth[expr] gives Part[expr,10]";
NextToLast::usage = "NextToLast[expr] gives Part[expr,-2]";
Ultimate::usage = "Ultimate[expr] gives Part[expr,-1]";
Penultimate::usage = "Penultimate[expr] gives Part[expr,-2]";
Antepenultimate::usage = "Antepenultimate[expr] gives Part[expr,-3]";
ElapsedTime::usage = "ElapsedTime[unit,expr] evaluates 'expr' and returns the elapsed time in the specified unit";
CreateNotebookIndex::usage = "CreateNotebookIndex[] creates a SearchIndexObject of all notebooks located in $InstallationDirectory";
QuickSearch::usage = "QuickSearch[] provides a quick interactive way to search all notebooks under $InstallationDirectory. You need to run CreateNotebookIndex[] once before using this function";
(* entities *)
EntityPropertiesDataset::usage = "EntityPropertiesDataset[entity] creates a dataset for the supported properties for 'entity'";
(* wolfram alpha *)
WolframBeta::usage = "WolframBeta[input] translates 'input' to English, then calls WolframAlpha with the translation";
NotebookTranslate::usage = "NotebookTranslate[nb, lang] translates 'nb' to the specified language 'lang' using TextTranslation";
FileTranslate::usage = "FileTranslate[file,lang] translates 'file' to the specified langugage 'lang' using TextTranslation";
TranslationCell::usage = "TranslationCell[text,lang] prints a \"Text\" cell containing 'text' with an attached button which lets you toggle between English and language 'lang'";
(* geographics *)
GeoService::usage = "GeoService[name] provides GeoServer 'name' for geographical functions. Use GeoService[\"Properties\"] for a list. Use with GeoServer option.";
LayeredGeoGraphics::usage = "LayeredGeoGraphics[primitives,layers] creates a layered GeoGraphics map for the specified GeoService layers";
FormatDetect::usage = "FormatDetect[format,data] checks if 'data' (String/List/ByteArray) matches 'format' (PNG/JPG/GIF)";
(* cloud *)
CreateNotebookRenderAPI::usage = "CreateNotebookRenderAPI[] creates the cloud api functions used by RenderOnlineNotebook";
RenderOnlineNotebook::usage = "RenderOnlineNotebook[url] reads 'url' and opens a private editable copy";
(* prototype *)
Prototype::usage = "Prototype[\"symbol\"] modifies System 'symbol' in a custom way. The modified behavior is printed to the session";
FilePartition::usage = "FilePartition[file,size] partitions 'file' into chunks with the given 'size' and places them in a new directory";
FileJoin::usage = "FileJoin[dir,file] combines binary part files in 'dir' into a single 'file'";
FilePattern::usage = "FilePattern is an option to FileJoin which specifies which files to include";
Antonyms::usage = "Antonyms[word] gives the list of antonyms for 'word'";
Synonyms::usage = "Synonyms[word] gives the list of synonyms for 'word'";
NounQ::usage = "NounQ[word] gives True if 'word' is a noun and False otherwise";
VerbQ::usage = "VerbQ[word] gives True if 'word' is a verb and False otherwise";
AdjectiveQ::usage = "AdjectiveQ[word] gives True if 'word' is an adjective and False otherwise";
AdverbQ::usage = "AdverbQ[word] gives True if 'word' is an adverb and False otherwise";
StringIntersection::usage = "StringIntersection[s1,s2] gives a string containing only the characters that are both in 's1' and 's2'";
StringComplement::usage = "StringComplement[s1,s2] gives the string containing characters in 's1' but not in 's2'";
StringUnion::usage = "StringUnion[s1,s2] gives the string of characters in either 's1' or 's2'";
StringDisjointQ::usage = "StringDisjointQ[s1,s2] gives True if 's1' and 's2' have no characters in common and False otherwise";
StringIntersectingQ::usage = "StringIntersectingQ[s1,s2] gives True if 's1' and 's2' have characters in common and False otherwise";
StringSort::usage = "StringSort[s1] gives a sorted string of the characters in 's1'";

(* random *)
RandomWikipediaData::usage = "RandomWikipediaData[] gives a randomly selected Wikipedia article";
RandomRomanNumeral::usage = "RandomRomanNumeral[...] gives a random Roman numeral, using the same usage as RandomInteger";
RandomDelete::usage = "RandomDelete[expr,pattern] randomly deletes positions of 'expr' which match 'pattern'";
RandomPosition::usage = "RandomPosition[expr,pattern] gives a randomly selected position of 'expr' which matches 'pattern'";

(* Service *)
What3Words::usage = "What3Words[location] and What3Words[words] use the What3Words service to turn words into geographical locations and vice versa";
OpenSky::usage = "OpenSky[location,range] gives a map of airplanes within 'range' of 'location'";
(* Crypto *)
$HashTypes::usage = "$HashTypes gives the list of supported hash types";

(* Primes *)
PrimeCount::usage = "PrimeCount[n] gives the number of primes less than or equal to 'n'. Uses binaries from: https://github.com/kimwalisch/primecount";
PrimeSum::usage = "PrimeSum[n] gives the sum of primes less than or equal to 'n'. Uses binaries from: https://github.com/kimwalisch/primesum";

(* words *)
$EnglishWords::usage = "$EnglishWords is a list of over 450,000 words found in the English language. Uses data from: https://github.com/dwyl/english-words";
