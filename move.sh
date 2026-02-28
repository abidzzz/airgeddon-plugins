#!/bin/bash

echo "Moving everything from plugins folder to /usr/share/airgeddon/plugins/..."

# Move all contents of plugins folder to destination
sudo mv plugins/* /usr/share/airgeddon/plugins/

echo "Done."