provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "airplanes" {
  name = "airplanes"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "PIN"
  attribute {
    name = "PIN"
    type = "S"  
  }
}

resource "aws_dynamodb_table_item" "airplane-types" {
  table_name = aws_dynamodb_table.airplanes.name
  hash_key   = aws_dynamodb_table.airplanes.hash_key
  
  item = jsonencode({
   "PIN" : {"S":"D56GT527VL"},
   "Manufacturer" : {"S": "Airbus"},
   "Year": {"N": "2009"},
   "Make": {"S": "A380"},
   })
}
