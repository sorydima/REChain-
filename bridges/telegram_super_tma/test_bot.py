import os
import yaml
import pytest
from logger import log_event, log_error

MAPPINGS_FILE = 'test_mappings.yaml'

def test_config_load():
    with open('config.yaml') as f:
        config = yaml.safe_load(f)
    assert 'telegram' in config
    assert 'matrix' in config
    assert 'bridge' in config

def test_mapping_persistence():
    mappings = {'123': '!room:matrix.org'}
    with open(MAPPINGS_FILE, 'w') as f:
        yaml.safe_dump(mappings, f)
    with open(MAPPINGS_FILE) as f:
        loaded = yaml.safe_load(f)
    assert loaded == mappings
    os.remove(MAPPINGS_FILE)

def test_logger(tmp_path):
    log_file = tmp_path / 'test_bridge.log'
    import logging
    logging.basicConfig(filename=log_file, level=logging.INFO)
    log_event('test event')
    log_error('test error')
    with open(log_file) as f:
        content = f.read()
    assert 'test event' in content
    assert 'test error' in content 