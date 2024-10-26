from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from datetime import timedelta
from .. import schemas, models
from ..instance.config import get_settings


wallets = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)


# wallet/send_crypto/
@wallets.post("/wallet/send_crypto")
async def send_crypto():
    pass

# wallets_route.py: - wallet/receive_crypto/
#                   - wallet/view_crypto_balance/

#                   - wallet/top_up_fiat/
#                   - wallet/withdraw_fiat/
#                   - wallet/trasnsfer_fiat/
#                   - wallet/view_fiat_balance/
