require "ruboty/byebranch/actions/byebranch"

module Ruboty
  module Handlers
    # An Ruboty Handler + Actions to delete merged branch.
    class Byebranch < Base
      on /byebranch (?<user>.+?) (?<repository>.+?) (?<exclude_branches>.+?)\z/, name: 'byebranch', description: 'Delete merged branches'
      env :GITHUB_TOKEN, "GitHub API Token"
      env :GITHUB_USER, "GitHub USER"
      env :BYEBRANCH_SILENT, "GitHub USER", optional: true

      def byebranch(message)
        Ruboty::Byebranch::Actions::Byebranch.new(message).call
      end
    end
  end
end
