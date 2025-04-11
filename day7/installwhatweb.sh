#!/bin/bash

echo "Updating Termux..."
pkg update -y && pkg upgrade -y

echo "Installing dependencies..."
pkg install -y git ruby

echo "Cloning WhatWeb from GitHub..."
git clone https://github.com/urbanadventurer/WhatWeb.git

cd WhatWeb || { echo "Failed to enter WhatWeb directory"; exit 1; }

echo "Installing Bundler..."
gem install bundler

echo "Installing WhatWeb dependencies..."
bundle install

echo "Setup complete! To run WhatWeb:"
echo "cd WhatWeb && ruby whatweb http://example.com"
