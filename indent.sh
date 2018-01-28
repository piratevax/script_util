#!/bin/bash

sed -r '/^$/d' $1 |
sed -r '3,$ {
    $ ! {
        s/^[^#].*$/    &/g
    }
}' |
sed -r '/(if|for|while).*[^{]$/ {
    n
    s/.*$/    &/
}' |
sed -r '/(if|for|while).*\{$/,/\}$/ {
        s/.*[^{}]$/    &/
}' > sample_recovery.c
