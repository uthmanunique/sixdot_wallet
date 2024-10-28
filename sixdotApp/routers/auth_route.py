from typing_extensions import deprecated
from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from datetime import timedelta
from .. import schemas, models, dependencies
from ..instance.config import get_settings
from algosdk import kmd, wallet


auth_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)

# First, set up a connection to the KMD client
kmd_address = get_settings().kmd_address
kmd_token = get_settings().kmd_token
kmd_client = kmd.KMDClient(kmd_token=kmd_token, kmd_address=kmd_address)


@auth_route.post("/create_wallet")
async def create_wallet(request: Request, wallet_request: models.WalletRequest):
    """Creates wallet for new users

    Args:
        request (Request): _description_
        wallet_request (models.WalletRequest): Pydantic basemodel to get new users wallet name and password

    Returns:
        dict: json response
    """
    #  get wallet name and password
    wallet_name = wallet_request.wallet_name
    wallet_password = wallet_request.password

    if wallet_password:
        # hash password
        hashed_pwd = dependencies.hash_password(wallet_password)
        
        # create new wallet
        new_wallet = wallet.Wallet(wallet_name, wallet_password, kmd_client)

        # Get wallet information
        info = new_wallet.info()
        print(f"Wallet name: {info['wallet']['name']}")

        # Optionally, you can get the mnemonic for the master derivation key
        backup = new_wallet.get_mnemonic()
        # print(f"Mnemonic for master derivation key: {backup}")

    return {
        "message": "Wallet created successfully",
        "Wallet name": info['wallet']['name'],
        "Passphrase": backup
    }

@auth_route.post("/signin")
async def sign_in():
    pass
