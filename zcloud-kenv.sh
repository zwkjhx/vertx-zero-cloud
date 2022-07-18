#!/usr/bin/env bash
echo "## >>> Zero Cloud Environment >>>" >> ~/.zshrc
echo "export ZERO_CLOUD=$PWD" >> ~/.zshrc
echo "export PATH=\$PATH:\$ZERO_CLOUD/runtime/istio/bin" >> ~/.zshrc
echo "## >>> Zero Cloud Environment End >>>" >> ~/.zshrc
source ~/.zshrc