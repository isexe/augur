#!/bin/sh
sudo -u postgres psql -h localhost -U postgres -p 5432 -c '\q'
printf '\n'
