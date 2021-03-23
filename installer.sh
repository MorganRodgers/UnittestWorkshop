#!/bin/bash
set -euo pipefail

. "$HOME/.asdf/asdf.sh"
asdf plugin-add python
asdf install python $PYTHON_VERSION
asdf plugin-add dotnet-core
asdf install dotnet-core $DOTNET_VERSION
asdf plugin-add nodejs
asdf install nodejs $NODEJS_VERSION
asdf global nodejs 12.16.3
asdf global python 3.9.2
asdf global dotnet-core 2.1.810
