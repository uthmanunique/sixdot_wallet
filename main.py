from fastapi import FastAPI, security
from fastapi.middleware.cors import CORSMiddleware
from . sixdotApp.routers.auth_route import auth_route
from . sixdotApp.routers.wallets_route import wallets
from . sixdotApp.routers.security_route import security_route

# initialize FastAPI app instance
app = FastAPI(title="Sixdot Wallet", description="Welcome to Sixdot Wallet")

# create list of allowed origins
origins = [
    "http://127.0.0.1:8000"
]

# add middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"]
    # allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# add routers to app
app.include_router(auth_route, tags=["Authentication"])
app.include_router(wallets, tags=["Wallet"])
app.include_router(security_route, tags=["Security"])


@app.get("/")
def home():
    return {"msg": "Welcome to Sixdot Wallet 😎"}