provider "aws" {
  region = "us-east-1"
}
resource "aws_dynamodb_table" "airplanes" {
  name = "airplanes"
  hash_key = "VIN"
  attibute {
    name = "VIN"
    type = "S"  
    }
}
resource "aws_dynamodb_table_item" "airplane-items" {
  table_name = aws_dynamodb_table.airplanes.name
  hash_key   = aws_dynamodb_table.example.hash_key
  item =  <<EOF

  {
   "Manufacturere : {"S": "Airbus"},
   "Make": {"S": "A380"},
   "Year": {"N": "2009"},
   "VIN" : "D56GT527VL"
  }
EOF
}