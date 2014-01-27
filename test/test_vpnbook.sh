#!/bin/sh
. ../vpnbook

test_extract_credentials() {
	result=$(cat ./testdata/freevpn.html | extract_credentials)
	expected=$(printf "vpnbook\nqe5Egawr")
	assertEquals "$expected" "$result"
}

. ./shunit2-2.1.6/src/shunit2