#!/bin/bash
yum install -y httpd

# Install the AWS CLI
yum install -y aws-cli 

# Get the instance ID using the instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`  
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)

# Download the images from S3 bucket
aws s3 cp s3://ak-tf-482114220585/quote.jpg /var/www/html/quote.jpg 

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Hello Terraform -> Server 1</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <img src="quote.jpg" width="250" height="300">
  <p>Have a great day!</p>
  
</body>
</html>
EOF

# Start httpd and enable it on boot
service httpd start
chkconfig httpd on