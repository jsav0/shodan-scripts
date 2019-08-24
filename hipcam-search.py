
import shodan

SHODAN_API_KEY = ""
query = "Hipcam"

api = shodan.Shodan(SHODAN_API_KEY)

try:
    # search shodan
    results = api.search(query)

    # show the results
    print('Results found: {}'.format(results['total']))
    for result in results['matches']:
        print('IP: {}'.format(result['ip_str']))
        print(result['data'])
        print('')
except Exception as e:
    print('Error: {}'.format(e))
