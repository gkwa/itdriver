# itdriver

## Purpose:

Create rsync script to rsync project to remote host.

## Dependencies

- https://github.com/gruntwork-io/boilerplate?tab=readme-ov-file#boilerplate
- https://github.com/watchexec/watchexec?tab=readme-ov-file#watchexec
- rsync

## Usage

```bash

boilerplate --template-url github.com/gkwa/itdriver --output-folder=. --var ProjectPath=$(pwd)
ls -la .project_*.sh

```
