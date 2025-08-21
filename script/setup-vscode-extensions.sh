#!/bin/bash

echo "Do you want to export or import VSCode extensions? (export/import)"
read action

if [ "$action" == "export" ]; then
  echo "Exporting VSCode extensions..."
  code --list-extensions > vscode-extensions.txt
  echo "Extensions have been exported to vscode-extensions.txt"
elif [ "$action" == "import" ]; then
  echo "Importing VSCode extensions..."
  while IFS= read -r extension; do
    code --install-extension "$extension"
  done < vscode-extensions.txt
  echo "Extensions have been imported from vscode-extensions.txt"
else
  echo "Invalid action. Please choose 'export' or 'import'."
fi
