from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from datetime import timedelta
from .. import schemas, models
from ..instance.config import get_settings


auth_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)


@auth_route.post("/signup")
async def sign_up():
    #  generate secret phrase
    #  set password
    #  set transaction pin (4)
    pass

@auth_route.post("/signin")
async def sign_in():
    pass
