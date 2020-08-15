#!/bin/sh

verify_gopher(){
	for ip in $(shodan parse --fields location.country_code,ip_str --separator ' ' gopher-results.json.jz | awk '{print}')
	do
		nc -zv -w3 $ip 70
	done
}

verify_gopher
