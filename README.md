# case_study_heliot

This project is designed for scheduled data processing and loading within the GCP environment. The primary components involved are data retrieval from Cloud Storage, processing using Cloud Functions, and uploading to BigQuery.

## Used Technologies

The project utilizes the following technologies:

1. Python 3.11
2. Terraform 1.6.0
3. Google-cloud-bigquery==3.*
4. Google-cloud-storage==2.*

## Components within Google Cloud Platform (GCP)

### 1. Cloud Storage

Cloud Storage is used for storing `inputs.json`.

### 2. BigQuery

BigQuery is utilized for creating a dataset, tables, and storing processed data within them.

### 3. Cloud Functions

Cloud Functions are employed to create a serverless function.

### 4. Cloud Source Repositories

Cloud Source Repositories are used to connect to the GitHub repository and facilitate subsequent function deployment.

### 5. Cloud Scheduler

Cloud Scheduler is responsible for configuring the execution schedule of the function.

# Execution Process

Follow these steps to set up and run the project:

1. Clone the repository to your local machine using the `git clone` command

2. In Cloud Source Repositories, create a new repository and link it to your GitHub repository.

3. On your local machine, create a file named `main.tf` that defines the dataset and table with the specified schema.

4. Initialize Terraform and apply the configuration by running the following commands in your project directory:
`terraform init` /
`terraform apply`

### Main.tf creates:
1. Google Bigquery Dataset
2. Google Bigquery Table
3. Cloud Function
4. Output with a trigger url for this function
5. Cloud Function IAM member
6. Cloud Scheduler job

Note: A credentials file has been created to verify the functionality of the function. Additional functionality will be added soon (see issues).

5. Create a main.py which performs the following tasks:
- Reads an `inputs.json` file from Google Cloud Storage.
- Splits JSON objects and processes them.
- Converts values to strings and prepares the data for upload to BigQuery.
- Uploads the processed data to a specified BigQuery dataset and table.
- The code also includes a Cloud Function that can be triggered to execute the data processing and uploading.

6. Create a `requirements.txt` file specifying the versions of the used libraries.



## Summary
At this point, I'd like to express my gratitude and encourage collaboration on this project. Your contributions and ideas are highly valued. Let's work together to enhance and refine this project further.

If you have any questions, suggestions, or would like to report any issues, please don't hesitate to create or comment on existing issues in the "Issues" tab of this repository. Your feedback is essential in driving the project forward.
