#!/bin/sh
. ../vpnbook

${SHUNIT:="./shunit2-2.1.6/src/shunit2"}

oneTimeSetUp() {
	TEST_DATA=$(cat ./testdata/freevpn.html)
}

test_extract_credentials() {
	local result=$(echo "$TEST_DATA" | extract_credentials)
	local expected=$(cat <<-EOF
		vpnbook
		qe5Egawr
		EOF
	)
	assertEquals "$expected" "$result"

	echo "Wrong input" | extract_credentials
	assertEquals 1 $?
}

test_extract_config_urls() {
	local result=$(echo "$TEST_DATA" | extract_config_urls)
	local expected=$(cat <<-EOF
	http://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro1.zip
	http://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-Euro2.zip
	http://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-UK1.zip
	http://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-US1.zip
	EOF
	)
	assertEquals "$expected" "$result"
}

. "$SHUNIT"
