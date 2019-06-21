# pgrst-dev-setup

pgrst-dev-setup is a collection of docker-compose ymls, shell scripts and some config files for a quick workflow to experiment with PostgREST.  
It provides the database, the application and some tooling to help interact with the system. After a session it also saves the docker logs for i.e. debugging purposes.

## Requirements

You need to have `docker` and `docker-compose` installed. If you have `tmuxp` installed, you can also use the session file to a even quicker start.


## Installation

Underlying software installation happens when docker starts the necessary containers. That means you only need to clone this repository to get started.
```bash
git clone https://github.com/Qu4tro/pgrst-dev-setup/
cd pgrst-dev-setup
```
You can change the files inside `data` to change the loaded configurations and the database startup script.

Note: All commands attach to the terminal. If you want to avoid using multiple terminal windows you can use the included `tmuxp` script.

## Usage
```
./start
```
Starts postgres, postgrest and mitmdump (for comprehensive logging). The database is served on the port 5000 and the server on 5001.
Dumps a `logs.txt` with logs from all these three containers after exiting.

---
```
./start <tool>
```
Start one of the available tools. Listing is below.

---
```
./start with-nothing
```
Clean traces of `docker-compose`

---
```
./start tmux
```
Run tmuxp session

## Available Tools

  - ### pgadmin4
      Starts a server on port 5003  
      Points by default to postgres database

  - ### psql
      Points by default to postgres database

  - ### pgcli
      Points by default to postgres database

  - ### http-prompt
      Points by default to postgrest server

  - ### swagger
      Starts a server on port 5003  
      Points by default to postgrest proxy server  

  - ### mitmproxy
      Starts a reverse proxy on port 5002  
      Starts a mitmweb instance on port 5005


## Contributing
Pull requests are welcome.

## License
[MIT](https://choosealicense.com/licenses/mit/)
