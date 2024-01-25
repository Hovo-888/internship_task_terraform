import boto3


aws_access_key_id = 'AKIAVZOZSVJUBRBUN3OV'
aws_secret_access_key = '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'
aws_region = 'us-east-1'
table_name = 'task-dynamodb-table'


dynamodb = boto3.resource('dynamodb',
                          aws_access_key_id=aws_access_key_id,
                          aws_secret_access_key=aws_secret_access_key,
                          region_name=aws_region)


table = dynamodb.Table(table_name)


key_name = 'id'
key_value = '123'  

try:
    
    response = table.get_item(
        Key={key_name: key_value}
    )

    
    if 'Item' in response:
        item = response['Item']
        print("Item:", item)
    else:
        print(f"Item with {key_name} = {key_value} not found.")

except Exception as e:
    print("Error:", e)
