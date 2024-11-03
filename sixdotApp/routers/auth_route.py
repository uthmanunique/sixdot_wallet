from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from .. import schemas, models, dependencies
from ..instance.config import get_settings
from algosdk import kmd, wallet, account, mnemonic
# from algokit_utils import get_algod_client, get_kmd_client_from_algod_client


auth_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)



# create wallet
@auth_route.post("/create_wallet")
async def create_wallet(wallet_name: str, wallet_password: str):
    """Create KMD wallet

    Returns:
        dict: json response of wallet information
    """
    # Set up a connection to the KMD client
    kmd_address = get_settings().kmd_address
    kmd_token = get_settings().kmd_token
    kmd_client = kmd.KMDClient(kmd_token=kmd_token, kmd_address=kmd_address)


    # create a wallet object which, if not available yet, also creates the wallet in the KMD
    wlt = wallet.Wallet(wallet_name, wallet_password, kmd_client)

    # get wallet information
    info = wlt.info()
    wallet_name = info['wallet']['name']

    backup = wlt.get_mnemonic()
    print(f"mnemonic for master derivation key: {backup}")

    # CREATE_ACCOUNT
    # create an account using the wallet object
    address = wlt.generate_key()
    print(f"New account: {address}")

    # # store user data
    # record = {
    #     "username": wallet_name,
    #     "wallet_address": imported_account,
    #     "password": hashed_wallet_pin
    # }
    # database.create_new_user(record=record, table_name="users")

    return {
        "message": "Wallet created successfully",
        "Wallet name": wallet_name,
        "Wallet Derivation Key/Mnemonic": backup,
        "account address": address
    }
