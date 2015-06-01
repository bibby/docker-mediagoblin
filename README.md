# docker-mediagoblin

A basic [mediagoblin](http://mediagoblin.org/) container.

Developed on an Ubuntu host, so sorry about the assumptions there.

## Building

After checking out the repository, run the build script to produce a local **bbby/mediagoblin** image.

```./build.sh```

## Running

You can start the container by running the start script and providing a path to a directory on the docker host you want to use as a data volume. 

```./start.sh /path/to/mg_data```

Using that script, the volume path does not need to exist prior to running.

*or*

If you'd rather start the container the long way, know that the volume will contain the `sqlite` database and a matching directory of public media files. You should provide stubs for these.


Volume Path | Container Path                             
--- | ---
$VOL/mediagoblin.db | /var/lib/mediagoblin/mediagoblin.db
$VOL/public | /var/lib/mediagoblin/user_dev/media/public

```
docker run -d \
  -p 80:6543 \
  -v $VOL:/opt/mediagoblin \
  bbby/mediagoblin
```

## Config

You should edit the mediagoblin.ini to your liking, especially if you want to make use of **SMTP** for answering the required email verification letters to activate your users.

For myself, though, I've been skipping that by adding the privilege to the users directly in the sqlite db.

`insert into core__privileges_users values ( $user_id, 6 )` (where `6` is `active` in `core__privileges`).
