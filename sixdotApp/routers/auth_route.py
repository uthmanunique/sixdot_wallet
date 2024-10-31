from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from .. import schemas, models, dependencies
from ..instance.config import get_settings
from algosdk import kmd, wallet, account, mnemonic
# from algokit_utils import get_algod_client, get_kmd_client_from_algod_client


auth_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)


@auth_route.post("/generate_account")
async def generate_account():
    """Generate an account and returns wallet address and passphrase

    Returns:
        dict: json response of wallet information
    """
    # generate an account
    private_key, address = account.generate_account()

    # Get wallet passphrase
    passphrase = mnemonic.from_private_key(private_key)
    passphrase = passphrase.split(" ")
    indices =range(1, len(passphrase)+1, 1)
    seed_passphrase = dict(zip(indices, passphrase))

    return {
        "message": "Wallet created successfully",
        "wallet address": address,
        "passphrase": seed_passphrase
    }

# create wallet
@auth_route.post("/import_wallet")
async def import_wallet(wallet_name: str, wallet_pin: str, passphrase: dict):
    """Imports wallet and returns username and wallet address

    Returns:
        dict: json response of wallet information
    """
    # Set up a connection to the KMD client
    kmd_address = get_settings().kmd_address
    kmd_token = get_settings().kmd_token
    kmd_client = kmd.KMDClient(kmd_token=kmd_token, kmd_address=kmd_address)


    # get wallet handle
    wallet_id = kmd_client.list_wallets()[0]["id"]
    wallet_handle = kmd_client.init_wallet_handle(wallet_id, wallet_pin)

    # convert mnemonic to private key
    private_key = mnemonic.to_private_key(" ".join(passphrase.values()))

    # import account to wallet in KMD
    imported_account = kmd_client.import_key(wallet_handle, private_key)

    # release wallet handle
    kmd_client.release_wallet_handle(wallet_handle)

    # hash wallet_pin
    hashed_wallet_pin = dependencies.hash_password(wallet_pin)

    # # store user data
    # record = {
    #     "username": wallet_name,
    #     "wallet_address": imported_account,
    #     "password": hashed_wallet_pin
    # }
    # database.create_new_user(record=record, table_name="users")

    return {
        "message": "Wallet imported successfully",
        "username": wallet_name,
        "wallet address": imported_account
    }
