SH := /usr/local/bin/dash
MARKDOWN := multimarkdown

.PHONY : clean test deploy all doc

all : test doc

doc : README.html

deploy : test vpnbook test/* Makefile
	git commit -a
	git push

test : test/shunit2-2.1.6
	cd test && $(SH) ./test_vpnbook.sh

test/shunit2-2.1.6 :
	wget "https://shunit2.googlecode.com/files/shunit2-2.1.6.tgz" -qO - | tar xz -C test

%.html : *.md
	$(MARKDOWN) $< -o $@

clean :
	$(RM) *.ovpn *.html vpnbook.auth
