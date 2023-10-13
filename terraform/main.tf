# This block defines the Google Cloud provider and specifies the authentication
# credentials, project, and region to be used in the subsequent resources.
provider "google" {
  credentials = file("case-study-heliot-a13784a64ee1.json")
  project     = var.project_id
  region      = "us-central1"
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



# Define a Google Cloud Function
resource "google_cloudfunctions_function" "git_function_heliot" {
  name    = "git-function-heliot"
  runtime = "python311"
  source_repository {
    url = "https://source.developers.google.com/projects/case-study-heliot/repos/github_vlad2580_case_study_heliot/moveable-aliases/main/paths/git_function/"
  }
  entry_point  = "get_inputs_json"
  project      = var.project_id
  trigger_http = true

  available_memory_mb = 256
  timeout             = 60

}

resource "google_cloudfunctions2_function_iam_member" "allow_acces_tff" {
  project        = var.project_id
  role           = "roles/cloudfunctions.invoker"
  cloud_function = google_cloudfunctions_function.git_function_heliot.name
  member         = "allUsers"

}

# Output the URL of the Cloud Function
output "git_function_heliot_url" {
  value = google_cloudfunctions_function.git_function_heliot.https_trigger_url
}




resource "google_cloud_scheduler_job" "daily_job" {
  name        = "daily_job_8_30"
  description = "Daily scheduled job"
  schedule    = "30 8 * * *"
  time_zone   = "Europe/Prague"
  project     = "case-study-heliot"

  http_target {
    uri         = google_cloudfunctions_function.git_function_heliot.https_trigger_url
    http_method = "GET"
  }
}
