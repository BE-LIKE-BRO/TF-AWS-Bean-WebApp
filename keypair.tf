resource "aws_key_pair" "key-pair" {
  key_name   = "belikebro"
  public_key = file(var.PUB_KEY_PATH)
}