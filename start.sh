echo "CLONING $UPSTREAM_BRANCH of CUSTOM REPO FROM $UPSTREAM_REPO "
git clone -b $UPSTREAM_BRANCH $UPSTREAM_REPO

if [ -n $CONFIG_ENV_URL ]
then
  echo "CONFIG_ENV_URL DETECTED! DOWNLOADING NOW..."
  wget -O config.env $CONFIG_ENV_URL
else
  echo "CONFIG_ENV_URL NOT FOUND!!! YOU WILL HAVE TO ADD CONFIGS MANUALLY"
fi

echo 'INSTALLING REQUIREMENTS...'
pip3 install --disable-pip-version-check -q -U -r requirements.txt

echo "Starting Bot...."
python3 -m bot
