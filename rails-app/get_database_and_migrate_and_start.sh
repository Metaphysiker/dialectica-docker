set -e
rm -f /app/tmp/pids/server.pid

bundle exec rails db:migrate
pg_restore --verbose --clean --no-acl --no-owner -d postgres://my_user:ILoveDoingKnowBe4Training!@db:5432/myappdb latest.dump
#postgres://db:5432
#myappdb
echo "after pg_restore"
bundle exec rails server -b 0.0.0.0
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
