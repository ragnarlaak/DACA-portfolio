import logging
from pathlib import Path

from extract import get_data


BASE_DIR = Path(__file__).resolve().parent
OUTPUT_PATH = BASE_DIR / "output" / "sales_customers_merged.csv"


def main():
    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")

    logging.info("Starting extraction")

    # Laeme andmed Supabase tabelist.
    sales = get_data("sales")
    logging.info("Sales loaded: %s rows", len(sales))

    customers = get_data("customers")
    logging.info("Customers loaded: %s rows", len(customers))

    customer_fields = [
        "customer_id",
        "first_name",
        "last_name",
        "email",
        "phone",
        "city",
        "country",
    ]
    available_customer_fields = [
        column for column in customer_fields if column in customers.columns
    ]

    if "customer_id" not in sales.columns or "customer_id" not in customers.columns:
        raise KeyError("Both sales and customers tables must include customer_id.")

    # Ühendame sales ja customers tabelid customer_id põhjal.
    sales_customers = sales.merge(
        customers[available_customer_fields],
        on="customer_id",
        how="left",
    )
    logging.info("Merge completed: %s rows", len(sales_customers))

    # Salvestame lõpptulemuse output kausta.
    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    sales_customers.to_csv(OUTPUT_PATH, index=False)
    logging.info("Output saved: %s", OUTPUT_PATH)

    logging.info("First 5 rows for validation:")
    print(sales_customers.head())


if __name__ == "__main__":
    main()
