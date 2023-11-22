import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_index_get(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b'Please Enter Your Name' in response.data

def test_index_post(client):
    response = client.post('/', data=dict(name='John'))
    assert response.status_code == 200
    assert b'Hello John, your IP address is' in response.data

