worker_processes 2

listen "/tmp/.unicorn.sock", :backlog => 64
listen 3000, :tcp_nopush => true

timeout 30

pid "tmp/pids/unicorn.pid"

stderr_path "/var/log/pjeuler/unicorn/stderr.log"
stdout_path "/var/log/pjeuler/unicorn/stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true


before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
