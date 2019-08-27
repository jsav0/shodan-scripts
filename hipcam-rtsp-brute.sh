#!/usr/bin/bash 

# scan for IPs
python3 hipcam-find.py | sed 1,50d > /tmp/1.txt

# bruteforce rtsp urls one at a time
# save the results in 
file=/tmp/1.txt
cat $file | while read line
do
        echo "SCANNING IP $line" 
        nmap -T4 -Pn --script rtsp-url-brute -p 554 $line > /tmp/results.txt
        cat /tmp/results.txt | awk '/discovered/{f=1;next} /other/{f=0} f' | tee -a /tmp/results-short.txt

        echo "END" | tee -a /tmp/results-short.txt
done
