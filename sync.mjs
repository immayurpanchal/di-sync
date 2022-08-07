#!/usr/bin/env zx

const branch = argv._[0];
await $`git pull`;
await $`git checkout ${branch}`;
await $`git pull origin ${branch}`;
await $`git checkout -`;
await $`git merge ${branch}`;
