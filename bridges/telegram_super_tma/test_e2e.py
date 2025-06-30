from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def test_dashboard_widget():
    options = Options()
    options.add_argument('--headless')
    driver = webdriver.Chrome(options=options)
    driver.get('http://localhost:8080/dashboard_widget.html')
    time.sleep(2)
    status = driver.find_element('id', 'status').text
    assert 'running' in status.lower()
    metrics = driver.find_element('id', 'metrics').text
    assert 'messages_tg_to_matrix' in metrics
    driver.quit()

if __name__ == '__main__':
    test_dashboard_widget()
    print('E2E dashboard widget test passed!') 