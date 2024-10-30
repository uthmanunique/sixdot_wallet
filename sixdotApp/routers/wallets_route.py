from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from algosdk.v2client import algod
from algosdk import transaction
from .. import schemas, models
from ..instance.config import get_settings


wallets = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)

algod_address = get_settings().algod_address
algod_token = get_settings().algod_token
algod_client = algod.AlgodClient(algod_token, algod_address)



# fund wallet account
@wallets.get("/wallet_fund")
async def wallet_fund():
    """"
    Fund your wallet: Visit the dispencer url
    """
    return {
        "message": "To fund your wallet visit the dispencer url"
    }

# get wallet account balance
@wallets.get("/wallet_balance")
async def wallet_balance(wallet_address: str):
    account_info: dict = algod_client.account_info(wallet_address)
    return {
        "Account balance": f"{account_info.get('amount')} microAlgos"
    }

# wallet/send_crypto/
@wallets.post("/wallet/send_crypto")
async def send_crypto():
    """
    Make payment transaction
    """
    # grab suggested params from algod using client
    # includes things like suggested fee and first/last valid rounds
    params = algod_client.suggested_params()
    unsigned_txn = transaction.PaymentTxn(
        sender=address,
        sp=params,
        receiver=address2,
        amt=1000000,
        note=b"hello world",
    )

# wallets_route.py: - wallet/receive_crypto/
#                   - wallet/view_crypto_balance/

#                   - wallet/top_up_fiat/
#                   - wallet/withdraw_fiat/
#                   - wallet/trasnsfer_fiat/
#                   - wallet/view_fiat_balance/
