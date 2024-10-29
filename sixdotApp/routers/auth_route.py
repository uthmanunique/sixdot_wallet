from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from .. import schemas, models, dependencies
from ..instance.config import get_settings
from algosdk import kmd, wallet, account, mnemonic


auth_route = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)

# Set up a connection to the KMD client
kmd_address = get_settings().kmd_address
kmd_token = get_settings().kmd_token
kmd_client = kmd.KMDClient(kmd_token=kmd_token, kmd_address=kmd_address)


@auth_route.post("/generate_account")
async def generate_account():
    """Generate an account and returns wallet address and passphrase

    Returns:
        dict: json response of wallet information
    """
    # generate an account
    private_key, address = account.generate_account()
    
    print(f"address: {address}")
    print(f"private key: {private_key}")
    # print(f"mnemonic: {mnemonic.from_private_key(private_key)}")

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

@auth_route.post("/import_wallet")
async def import_wallet():
    """Not functional yet
    """
    pass
