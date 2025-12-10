#!/bin/bash

rsync -av --delete --exclude='.git' /home/pauldos-/rootInception/ /home/pauldos-/rootInceptionBackup

cd /home/pauldos-/rootInceptionBackup

git add -A

if ! git diff-index --quiet HEAD; then
        git commit -m "Backup sync $(date +%F)"
        git push
else
        echo "No changes to commit. Backup is up-to-date."
fi
