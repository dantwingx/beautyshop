# Railway Deployment - Updated Procfile
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e production
release: bundle exec rake db:migrate

# Note: ./bin/start_server was removed - use direct puma command