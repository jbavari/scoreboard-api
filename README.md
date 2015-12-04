[![Code Climate](https://codeclimate.com/github/jbavari/scoreboard-api/badges/gpa.svg)](https://codeclimate.com/github/jbavari/scoreboard-api) [![Test Coverage](https://codeclimate.com/github/jbavari/scoreboard-api/badges/coverage.svg)](https://codeclimate.com/github/jbavari/scoreboard-api/coverage)


This is the API server for the scoreboard clients.

This data will feed into a Scoreboard Dashboard, where you can see games played, the teams, and scores of the last 24 hours.

# Get installed

```
# After cloning repo:
bundle
rackup -p 4567
```

## Run and reload on changes

```
gem install rerun
rerun server.rb
```
