#!/usr/bin/env bash
set -e
set -u

usage() {
    echo "Usage: $0 [--ip=<ip_address>]"
    echo
    echo "Optional parameters:"
    echo "  --ip=<ip_address>          IP address of the remote host (if not provided, the user will be prompted)"
    exit 1
}

for i in "$@"; do
    case $i in
    --ip=*)
        ip="${i#*=}"
        shift
        ;;
    *)
        echo "Unknown parameter passed: $i"
        usage
        ;;
    esac
done

if [[ -z ${ip-} ]]; then
    read -r -p "Enter the IP address: " ip
fi

watchexec --watch={{ .ProjectPath }} \
    --user={{ .SSHUser }} \
    --ip="$ip" \
    --source-dir={{ .ProjectPath }} \
    --target-basedir={{ .TargetProjectPath }} \
    {{ .ProjectPath }}/.project_rsync.sh
