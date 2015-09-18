#!/usr/bin/env bash
echo -ne "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: $(expr $(wc -c < $1) - 1)\n\n$(head -c -1 $1)" | netcat -l -p $2
exit 0
