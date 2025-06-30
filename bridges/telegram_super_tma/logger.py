import logging
import os

SENTRY_DSN = os.environ.get('SENTRY_DSN')
if SENTRY_DSN:
    import sentry_sdk
    sentry_sdk.init(SENTRY_DSN)

logging.basicConfig(
    filename='bridge.log',
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s',
)

def log_event(msg):
    logging.info(msg)

def log_error(msg):
    logging.error(msg)
    if SENTRY_DSN:
        import sentry_sdk
        sentry_sdk.capture_message(msg, level='error') 