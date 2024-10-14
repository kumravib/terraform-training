resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCynsmYxHqorawSrqrmu+ZhoTSq676K3U6GRxufHfDtoaysaGl4TFV427h4hxSyIwWtrZU6qMegW+qF/ecTmZJSPigfkE7ghr9fE+sQtSz65ZHUOxmbZCdw9b46afZgu8C9jbuiT8FF9Q/0ZdPDvM/8Zp42Wwbybe4tXvEq6xtfP4/XsoTQ4IsW0TyLq8/3CwCoq7TPFytcyoar2Ve7f5JWkPVM6fKWiRvZQuvrVJBFb6sHDi6OWOULTlzU4jmEptT4wi73PbCHjEyRpL0xLAqEymRUjSE8q2xPQQgy8U2qNEwapgnZULjVgr4rFKzeML8lXeDDdwe2WWnUsHtrADPH"
}

resource "aws_instance" "web1" {
  ami           = "ami-0ea3c35c5c3284d82"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  depends_on = [aws_key_pair.deployer]

  tags = {
    Name = "HelloWorld"
  }
}
