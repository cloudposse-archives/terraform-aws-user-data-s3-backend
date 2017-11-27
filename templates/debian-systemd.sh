# Install deps

apt-get -y install python-pip

# Install AWS Client
pip install --upgrade awscli

aws s3 cp ${s3_user_data_uri} /tmp/user_data.sh

eval "$(cat /tmp/user_data.sh)"

rm -rf /tmp/user_data.sh