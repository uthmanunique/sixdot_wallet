import json
from fastapi import APIRouter, Request
# from cachetools import TTLCache, cached
from algosdk.v2client import algod
from algosdk import transaction, wallet, kmd
from algosdk.transaction import PaymentTxn
from .. import schemas, models
from ..instance.config import get_settings


wallets = APIRouter()
# cache = TTLCache(maxsize=100, ttl=300)

algod_address = get_settings().algod_address
algod_token = get_settings().algod_token
algod_client = algod.AlgodClient(algod_token, algod_address)

# Get the node status
# try:
#     status = algod_client.status()
#     print("Node status:", status)
# except Exception as e:
#     print(f"Failed to get node status: {e}")

# Set up a connection to the KMD client
kmd_address = get_settings().kmd_address
kmd_token = get_settings().kmd_token
kmd_client = kmd.KMDClient(kmd_token=kmd_token, kmd_address=kmd_address)



# fund wallet account
@wallets.get("/fund_wallet")
async def fund_wallet():
    """"
    Fund your wallet: Visit the dispencer url
    """
    return {
        "message": "To fund your wallet visit the dispencer url below",
        "algorand dispencer": "https://bank.testnet.algorand.network/"
    }

# get wallet account balance
@wallets.get("/wallet_balance")
async def wallet_balance(wallet_address: str):
    account_info: dict = algod_client.account_info(wallet_address)
    return {
        "Account balance": f"{account_info.get('amount')} microAlgos"
    }

# wallet/send_algo/
# create an unsigned transaction
@wallets.post("/wallet/create_unsigned_txn")
async def unsigned_txn(sender_address: str, receiver_address: str, amount: int, note: str):
    """
    Make payment transaction
    """
    # grab suggested params from algod using client
    # includes things like suggested fee and first/last valid rounds
    params = algod_client.suggested_params()
    unsigned_txn = transaction.PaymentTxn(
        sender=sender_address,
        sp=params,
        receiver=receiver_address,
        amt=amount,
        note=''.join(format(ord(i), '08b') for i in note)
    )
    return unsigned_txn

# # sign transaction
# @wallets.post("/wallet/sign_txn")
# async def sign_txn(wallet_name, wallet_password, wallet_address, unsigned_txn: PaymentTxn):

#     wallet_name = wallet_name
#     wallet_password = wallet_password

#     # Get the wallet ID
#     kmd_wallets = kmd_client.list_wallets()
#     wallet_id = next(wallet for wallet in kmd_wallets if wallet["name"] == wallet_name)["id"]

#     # Get the wallet handle
#     wallet_handle = kmd_client.init_wallet_handle(wallet_id, wallet_password)

#     # get private key
#     address = wallet_address
#     private_key = kmd_client.export_key(wallet_handle, wallet_password, address)

#     # sign transaction
#     signed_txn = unsigned_txn.sign(private_key)

#     # submit transaction
#     txid = algod_client.send_transaction(signed_txn)
#     print("Successfully submitted transaction with txID:", txid)

#     # Wait for confirmation
#     txn_result = transaction.wait_for_confirmation(algod_client, txid, 4)
#     # print("Transaction information:", json.dumps(txn_result, indent=4))
#     return {
#         "Transaction information": json.dumps(txn_result, indent=4)
#     }


# wallets_route.py: - wallet/receive_crypto/
#                   - wallet/view_crypto_balance/

#                   - wallet/top_up_fiat/
#                   - wallet/withdraw_fiat/
#                   - wallet/trasnsfer_fiat/
#                   - wallet/view_fiat_balance/
