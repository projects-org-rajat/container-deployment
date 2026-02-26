resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = var.tags
}


resource "aws_route" "routes" {

  for_each = {
    for idx, route in var.routes :
    idx => route
  }

  route_table_id = aws_route_table.this.id

  destination_cidr_block = each.value.cidr_block

  gateway_id     = try(each.value.gateway_id, null)
  nat_gateway_id = try(each.value.nat_gateway_id, null)
}