namespace :deploy do

  desc 'cat release file if file changes'
  task :cat_release do
    on primary fetch(:release_role) do
      filename = fetch(:release_file)
      changes = capture("diff -q #{release_path}/#{filename} #{current_path}/#{filename} | wc -l").to_i
      if changes > 0
        message = capture(:cat, "#{release_path}/#{filename}")
        puts <<-EOF
************************** WARNING ***************************
You need do it on release:
#{message}

Next you just press enter to continue deploy.
Or CTRL+C to stop deploy.
**************************************************************
        EOF
        if fetch(:release_ask)
          ask(:nothing, '')
          fetch(:nothing)
        end
      end
    end
  end

  after 'deploy:updating', 'deploy:cat_release'
end

namespace :load do
  task :defaults do
    set :release_file, fetch(:release_file, 'doc/do_on_release.txt')
    set :release_ask, fetch(:release_ask, true)
    set :release_role, fetch(:release_role, :app)
  end
end
