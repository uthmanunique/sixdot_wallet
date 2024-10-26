from .instance.config import get_settings
from supabase import create_client, Client


url: str = get_settings().supabase_url
key: str = get_settings().supabase_key

supabase: Client = create_client(url, key)

def create_a_record(table_name: str, record: dict):
    response = (
        supabase.table(table_name).insert(record).execute()
    )

def bulk_create(table_name: str, records: list[dict]):
    try:
        response = supabase.table(table_name).insert(records).execute()
        return response
    except Exception as exception:
        return exception
