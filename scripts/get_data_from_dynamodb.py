import boto3

# Replace these values with your AWS credentials and DynamoDB table name
aws_access_key_id = 'AKIAVZOZSVJUBRBUN3OV'
aws_secret_access_key = 'uPLHLuSSzK7FAPE8LXSDmOlIwlPwVS621vwPQClD'
aws_region = 'us-east-1'
table_name = 'task-dynamodb-table'

# Create a DynamoDB resource
dynamodb = boto3.resource('dynamodb',
                          aws_access_key_id=aws_access_key_id,
                          aws_secret_access_key=aws_secret_access_key,
                          region_name=aws_region)

# Reference the DynamoDB table
table = dynamodb.Table(table_name)

# Define the key(s) you want to use for the query
# For example, if your table has a partition key 'id', you can query by 'id'
key_name = 'id'
key_value = '123'  # Replace with the value you want to query

try:
    # Use the get_item method to retrieve a specific item by its key(s)
    response = table.get_item(
        Key={key_name: key_value}
    )

    # Check if the item was found
    if 'Item' in response:
        item = response['Item']
        print("Item:", item)
    else:
        print(f"Item with {key_name} = {key_value} not found.")

except Exception as e:
    print("Error:", e)
