resource "aws_route_table_association" "this" {

  for_each = var.subnets

  subnet_id      = each.value.id
  route_table_id = var.route_table_id
}