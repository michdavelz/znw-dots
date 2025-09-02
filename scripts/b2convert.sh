#!/usr/bin/env bash
# A quickly made two-liner function to convert
# bool (base 2; binary) values into decimal (base 10) values.
# Accepts as many true/t/yes/y/1 and false/f/no/n/0 inputs as needed.

b2convert() {
    act=$(sed -e 's/\(true\|t\|yes\|y\)/1/Ig' -e 's/\(false\|f\|no\|n\)/0/Ig' -e 's/[[:blank:]]//g' <<< ${@})
    echo $(( 2#$act ))
}
b2convert ${@}
