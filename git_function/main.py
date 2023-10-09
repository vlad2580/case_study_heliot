import os
import json
from google.cloud import bigquery
from google.cloud import storage

# Specify the name of your bucket and the file name in Google Storage
bucket_name = 'test_heliot'
input_file_name = 'inputs.json'
project_id = 'case-study-heliot'
dataset_id = 'heliot_dataset_yurikov_test'
table_id = 'my_table_new'

def read_input_file_from_gcs(bucket_name, file_name):
    # Create a Storage client
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file_name)
    return blob.download_as_text()

def split_json_objects(input_data):
    # Split JSON objects and store them in a list
    json_objects = input_data.split('{"expand":')[1:]
    return ['{"expand":' + obj for obj in json_objects]

def process_json_file(json_data):
    # Convert values to strings
    def convert_to_string(value):
        if value is None:
            return 'None'
        elif isinstance(value, dict) and 'value' in value:
            return value['value']
        else:
            return str(value)

    output_data = {
        "expand": convert_to_string(json_data.get('expand')),
        "id": int(json_data.get('id', 0)),  # Convert "ID" to an integer if it exists
        'key': convert_to_string(json_data.get('key')),
        'self': convert_to_string(json_data.get('self')),
        "project": convert_to_string(json_data['fields'].get('project', {}).get('key')),
        "project_name": convert_to_string(json_data['fields'].get('project', {}).get('name')),
        "issue_type_name": convert_to_string(json_data['fields'].get('issuetype', {}).get('name')),
        "resolution_name": convert_to_string(json_data['fields'].get('resolution')),
        "created_date": convert_to_string(json_data['fields'].get('created')),
        "resolved_date": convert_to_string(json_data['fields'].get('resolutiondate')),
        "severity": convert_to_string(json_data['fields'].get('customfield_11169')),
        "team": convert_to_string(json_data['fields'].get('customfield_11067')),
        "global_release": convert_to_string(json_data['fields'].get('customfield_11089', {}).get('value')) if 'customfield_11089' in json_data['fields'] and json_data['fields']['customfield_11089'] else "None",
        "display_in_big_picture": convert_to_string(json_data['fields'].get('customfield_11079', {}).get('value')) if 'customfield_11079' in json_data['fields'] and json_data['fields']['customfield_11079'] else None,
        "story_points": convert_to_string(json_data['fields'].get('customfield_10026')),
        "priority": convert_to_string(json_data['fields'].get('priority', {}).get('name')),
        "bug_type": convert_to_string(json_data['fields'].get('customfield_11191')),
        "summary": convert_to_string(json_data['fields'].get('summary')),
        "testing_scope": convert_to_string(json_data['fields'].get('customfield_11137')),
        "engineering_area": convert_to_string(json_data['fields'].get('customfield_11130')),
        "automation_test_name": convert_to_string(json_data['fields'].get('customfield_11132')),
        "status": convert_to_string(json_data['fields'].get('status', {}).get('name')),
        "reporter": convert_to_string(json_data['fields'].get('reporter', {}).get('displayName')),
        "assignee_name": convert_to_string(json_data['fields'].get('assignee', {}).get('displayName')) if 'assignee' in json_data['fields'] and json_data['fields']['assignee'] else None,
        "total_acv": convert_to_string(json_data['fields'].get('customfield_10948')),
        "program": convert_to_string(json_data['fields'].get('customfield_11087')),
        "execution_comments": convert_to_string(json_data['fields'].get('customfield_11104')),
        "updated": convert_to_string(json_data['fields'].get('updated')),
        "engineering_feedback": convert_to_string(json_data['fields'].get('customfield_11099')),
        "proposed_text_for_limitation_or_resolved_issue": convert_to_string(json_data['fields'].get('customfield_11118')),
        "customer_request_type": convert_to_string(json_data['fields'].get('customfield_10002')),
        "project_type": convert_to_string(json_data['fields'].get('project', {}).get('projectTypeKey')),
        "channel": convert_to_string(json_data['fields'].get('creator', {}).get('displayName'))
    }

    return json.dumps(output_data)

def upload_processed_files_to_bigquery(project_id, dataset_id, table_id, processed_files):
    try:
        # Create a BigQuery client
        client = bigquery.Client(project=project_id)
        
        # Upload processed data directly to BigQuery
        table_ref = client.dataset(dataset_id).table(table_id)
        errors = client.insert_rows_json(table_ref, processed_files)

        if len(errors) > 0:
            print(f"Error occurred while uploading data to BigQuery: {errors}")
        else:
            print("Data successfully uploaded to the BigQuery table.")
    except Exception as e:
        print(f"Error occurred while uploading data to BigQuery: {e}")

def get_inputs_json(request):
    try:
        input_data = read_input_file_from_gcs(bucket_name, input_file_name)
        json_objects = split_json_objects(input_data)
        processed_files = []
        
        # Processing JSON objects
        for json_obj in json_objects:
            input_data = json.loads(json_obj)
            processed_data = process_json_file(input_data)
            processed_files.append(json.loads(processed_data))  # Convert strings back to JSON objects
        
        # Upload processed data to BigQuery
        upload_processed_files_to_bigquery(project_id, dataset_id, table_id, processed_files)
        
        return "JSON objects split, processed, and uploaded to BigQuery successfully.", 200
    except Exception as e:
        return str(e), 500
