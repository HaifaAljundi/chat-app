import requests

def test_content():
    url = 'http://localhost:8080'
    response = requests.get(url)
    assert 'Welcome' in response.text, "'Welcome' not found on the homepage."
    print("Homepage content is as expected.")

if __name__ == '__main__':
    test_content()
