# This block defines the Google Cloud provider and specifies the authentication
# credentials, project, and region to be used in the subsequent resources.
provider "google" {
  credentials = file("case-study-heliot-a13784a64ee1.json")
  project     = var.project_id
  region      = "EU"
}

# This block defines a Google BigQuery dataset resource. It sets the dataset_id,
# project, default table expiration time, and location for the dataset.
resource "google_bigquery_dataset" "heliot_dataset_yurikov_test" {
  dataset_id                  = var.dataset_id
  project                     = var.project_id
  default_table_expiration_ms = 3600000
  location                    = "EU"
}

# This block defines a Google BigQuery table resource. It specifies the dataset
# where the table belongs, the table_id, deletion protection, and the schema
# for the table.
resource "google_bigquery_table" "example_table" {
  dataset_id          = google_bigquery_dataset.heliot_dataset_yurikov_test.dataset_id
  table_id            = var.table_id
  deletion_protection = false

  schema = var.table_schema
}
