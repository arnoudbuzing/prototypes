ExternalInstall["Python", package_String] := RunProcess[{"pip", "install", package}]

ExternalUninstall["Python", package_String] := RunProcess[{"pip", "uninstall", "-y", package}]
