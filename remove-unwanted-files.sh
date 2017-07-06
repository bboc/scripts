
prefix=${1:0:9}


if [ "$prefix" = "/Volumes/" ]
then
  echo "removing unwanted files from $1"
  ls -la "$1"
  mdutil -i off "$1"
  cd "$1"
  rm -rf .{,_.}{fseventsd,Spotlight-V*,Trashes}
  mkdir .fseventsd
  touch .fseventsd/no_log .metadata_never_index .Trashes
  cd -
  ls -la $1
else
	echo "Path needs to start with /Volumes/"
fi

