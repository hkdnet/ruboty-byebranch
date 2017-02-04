module Ruboty
  module Byebranch
    module Actions
      class Byebranch < Ruboty::Actions::Base
        def call
          msg = byebranch
          message.reply(msg) unless silent?
        rescue => e
          message.reply(e.message)
        end

        private

        def silent?
          ENV['BYEBRANCH_SILENT']
        end

        def byebranch
          clone_repository
          return "target branch is not exist." unless exist_target_branch?
          delete_target_branches.join("\n")
        end

        def clone_repository
          `rm -rf /tmp/test && mkdir /tmp/test && cd /tmp/test && git clone #{github_url} > /dev/null 2>&1`
          fail "fail clone" unless $?.success?
        end

        def github_url
          user_token = "#{ENV['GITHUB_USER']}:#{ENV['GITHUB_TOKEN']}"
          "https://#{user_token}@github.com/#{message[:user]}/#{message[:repository]}.git"
        end

        def exist_target_branch?
          @branches = `cd /tmp/test/#{message[:repository]} && git branch -r --merged master | grep -v -w #{exclude_branches} | sed -e 's% *origin/%%'`
          fail "fail check target branch" unless $?.success?
          !@branches.split("\n").size.zero?
        end

        def delete_target_branches
          `cd /tmp/test/#{message[:repository]} && git branch -r --merged master | grep -v -w #{exclude_branches} | sed -e 's% *origin/%%' | xargs -I% git push --delete origin % > /dev/null 2>&1`
          fail "fail delete branches" unless $?.success?
          @branches.split("\n").map {|e|"success delete branch - #{e}" }
        end

        def exclude_branches
          message[:exclude_branches].split(',').map {|e|" -e #{e}" }.join
        end
      end
    end
  end
end
