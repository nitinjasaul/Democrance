resource "aws_key_pair" "democrance-key" {
    key_name		= "democrance-key"
    public_key		= "${file(var.PUBLIC_KEY_PATH)}"
}
