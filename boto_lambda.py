import json
import boto3
import time

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('EAAutoDB')

def lambda_handler(event, context):
    
    now = time.strftime('%m/%d/%Y %H:%M')


    name = event['firstName'] +' '+ event['lastName']
    client_email = event['client_email']
    response = table.put_item(
        Item={
            'ID': client_email,
            'TimeSubmit':now,
            "ClientName": name
            })
    return {
        'statusCode': 200,
        'body': json.dumps('Hello, thank you for contacting me, '+ name + '. I will be in touch within 24 hours.')
    }
