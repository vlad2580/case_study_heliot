# This variable defines the Google Cloud project ID.
variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = "case-study-heliot"
}

# This variable defines the ID of the BigQuery dataset.
variable "dataset_id" {
  description = "BigQuery Dataset ID"
  type        = string
  default     = "heliot_dataset_yurikov_test"
}

# This variable defines the ID of the table.
variable "table_id" {
  description = "Table ID"
  type        = string
  default     = "my_table_new"
}

