#!usr/bin/env python

import boto3

filename = 'test.txt'

bucket_name = "eng103a-karim-test"

location = {'LocationConstraint': "eu-west-1"}

# Creating a bucket
s3 = boto3.resource('s3')
s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)

# Uploading a file to bucket
s3_client = boto3.client('s3')
s3_client.upload_file(filename, bucket_name, filename)

# Downloading an existing file from bucket
s3.meta.client.download_file(bucket_name, filename, './filename')

# Deleting an existing file
s3.client.delete_object(
)


