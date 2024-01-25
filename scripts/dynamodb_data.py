import boto3


def query_with_gsi():
    aws_access_key = 'AKIAVZOZSVJUBRBUN3OV'
    aws_secret_key = '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'
    region_name = 'us-east-1'
    table_name = 'task-dynamodb-table'
    index_name = 'CategoryIndex'

    dynamodb = boto3.resource('dynamodb', aws_access_key_id=aws_access_key,
                              aws_secret_access_key=aws_secret_key,
                              region_name=region_name)
    table = dynamodb.Table(table_name)

    response = table.query(
        IndexName=index_name,
        KeyConditionExpression='category = :category',
        ExpressionAttributeValues={':category': 'Electronics'}
    )

    items = response['Items']
    print("Query results:")
    for item in items:
        print(item)


if __name__ == "__main__":
    query_with_gsi()
