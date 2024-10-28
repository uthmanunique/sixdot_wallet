from pydantic import BaseModel


class WalletRequest(BaseModel):
    wallet_name: str
    password: str
