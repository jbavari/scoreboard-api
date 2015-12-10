[![Code Climate](https://codeclimate.com/github/jbavari/scoreboard-api/badges/gpa.svg)](https://codeclimate.com/github/jbavari/scoreboard-api) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/jbavari/scoreboard-api/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/jbavari/scoreboard-api/?branch=master) [![Codacy Badge](https://api.codacy.com/project/badge/grade/d1257b2a13fe482e8f1d07df931eb8cf)](https://www.codacy.com/app/jbavari/scoreboard-api)


This is the API server for the scoreboard clients.

This data will feed into a Scoreboard Dashboard, where you can see games played, the teams, and scores of the last 24 hours.

# Get installed

```
# After cloning repo:
bundle
rackup -p 4567
```

## Run and reload on changes

`bundle execute shotgun config.ru`
