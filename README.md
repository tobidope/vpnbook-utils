# About vpnbook-utils [![Build Status](https://api.travis-ci.org/tobidope/vpnbook-utils.png)](https://travis-ci.org/tobidope/vpnbook-utils)

## What

With this little tool you can generate openvpn config files for the free VPN provider
[vpnbook.com](http://www.vpnbook.com) which are usable in an non interactive environment.
For example your [OpenWRT](https://openwrt.org/) based router. As an added bonus it also
extracts the ever changing credentials from the vpnbook.com website. Add the call to extract
the credentials to yout crontab and you will never have to touch your vpn configs again.

## How

To generate the intial configs do this

	vpnbook config

This will generate a config file for each vpnbook server

 * vpnbook-euro1.ovpn
 * vpnbook-euro2.ovpn
 * vpnbook-uk1.ovpn
 * vpnbook-us1.ovpn
 
and also save user and password in the file `vpnbook.auth`. The files are
ready to be used by openvn.

## Keep credentials up to date

Because vpnbook changes the password frequently you need to always have the latest
password. This can be done by calling

	vpnbook auth -a <authfile>

## Reference

	Usage: vpnbook <command> [parameter]

	Commands are
	    config  Generate OpenVPN configs for non-interactive usage based on configs provided
	            on http://www.vpnbook.com
	    auth    Extract user and password from http://www.vpnbook.com and save to auth-user-pass file
	            (default: ./vpnbook.auth)

	Parameters are
	    -a <file>    Path to the auth_user_pass file (default: ./vpnbook.auth)
	    -c <folder>  Folder where OpenVPN configs are generated (default: ./)
	    -h           Show this help

