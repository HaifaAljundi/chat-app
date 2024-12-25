import requests

def test_homepage():
    url = 'http://localhost:8080'
    response = requests.get(url)
    assert response.status_code == 200, f"Expected status code 200, but got {response.status_code}"
    print("Homepage is accessible and returns status code 200.")

if __name__ == '__main__':
    test_homepage()
