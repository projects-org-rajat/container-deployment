output "subnet_ids" {
  description = "Created subnet IDs"
  value       = values(aws_subnet.this)[*].id
}

output "subnets" {
  value = aws_subnet.this
}