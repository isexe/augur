#!/usr/bin/expect
spawn ./database.sh
expect "Password for user postgres:"
send "2\r"
