#!/bin/bash

[ "$EUID" -ne 0 ] && echo "Please run as root" && exit 1

function installFunc() {
	[ ! -f scan2epub ] && echo "clitemplate not found" && exit 1
	echo "Installing clitemplate to /usr/bin/clitemplate"
	install -Dm 755 scan2epub /usr/bin/scan2epub
}

function uninstall() {
	echo "Uninstalling clitemplate from /usr/bin/clitemplate"
	rm -f /usr/bin/scan2epub
}

case "$1" in
	help) echo "Usage: $0 {install|uninstall}" ;;
	uninstall) uninstall ;;
	*) installFunc ;;
esac
