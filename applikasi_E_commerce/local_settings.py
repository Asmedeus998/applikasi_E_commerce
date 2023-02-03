

STATIC_ROOT = '/usr/share/nginx/lawn/static'
MEDIA_ROOT = '/usr/share/nginx/lawn/media'

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# Host for sending e-mail.
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'lawnecommerce012@gmail.com'
EMAIL_HOST_PASSWORD = 'osrldgbnapdkcfps'
EMAIL_USE_TLS = True

ACCOUNT_EMAIL_SUBJECT_PREFIX = 'lawn ecommerce '
