from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from datetime import timedelta
from .. import schemas, models
from ..instance.config import get_settings


security_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)


# security_route.py: - /{user}/settings/2fa
