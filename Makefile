.PHONY : clean test deploy all

all : test

deploy : test vpnbook test/* Makefile
	git commit -a
	git push

test : test/shunit2-2.1.6
	cd test && ./test_vpnbook.sh

test/shunit2-2.1.6 :
	wget "https://shunit2.googlecode.com/files/shunit2-2.1.6.tgz" -qO - | tar xz -C test

clean :
	rm *.ovpn *.html vpnbook.auth

