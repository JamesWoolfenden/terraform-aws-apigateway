# Setup

If you don't have and examplea function:

```cli
zip function.zip index.js
aws lambda create-function --function-name examplea --zip-file fileb://function.zip --handler index.handler --runtime nodejs12.x --role arn:aws:iam::680235478471:role/lambda_basic_execution --profile default
```
