import json
import os
import boto3
from google.cloud.devtools import cloudbuild_v1

s3 = boto3.resource('s3')
bucket = 'your S3 bucket'
key = 'your GCP json key'
project_id = 'your GCP project name'
trigger_id = 'your  Cloud Build trigger ID'
repo_name = 'your repo name'
branch_name = 'your branch name'


def lambda_handler(event, context):
    obj = s3.Object(bucket, key)
    data = json.load(obj.get()['Body'])

    with open('/tmp/creds.json', 'w') as json_file:
        json.dump(data, json_file, indent=4)

    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = '/tmp/creds.json'

    client = cloudbuild_v1.CloudBuildClient()
    reposource = cloudbuild_v1.types.RepoSource(project_id=project_id, repo_name=repo_name, branch_name=branch_name)
    client.run_build_trigger(project_id=project_id, trigger_id=trigger_id, source=reposource)