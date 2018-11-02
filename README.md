# docker_lync

## PRE-INSTALL

```
xhost +local:
touch accounts.xml
```

## EXAMPLE AUTH

```
<?xml version='1.0' encoding='UTF-8' ?>

<account version='1.0'>
	<account>
		<protocol>prpl-sipe</protocol>
		<name>[SIP],[DOMAIN\USER]</name>
		<password>[PASS]</password>
		<alias>[ALIAS]</alias>
		<statuses>
		</statuses>
		<settings>
			<setting name='allow-web-photo' type='bool'>0</setting>
			<setting name='dont-publish' type='bool'>0</setting>
			<setting name='authentication' type='string'>auto</setting>
			<setting name='sso' type='bool'>0</setting>
			<setting name='transport' type='string'>auto</setting>
			<setting name='useragent' type='string'>UCCAPI/4.0.7577.314 OC/4.0.7577.314</setting>
			<setting name='encryption-policy' type='string'>obey-server</setting>
			<setting name='silence-suppression' type='bool'>0</setting>
		</settings>
		<settings ui='gtk-gaim'>
			<setting name='auto-login' type='bool'>1</setting>
		</settings>
		<settings ui='gnt-purple'>
			<setting name='auto-login' type='bool'>1</setting>
		</settings>
		<current_error/>
	</account>
</account>
```

## INSTALL

```
git clone https://github.com/yarmyl/docker_lync.git
cd docker_lync/
mkdir .purple/ && mv ../accounts.xml .purple/
docker build -t docker_lync .
```

## RUN example

```
docker run --restart unless-stopped -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --net=host -p 1112:1112 -d docker_lync
````
