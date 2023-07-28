import pytest
from rest_framework.test import APIClient

@pytest.fixture
def client():
    return APIClient()



@pytest.mark.djnago_db
def test_create_book(client):
    response = client.post('/books/', data={'title': 'Война и мир', 'price': '500'}, format='json')

    assert response.status_code == 401


