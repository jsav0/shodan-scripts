#!/usr/bin/python3
import shodan

SHODAN_API_KEY = "rIKQGU1wvfBs7wW7VlXMjGu8PFFxWIUo"
query = "Hipcam RealServer/V1.0"

api = shodan.Shodan(SHODAN_API_KEY)

try:
    # search shodan
    results = api.search(query)

    # show the results
    print('Results found: {}'.format(results['total']))
    for result in results['matches']:
        print('{}'.format(result['ip_str']))
except Exception as e:
    print('Error: {}'.format(e))

