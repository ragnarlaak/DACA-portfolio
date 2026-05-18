import logging
import os
from pathlib import Path

import pandas as pd
from dotenv import load_dotenv
from supabase import create_client


PAGE_SIZE = 1000
ENV_PATH = Path(__file__).resolve().parent / ".env"


def get_data(table_name):
    """Load all rows from a Supabase table and return them as a DataFrame."""
    load_dotenv(ENV_PATH)

    supabase_url = os.getenv("SUPABASE_URL")
    supabase_key = os.getenv("SUPABASE_ANON_KEY")

    if not supabase_url or not supabase_key:
        raise ValueError(
            "Missing Supabase settings. Add SUPABASE_URL and SUPABASE_ANON_KEY to your .env file."
        )

    supabase = create_client(supabase_url, supabase_key)

    all_rows = []
    start = 0

    logging.info("Loading table: %s", table_name)

    while True:
        end = start + PAGE_SIZE - 1

        # Kasutame paginationit, sest API tagastab andmed osade kaupa.
        try:
            response = supabase.table(table_name).select("*").range(start, end).execute()
        except Exception:
            logging.exception("Could not load data from table: %s", table_name)
            raise

        rows = response.data or []
        all_rows.extend(rows)

        if len(rows) < PAGE_SIZE:
            break

        start += PAGE_SIZE

    logging.info("Loaded %s rows from %s", len(all_rows), table_name)
    return pd.DataFrame(all_rows)
