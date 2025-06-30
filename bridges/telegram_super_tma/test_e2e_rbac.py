from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def test_rbac_ui():
    options = Options()
    options.add_argument('--headless')
    driver = webdriver.Chrome(options=options)
    driver.get('http://localhost:8090/rbac')
    time.sleep(2)
    # Search user
    search_box = driver.find_element('name', 'uid')
    search_box.send_keys('123456789')
    driver.find_element('xpath', "//button[text()='Search']").click()
    time.sleep(1)
    assert 'User 123456789' in driver.page_source
    # Assign role
    driver.get('http://localhost:8090/rbac')
    assign_forms = driver.find_elements('action', '/rbac/assign')
    if assign_forms:
        assign_forms[0].find_element('name', 'role').clear()
        assign_forms[0].find_element('name', 'role').send_keys('admin')
        assign_forms[0].find_element('tag name', 'button').click()
    # Logout
    driver.get('http://localhost:8090/logout')
    time.sleep(1)
    assert 'RBAC Management' in driver.page_source
    driver.quit()

if __name__ == '__main__':
    test_rbac_ui()
    print('E2E RBAC UI test passed!') 