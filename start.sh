rm -r /RBot
if [ -z $UPSTREAM_REPO ]
then
  echo "COULD NOT FOUND UPSTREAM REPO... EXITING..."
  exit
else
  echo "CLONING CUSTOM REPO FROM $UPSTREAM_REPO "
  git clone -b $UPSTREAM_BRANCH $UPSTREAM_REPO /RBot
fi
cd /RBot
if [ -n $CONFIG_ENV_URL ]
then
  echo "CONFIG_ENV_URL DETECTED! DOWNLOADING NOW..."
  wget -O config.env $CONFIG_ENV_URL
else
  echo "CONFIG_ENV_URL NOT FOUND!!! YOU WILL HAVE TO ADD CONFIGS MANUALLY"
fi

if [ -z $STARTCMD ]
then
  echo "COULD NOT FOUND STARTCMD(bash/python3)... EXITING..."
  exit
fi

if [ -z $STARTFILE ]
then
  echo "COULD NOT FOUND STARTFILE... EXITING..."
  exit
fi

echo 'INSTALLING REQUIREMENTS...'
pip3 install -U -r requirements.txt

echo "Starting Bot...."

if [ $STARTCMD = "bash" ]
then
  bash $STARTFILE
elif [ $STARTCMD = "python3" ]
then
  python3 $STARTFILE
else
  echo "STARTCMD INVALID! ABORTING..."
  echo "STARTCMD INVALID! ABORTING..."
  echo "STARTCMD INVALID! ABORTING..."
  exit
fi
